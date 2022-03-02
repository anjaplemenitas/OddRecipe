class OddboxesController < ApplicationController
  def show
    @oddbox = Oddbox.find(params[:id])
  end
end
