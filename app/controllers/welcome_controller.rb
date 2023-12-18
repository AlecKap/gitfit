class WelcomeController < ApplicationController
  def index
    @movements = Movement.all
  end
end