class CallsController < ApplicationController
    before_action :check_current_user
    def index
        @voter = Voter.first
    end


    private
    def check_current_user
        if !current_user
            redirect_to root_path
        end
    end
end
