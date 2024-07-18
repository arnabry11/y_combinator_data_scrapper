# frozen_string_literal: true

require_relative 'filters/batch'
require_relative 'filters/black_founded'
require_relative 'filters/hispanic_latino_founded'
require_relative 'filters/industry'
require_relative 'filters/is_hiring'
require_relative 'filters/nonprofit'
require_relative 'filters/region'
require_relative 'filters/tag'
require_relative 'filters/team_size'
require_relative 'filters/top_company'
require_relative 'filters/women_founded'

class ApplyFilters

  def initialize(url, params)
    @url = url
    @params = params
  end

  def call
    filters = transform_params.map do |name, value|
      next if value.nil? || value.empty?

      filter = "Filters::#{name.classify}".constantize.new(value) rescue nil

      next if filter.nil?

      filter.url_encode
    end

    "#{url}?#{filters.compact.join('&')}"
  end

  private

  attr_reader :url, :params

  def transform_params
    params.each do |name, value|
      # for checkboxes
      if value == 'on'
        params[name] = 'true'
      elsif value == 'off'
        params[name] = 'false'
      end
    end
  end

end
