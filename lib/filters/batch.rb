# frozen_string_literal: true

require_relative 'base'
require_relative 'concerns/string_filters'

module Filters
  class Batch < Base

    include Concerns::StringFilters

    private

    def name
      'batch'
    end

  end
end
