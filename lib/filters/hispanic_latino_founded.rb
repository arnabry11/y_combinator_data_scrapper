# frozen_string_literal: true

require_relative 'base'
require_relative 'concerns/boolean_filters'

module Filters
  class HispanicLatinoFounded < Base

    include Concerns::BooleanFilters

    private

    def name
      'highlight_latinx'
    end

  end
end
