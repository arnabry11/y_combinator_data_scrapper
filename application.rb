# frozen_string_literal: true

require './lib/scrapper'

class Application < Sinatra::Application
  get '/' do
    erb :index
  end

  post '/api/scrape' do
    csv = Scrapper.new(limit: params['n'], filters: params['filters']).call
    content_type 'application/csv'
    headers['Content-Disposition'] = 'attachment; filename="companies.csv"'

    csv
  end
end
