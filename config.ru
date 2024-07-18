# frozen_string_literal: true

require 'bundler'
Bundler.require(:default)

require './application'
require './initializers/capybara'
require './initializers/string'

run Application
