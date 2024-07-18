# frozen_string_literal: true

require 'csv'
require_relative 'apply_filters'

class Scrapper

  DEFAULT_LIMIT = 20
  BASE_URL = 'https://www.ycombinator.com/companies'

  def initialize(limit: nil, filters: {})
    @limit = limit.to_i <= 0 ? DEFAULT_LIMIT : limit.to_i
    @filters = filters
    @companies = []
  end

  def call
    begin
      fetch_page(BASE_URL, filters)
      fetch_companies
    ensure
      close_browser
    end

    generate_csv_string
  end

  private

  attr_reader :limit, :filters, :companies

  def fetch_page(url, filters)
    url = ApplyFilters.new(url, filters).call if filters.any?
    browser.visit(url)
    wait_for_ajax_company_nodes
  end

  def fetch_companies
    while companies.size < limit
      page = Nokogiri::HTML(browser.html)
      company_nodes = page.xpath(company_nodes_xpath)
      break if company_nodes.empty?

      extract_and_transform_company_data(company_nodes)
      load_next_page
    end
  end

  def load_next_page
    remove_processed_company_nodes
    browser.execute_script("window.scrollTo(0, -2)") # slight scroll up to trigger loading of next page
  end

  def generate_csv_string
    return '' if companies.empty?

    CSV.generate do |csv|
      csv << companies.first.keys

      companies.each do |company|
        csv << company.values
      end
    end
  end

  def remove_processed_company_nodes
    script = <<-JS
      var elements = document.querySelectorAll('[class^=\"_company\"]');

      for (var i = 0; i < elements.length; i++) {
        elements[i].remove()
      }
    JS

    browser.execute_script(script)
    wait_for_ajax_company_nodes
  end

  def extract_and_transform_company_data(nodes)
    nodes.map do |company|
      return if companies.size >= limit

      basic_details = extract_basic_company_details(company)
      show_page_details = extract_show_page_details(company)

      companies << basic_details.merge(show_page_details)
    end
  end

  def extract_basic_company_details(company)
    {
      name: company.xpath(".//span[contains(@class, 'coName')]").inner_html,
      location: company.xpath(".//span[contains(@class, 'coLocation')]").inner_html,
      short_description: company.xpath(".//span[contains(@class, 'coDescription')]").inner_html,
      yc_batch: company.xpath(".//a[contains(@href, 'batch=')]").first&.text
    }
  end

  def extract_show_page_details(company)
    company_detail_xpath = '//div[contains(@id, "ShowPage-react-component")]'
    browser.find(:xpath, company.path).click
    browser.find(:xpath, company_detail_xpath) # wait for the detail page to load
    company_detail_page = Nokogiri::HTML(browser.html)
    browser.go_back # return back to index page

    props = JSON.parse(
      company_detail_page.xpath(company_detail_xpath).attr('data-page').value
    )['props']

    {
      website: props['company']['website'],
      founders: props['company']['founders'].map{ |founder| founder['full_name'] }.join(', '),
      founder_linkedins: props['company']['founders'].map{ |founder| founder['linkedin_url'] }.join(', ')
    }
  end

  def wait_for_ajax_company_nodes
    browser.all(:xpath, company_nodes_xpath)
  end

  def company_nodes_xpath
    '//a[contains(@class, "_company")]'
  end

  def browser
    @browser ||= Capybara::Session.new(Capybara.current_driver, Capybara.app)
  end

  def close_browser
    browser.driver.browser.close
  end

end
