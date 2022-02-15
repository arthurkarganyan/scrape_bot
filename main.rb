require 'pry'
require_relative 'init_driver'

class SomeWebSite
  include Capybara::DSL
  def call
    visit('https://bot.sannysoft.com/')
    binding.pry
  end
end

SomeWebSite.new.call

