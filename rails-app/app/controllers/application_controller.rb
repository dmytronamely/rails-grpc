class ApplicationController < ActionController::API
  before_action :set_hello_message, :set_bye_message

  private

  def set_hello_message
    @hello_message = Services::Greeter.say_hello(
      message: Services::Greeter.say_hello(message: SecureRandom.uuid).message
    ).message
  end
  
  def set_bye_message
    @bye_message = Services::Greeter.say_bye(
      message: Services::Greeter.say_bye(message: SecureRandom.uuid).message
    ).message
  end  
end
