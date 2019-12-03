# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  ### the background dictates where each of the scenario/features will begin with, so in this case, for views test it'll "visit" the new_user_url (aka the sign up page, or the users#new)
  background :each do
      visit new_user_url
  end

  scenario 'has a new user page' do
    expect(page).to have_content('Sign Up')
    ### testing if "Sign Up" is anywhere in the new page
  end

  feature 'signing up a user' do
    ### this is similar to the lecture today
    scenario 'take a username and password' do
      expect(page).to have_content('Username')
    ### SO, I actually tested the whole, Username and id: username, then wrote the expect page content to be small caps. Turns out it FAILED, but claims it found it in small caps. This means you HAVE to make whatever RENDER equal to the actual thing inside this content bracket, RENDER meaning the HTML output you can SEE on the page.
      expect(page).to have_content('Pass')
      ### setting the above to password DID NOT pass the spec

      ### Conclusion PAGE CONTENT will ONLY read what's rendered on the page, not anything in html element tags

    end
    scenario 'shows username on the homepage after signup' do
      fill_in 'Username', with: 'helen'
      fill_in 'Password', with: 'password'      

      click_button 'Create User' ### Remember this has to be the SAME as the value in your input button, so if you fail the spec, double check the value they want

      expect(page).to have_http_status(:success) ### just means it's filled in right
      expect(page).to have_content('helen')
      user = User.find_by(username: 'helen')
      expect(current_path).to eq(user_path(user))
      ### i'm pretty sure user_path is just capybara's way of doing user_url, so here it's just checking if the current page is exactly the same as user_url(user) (aka the show page)
    end
  end
end

feature 'logging in' do
  # background :each do
  #     visit user_url(1)
  # end

  scenario 'shows username on the homepage after login' do
    ### Remember I have a logged in feature, in application (every webpage), that says "Hello, Username(capitalized)?"
    expect(page).to have_content('Hello') 
    ### my cheesy way of testing it, should actually probably define a user using fill_in etc etc, or test a sign in page, then test if username.capitalize = current_user.username.capitalize :)
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end