class VotesController < ApplicationController

  def voteup
    @vote = Vote.new(vote_params)
  end
  private
		def vote_params
      params.require(:vote).permit(:user_id, :voteable_type, :voteable_id)
    end
end
