# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: "Thank you for your testing!"
  end
end
