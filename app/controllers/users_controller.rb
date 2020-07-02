class UsersController < ApplicationController
    before_action :check_current_user
    def new
        @user = User.new
    end

    def create
        if !(User.find_by(email: user_params[:email]))
            @user = User.create(user_params)
            respond_to do |format|
                if @user.save
                    cookies.permanent.signed[:permanent_user_id] = @user.uuid
                    session[:user_id] = @user.uuid
                    format.html { redirect_to root_path }
                else
                    format.html { render 'welcome/index' }
                    format.json { render json: @user.errors, status: :unprocessable_entity }
                end
            end
        else
            @user = User.find_by(email: user_params[:email])
            # Kepp the user signed in at all times
            cookies.permanent.signed[:permanent_user_id] = @user.uuid
            session[:user_id] = @user.uuid
            # Go back to root path
            redirect_to root_path
        end
    end




    private

    def user_params
        params.require(:user).permit(:email, :name, :phone)
    end

    def check_current_user
        if !current_user
            redirect_to root_path
        end
    end
end
