# frozen_string_literal: true

module Filters
  class Base

    def initialize(value)
      @value = value
    end

    def url_encode
      raise NotImplementedError
    end

    private

    attr_reader :value

    def name
      raise NotImplementedError
    end

  end
end
