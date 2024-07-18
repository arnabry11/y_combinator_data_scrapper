# frozen_string_literal: true

module Filters
  module Concerns
    module StringFilters

      def url_encode
        "#{name}=#{ERB::Util.url_encode(value)}"
      end

    end
  end
end
