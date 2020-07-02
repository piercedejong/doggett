class VotersController < ApplicationController
  def new
  end

  def create
  end

  def update
      binding.pry
      voter = Voter.find(voter_params[:id])
      voter.update(voter_params)
      binding.pry
  end


  private

  def voter_params
      params.require(:voter).permit(:email, :name, :phone, :status, :id, :sign)
  end
end
