# frozen_string_literal: true

require_relative 'base'

module Filters
  class TeamSize < Base

    def url_encode
      start, finish = value.split('-').map(&:strip)
      param_value = "[#{start},#{finish}]"

      "#{name}=#{ERB::Util.url_encode(param_value)}"
    end

    private

    def name
      'team_size'
    end

  end
end
