class CallsController < ApplicationController
  def index
      @voter = Voter.first
  end
end
