# -*- encoding: utf-8 -*-

Given(/^I am a connected user$/) do
  @pseudo = "Johndoe"
  @email = "johndoe@gmail.com"
  @password = "password"
  @user_id = User.create(pseudo: @pseudo, email: @email, password: @password).id
  visit new_user_session_path
  fill_in "Email", :with => @email
  fill_in "Password", :with => @password
  click_button "Sign in"
end

Given(/^I have no idea$/) do
  user = User.find @user_id
  user.ideas.delete_all
end

Then(/^I should have (\d+) idea$/) do |arg1|
  user = User.find @user_id
  user.ideas.count.should == arg1.to_i
end

When(/^I visit my main page$/) do
  visit user_path(User.find(@user_id))
end

Then(/^I should have the idea in my ideas box$/) do
  user = User.find @user_id
  idea = Idea.find @idea_id

  user.ideas.should include(idea)
end

Given(/^I have (\d+) different ideas in my box$/) do |arg1|
  user = User.find @user_id
  if user.ideas.count < 10
    until user.ideas.count == 10 do
      Idea.create(user_id: @user_id, text: "Idée n°#{user.ideas.count + 1}")
    end
  elsif user.ideas.count > 10
    until user.ideas.count == 10 do
      user.ideas.pop
    end
  end
end

Then(/^I should see (\d+) of my ideas$/) do |nb|
  included_ideas_count = 0
  user = User.find @user_id
  user.ideas.each do |idea|
    included_ideas_count = included_ideas_count + 1 if page.body.include?(idea.text)
  end
  included_ideas_count.should == nb.to_i
end