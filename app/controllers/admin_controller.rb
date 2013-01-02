class AdminController < ApplicationController
   before_filter :authenticate_user! 
    #menu for all the setup commands, user admin etc.
    def index
        
    end
end
