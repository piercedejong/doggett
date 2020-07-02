class VotersController < ApplicationController
    before_action :check_current_user
  def new
      @voter = Voter.new
  end

  def create
      @voter = Voter.create(new_voter_params)
      @voter.update(user_id: User.first.id)
      respond_to do |format|
          if @voter.save
              format.html { redirect_to voters_path }
          else
              format.html { render 'voters/new' }
              format.json { render json: @user.errors, status: :unprocessable_entity }
          end
      end
  end

  def index
      @voters = Voter.all
  end

  def update
      voter = Voter.find(voter_params[:id])
      voter.update(status: voter_params[:status])
      voter.update(user_id: current_user.id)
      if(voter_params[:status] == "Correct Person")
          voter.update(support: voter_params[:support]+voter_params[:no_support])
          voter.update(sign: voter_params[:sign])
          if(voter_params[:address]=="update")
              voter.update(address: voter_params[:new_address])
          end
          voter.update(volunteer: voter_params[:volunteer])
      end
      redirect_to nextcall_path
  end


  private

  def voter_params
      params.require(:voter).permit(:email, :name, :phone, :status, :id, :sign, :support, :no_support, :address, :new_address, :volunteer)
  end
  def new_voter_params
      params.require(:voter).permit(:email, :name, :phone, :address)
  end

  def check_current_user
      if !current_user
          redirect_to root_path
      end
  end
end
