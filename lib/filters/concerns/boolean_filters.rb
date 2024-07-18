# frozen_string_literal: true

module Filters
  module Concerns
    module BooleanFilters

      def url_encode
        return '' unless %w[true false].include?(value)

        "#{name}=#{value}"
      end

    end
  end
end
