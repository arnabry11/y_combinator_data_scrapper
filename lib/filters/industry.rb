# frozen_string_literal: true

require_relative 'base'
require_relative 'concerns/string_filters'

module Filters
  class Industry < Base

    include Concerns::StringFilters

    private

    def name
      'industry'
    end

  end
end
