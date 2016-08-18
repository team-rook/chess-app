class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def hello_world
    Pusher.trigger('test_channel', 'my_event', {
      message: 'hello world'
    })
  end
end


