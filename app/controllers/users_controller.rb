class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
    @new_idea = Idea.new(user_id: @user.id)

    if @user.ideas.count > 1
      shaker = @user.ideas.collect{|idea|idea.id}.shuffle
      @ideas = [Idea.find(shaker[0]), Idea.find(shaker[1])]
    end

  end
end