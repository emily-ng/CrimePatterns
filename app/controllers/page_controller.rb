class PageController < ApplicationController

  def index
  	if params[:q] == 'Alabama'
  		@states = States.find_by_sql("SELECT* FROM state WHERE state.name = 'Alabama'");
  		@arrests_2012 = Arrests_2012.find_by_sql("SELECT* FROM arrests_by_state_2012 WHERE arrests_by_state_2012.state = 'Alabama'");
  		render "states_partial"
  	end

  end

  def show
  	
  end

  def update

  end



end
