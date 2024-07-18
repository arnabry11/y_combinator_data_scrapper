# frozen_string_literal: true

require_relative 'base'
require_relative 'concerns/boolean_filters'

module Filters
  class BlackFounded < Base

    include Concerns::BooleanFilters

    private

    def name
      'highlight_black'
    end

  end
end
