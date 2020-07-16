class CallsController < ApplicationController
    before_action :check_current_user
    def index
        @voter = current_user.voters.where(status: "Not Called Yet").first
        if @voter

        else
            redirect_to root_path, alert: "There are currently no voters to call. Please contact Pierce @ pierce.dejong45@gmail.com or (403) 619-2494"
        end

    end


    private
    def check_current_user
        if !current_user
            redirect_to root_path
        end
    end
end
