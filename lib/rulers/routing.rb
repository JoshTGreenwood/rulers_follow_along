# rulers/lib/routing.rb
module Rulers
  class Application
    def get_controller_and_action(env)
      _, controller, action, ater = env["PATH_INFO"].split('/', 4)
      controller.capitalize!      # "People"
      controller += "Controller"  # "PeopleController"

      [Object.const_get(controller), action]
    end
  end
end
