class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if !(User.find_by(email: user_params[:email])) && !(User.find_by( phone: user_params[:phone]))
            @user = User.create(user_params)
            respond_to do |format|
                if @user.save
                    cookies.permanent.signed[:permanent_user_id] = @user.uuid
                    session[:user_id] = @user.uuid
                    voters = Voter.where(user_id: User.first.id).where(status: "Not Called Yet").limit(50)
                    if voters
                        voters.all.each do |v| v.update(user_id: @user.id) end
                    end

                    format.html { redirect_to root_path }
                else
                    format.html { render 'welcome/index' }
                    format.json { render json: @user.errors, status: :unprocessable_entity }
                end
            end
        else
            @user = User.find_by(email: user_params[:email], phone: user_params[:phone])
            if @user
                # Kepp the user signed in at all times
                cookies.permanent.signed[:permanent_user_id] = @user.uuid
                session[:user_id] = @user.uuid
                # Go back to root path
                redirect_to root_path
            else
                respond_to do |format|
                    format.html { render 'welcome/index' }
                    flash[:alert] = "This Email and Phone combination does not match any records. Please ensure you have entered both in correctly."
                end

            end

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
