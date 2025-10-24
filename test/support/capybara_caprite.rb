# test/support/capybara_cuprite.rb
require "capybara/rails"
require "capybara/cuprite"

puts "LOADING SUPPORT"

Capybara.register_driver(:cuprite_rails) do |app|
  Capybara::Cuprite::Driver.new(app,
                                window_size: [1920, 1080],
                                headless: false
                               )
end
Capybara.javascript_driver = :cuprite_rails
