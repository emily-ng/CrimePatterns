class PageController < ApplicationController

  def index

  	@s = States.all;

  	if params[:q].present?
  		@result = {}
	   	 States.where(name: params[:q]).each do |ss|
	   		if ss.year==2005
	   			@target = Arrests_2005.find_by_sql(["SELECT * FROM arrests_by_state_2005 WHERE arrests_by_state_2005.state = ?", ss.name]);
	   		
	   		elsif ss.year==2007
	   			@target = Arrests_2007.find_by_sql(["SELECT * FROM arrests_by_state_2007 WHERE arrests_by_state_2007.state = ?", ss.name]);
	   		
	   		elsif ss.year==2009
	   			@target = Arrests_2009.find_by_sql(["SELECT * FROM arrests_by_state_2009 WHERE arrests_by_state_2009.state = ?", ss.name]);
	   	
	   		elsif ss.year==2011
	   			@target = Arrests_2011.find_by_sql(["SELECT * FROM arrests_by_state_2011 WHERE arrests_by_state_2011.state = ?", ss.name]);
	   		
	   		elsif ss.year==2012
	   			@target = Arrests_2012.find_by_sql(["SELECT * FROM arrests_by_state_2012 WHERE arrests_by_state_2012.state = ?", ss.name]);
	   		end	
	   		value = (@target.first.violent_crime.to_f/ss.est_pop)  
	   				   			   			   		
	      @result[ss.year] = value
	   	 end	
  		@states = States.find_by_sql(["SELECT* FROM state WHERE state.name = ?", params[:q]]);
  		@arrests_2012 = Arrests_2012.find_by_sql(["SELECT* FROM arrests_by_state_2012 WHERE arrests_by_state_2012.state = ?", params[:q]]);
  		render "states_partial"
  	end

  end

  def show
  	
  end

end
