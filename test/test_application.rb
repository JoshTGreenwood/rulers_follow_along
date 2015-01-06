# rulers/test/test_application.rb
require_relative 'test_helper'

class ControllerController < Rulers::Controller
  def initialized(env)
    @env = env
  end

  def action
  end
end

class TestApp < Rulers::Application
end

class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    app = TestApp.new
  end

  def test_request
    get '/controller/action'

    assert last_response.ok?
  end

  def test_404_on_favicon
    get '/favicon.ico'
    assert !last_response.ok?
  end
end
