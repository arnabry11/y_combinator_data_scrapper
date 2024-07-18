# frozen_string_literal: true

require_relative 'base'
require_relative 'concerns/boolean_filters'

module Filters
  class Nonprofit < Base

    include Concerns::BooleanFilters

    private

    def name
      'nonprofit'
    end

  end
end
