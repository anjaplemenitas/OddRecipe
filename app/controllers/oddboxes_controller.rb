class OddboxesController < ApplicationController
  def show
    @oddbox = Oddbox.find_by(user_id: params[:id])
  end
end
