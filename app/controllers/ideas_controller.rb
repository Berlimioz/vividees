class IdeasController < ApplicationController
  before_filter :authenticate_user!

  def create
    Idea.create(params[:idea].merge({user_id: current_user.id}))
    respond_to do |format|
      format.html{redirect_to user_path(current_user)}
    end
  end
end