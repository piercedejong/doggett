class VotersController < ApplicationController
    before_action :check_current_user
  def new
  end

  def create
  end

  def index
      @voters = Voter.all
  end

  def update
      voter = Voter.find(voter_params[:id])
      voter.update(status: voter_params[:status])
      if(voter_params[:status] == "Correct Person")
          voter.update(support: voter_params[:support]+voter_params[:no_support])
          voter.update(sign: voter_params[:sign])
          if(voter_params[:address]=="update")
              voter.update(address: voter_params[:new_address])
          end
          voter.update(volunteer: voter_params[:volunteer])
      end

      binding.pry

      redirect_to voters_path
  end


  private

  def voter_params
      params.require(:voter).permit(:email, :name, :phone, :status, :id, :sign, :support, :no_support, :address, :new_address, :volunteer)
  end
  
  def check_current_user
      if !current_user
          redirect_to root_path
      end
  end
end
