# frozen_string_literal: true

require_relative 'base'
require_relative 'concerns/boolean_filters'

module Filters
  class TopCompany < Base

    include Concerns::BooleanFilters

    private

    def name
      'top_company'
    end

  end
end
