ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    Dir[File.expand_path("support/**/*.rb", __dir__)].sort.each { |f| require f }
    
    def login
      get "/session/new"
      assert_dom "h1", "Sign in"

      # post the login and follow through to the home page
      post session_path, params: { email_address: users(:one).email_address,
                                  password: "password" }

      follow_redirect!
      assert_equal 200, status
    end

  end

end
