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

  def reset_calling_voters
      @v = Voter.where(status: "Currently Calling").all.each do |v|
          v.update_column(:status, "Not Called Yet")
      end
      redirect_to voters_path
  end

  def index
      if current_user.admin
           @voters = Voter.all
      else
           # @voters = Voter.where(user_id: current_user.id)
            @voters = Voter.all
      end

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
              voter.update(city: voter_params[:city])
              voter.update(state: voter_params[:state])
              voter.update(zip5: voter_params[:zip5])
          end
          voter.update(volunteer: voter_params[:volunteer])
      end
      redirect_to nextcall_path
  end

  def import
      Voter.import(params[:file])
      redirect_to voters_path
  end


  private

  def voter_params
      params.require(:voter).permit(:email, :name, :phone, :status, :id, :sign, :support, :no_support, :address, :new_address, :volunteer, :city, :state, :zip5)
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
