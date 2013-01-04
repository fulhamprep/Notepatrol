class ApplicationController < ActionController::Base
  protect_from_forgery

  #mobile
  include Mobylette::RespondToMobileRequests

    
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

    #to tidy up login
    layout :layout_by_resource

    protected

    def layout_by_resource
        if devise_controller?
            "devise_layout"
        else
            "application"
        end
    end
end
