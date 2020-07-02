class CallsController < ApplicationController
    before_action :check_current_user
    def index
        @voter = Voter.where(status: "Not Called Yet").first
        if @voter
            @voter.update_column(:status, "Currently Calling")
        else
            redirect_to root_path, alert: "There are currently no voters to call"
        end

    end


    private
    def check_current_user
        if !current_user
            redirect_to root_path
        end
    end
end
