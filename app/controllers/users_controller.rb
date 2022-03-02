class UsersController < ApplicationController
  def show
    @oddbox = current_user.oddbox
  end
end
