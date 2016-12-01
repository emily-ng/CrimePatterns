class PageController < ApplicationController

  def index
  	@s = States.all;
  	@violent_hash = {}
  	@property_hash = {}
  	@drug_hash = {}
 	if params[:year].present?
	   binding.pry
	end
  	if params[:q].present?
	   	 States.where(name: params[:q]).each do |ss|
	   		if ss.year==2005
	   			@a_2005 = Arrests_2005.find_by_sql(["SELECT * FROM arrests_by_state_2005 WHERE arrests_by_state_2005.age = 'Total all ages' AND arrests_by_state_2005.state = ?", ss.name]);
	   			violent_crime = @a_2005.first.violent_crime.to_f
	   			property_crime = @a_2005.first.property_crime.to_f
	   			drug_abuse = @a_2005.first.drug_abuse_violations.to_f
	   		elsif ss.year==2007
	   			@a_2007 = Arrests_2007.find_by_sql(["SELECT * FROM arrests_by_state_2007 WHERE arrests_by_state_2007.age = 'Total all ages' AND arrests_by_state_2007.state = ?", ss.name]);
	   			violent_crime = @a_2007.first.violent_crime.to_f
	   			property_crime = @a_2007.first.property_crime.to_f
	   			drug_abuse = @a_2007.first.drug_abuse_violations.to_f
	   		elsif ss.year==2009
	   			@a_2009 = Arrests_2009.find_by_sql(["SELECT * FROM arrests_by_state_2009 WHERE arrests_by_state_2009.age = 'Total all ages' AND arrests_by_state_2009.state = ?", ss.name]);
	   			violent_crime = @a_2009.first.violent_crime.to_f
	   			property_crime = @a_2009.first.property_crime.to_f
	   			drug_abuse = @a_2009.first.drug_abuse_violations.to_f
	   		elsif ss.year==2011
	   			@a_2011 = Arrests_2011.find_by_sql(["SELECT * FROM arrests_by_state_2011 WHERE arrests_by_state_2011.age = 'Total all ages' AND arrests_by_state_2011.state = ?", ss.name]);
	   			violent_crime = @a_2011.first.violent_crime.to_f
	   			property_crime = @a_2011.first.property_crime.to_f
	   			drug_abuse = @a_2011.first.drug_abuse_violations.to_f
	   		elsif ss.year==2012
	   			@a_2012 = Arrests_2012.find_by_sql(["SELECT * FROM arrests_by_state_2012 WHERE arrests_by_state_2012.age = 'Total all ages' AND arrests_by_state_2012.state = ?", ss.name]);
	   			violent_crime = @a_2012.first.violent_crime.to_f
	   			property_crime = @a_2012.first.property_crime.to_f
	   			drug_abuse = @a_2012.first.drug_abuse_violations.to_f
	   		end	
	   		percapita_violent = (violent_crime/ss.est_pop)*100000
	   		percapita_property = (property_crime/ss.est_pop)*100000 	
	   		percapita_drug = (drug_abuse/ss.est_pop)*100000 	 	   			   			
	     	#Make a hash per crime type in format: {year1=>value1, year2=>value2}
	     	@violent_hash[ss.year] = percapita_violent
	     	@property_hash[ss.year] = percapita_property
	     	@drug_hash[ss.year] = percapita_drug
	   	 end
	   	
  		@states = States.find_by_sql(["SELECT* FROM state WHERE state.name = ?", params[:q]]);
  		@arrests_2012 = Arrests_2012.find_by_sql(["SELECT* FROM arrests_by_state_2012 WHERE arrests_by_state_2012.state = ?", params[:q]]);
  		render "states_partial"
  	end

  end

  def show
  	
  end

end
