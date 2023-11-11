class MainController < ApplicationController
  # include ActionView::Layouts
  include ActionController::MimeResponds
  # include ActionController::Rendering
  include ActionController::Helpers

  # layout 'application', only: [:index]
  # layout false

  def index
    respond_to do |format|
      format.json  do 
        # sleep(timeout)
        render json: data 
      end
      format.xml   { render xml: data }
      format.html  { render :index, layout: 'application' }
    end  
  end

  private 

  def timeout
    @timeout ||= rand(0..4)
  end  

  def data
    {
      version: '0.0.1',
      timeout: timeout,
      object_id: GRPC_STUB.stub.object_id,
      ruby: RUBY_VERSION,
      rails: Gem.loaded_specs['rails'].version.version,
      puma: Gem.loaded_specs['puma'].version.version,
      grpc: Gem.loaded_specs['grpc'].version.version,
      protobuff: Gem.loaded_specs['google-protobuf'].version.version,
      message: {
        hello: @hello_message,
        bye: @bye_message  
      } 
    }
  end  
  helper_method :data
end
