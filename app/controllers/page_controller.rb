class PageController < ApplicationController
  def index
  	@states = States.all;
  end

  def show
  	
  end
end
