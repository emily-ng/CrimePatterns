class PageController < ApplicationController

  def index
  	@s = States.all;
  	@violent_hash = {}
  	@property_hash = {}
  	@drug_hash = {}

    @compare1_hash = {}
    @compare2_hash = {}

  	#SINGLE STATE DATA FORM
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
	   	
  		render "_states_partial"
  	end

  	#COMPARISON FORM
  	if params[:comparison_crime].present?
      case params[:comparison_crime]
      when "Violent"
        States.where(name: params[:state1]).each do |ss|
          if ss.year==2005
            @a_2005 = Arrests_2005.find_by_sql(["SELECT * FROM arrests_by_state_2005 WHERE arrests_by_state_2005.age = 'Total all ages' AND arrests_by_state_2005.state = ?", ss.name]);
            violent_crime = @a_2005.first.violent_crime.to_f
          elsif ss.year==2007
            @a_2007 = Arrests_2007.find_by_sql(["SELECT * FROM arrests_by_state_2007 WHERE arrests_by_state_2007.age = 'Total all ages' AND arrests_by_state_2007.state = ?", ss.name]);
            violent_crime = @a_2007.first.violent_crime.to_f
          elsif ss.year==2009
            @a_2009 = Arrests_2009.find_by_sql(["SELECT * FROM arrests_by_state_2009 WHERE arrests_by_state_2009.age = 'Total all ages' AND arrests_by_state_2009.state = ?", ss.name]);
            violent_crime = @a_2009.first.violent_crime.to_f
          elsif ss.year==2011
            @a_2011 = Arrests_2011.find_by_sql(["SELECT * FROM arrests_by_state_2011 WHERE arrests_by_state_2011.age = 'Total all ages' AND arrests_by_state_2011.state = ?", ss.name]);
            violent_crime = @a_2011.first.violent_crime.to_f
          elsif ss.year==2012
            @a_2012 = Arrests_2012.find_by_sql(["SELECT * FROM arrests_by_state_2012 WHERE arrests_by_state_2012.age = 'Total all ages' AND arrests_by_state_2012.state = ?", ss.name]);
            violent_crime = @a_2012.first.violent_crime.to_f
          end 
          percapita_violent1 = (violent_crime/ss.est_pop)*100000                    
          #Make a hash per crime type in format: {year1=>value1, year2=>value2}
          @compare1_hash[ss.year] = percapita_violent1
        end
        States.where(name: params[:state2]).each do |ss|
          if ss.year==2005
            @a_2005 = Arrests_2005.find_by_sql(["SELECT * FROM arrests_by_state_2005 WHERE arrests_by_state_2005.age = 'Total all ages' AND arrests_by_state_2005.state = ?", ss.name]);
            violent_crime = @a_2005.first.violent_crime.to_f
          elsif ss.year==2007
            @a_2007 = Arrests_2007.find_by_sql(["SELECT * FROM arrests_by_state_2007 WHERE arrests_by_state_2007.age = 'Total all ages' AND arrests_by_state_2007.state = ?", ss.name]);
            violent_crime = @a_2007.first.violent_crime.to_f
          elsif ss.year==2009
            @a_2009 = Arrests_2009.find_by_sql(["SELECT * FROM arrests_by_state_2009 WHERE arrests_by_state_2009.age = 'Total all ages' AND arrests_by_state_2009.state = ?", ss.name]);
            violent_crime = @a_2009.first.violent_crime.to_f
          elsif ss.year==2011
            @a_2011 = Arrests_2011.find_by_sql(["SELECT * FROM arrests_by_state_2011 WHERE arrests_by_state_2011.age = 'Total all ages' AND arrests_by_state_2011.state = ?", ss.name]);
            violent_crime = @a_2011.first.violent_crime.to_f
          elsif ss.year==2012
            @a_2012 = Arrests_2012.find_by_sql(["SELECT * FROM arrests_by_state_2012 WHERE arrests_by_state_2012.age = 'Total all ages' AND arrests_by_state_2012.state = ?", ss.name]);
            violent_crime = @a_2012.first.violent_crime.to_f
          end 
          percapita_violent2 = (violent_crime/ss.est_pop)*100000                   
          #Make a hash per crime type in format: {year1=>value1, year2=>value2}
          @compare2_hash[ss.year] = percapita_violent2
        end
      when "Property"
        States.where(name: params[:state1]).each do |ss|
          if ss.year==2005
            @a_2005 = Arrests_2005.find_by_sql(["SELECT * FROM arrests_by_state_2005 WHERE arrests_by_state_2005.age = 'Total all ages' AND arrests_by_state_2005.state = ?", ss.name]);
            property_crime = @a_2005.first.property_crime.to_f
          elsif ss.year==2007
            @a_2007 = Arrests_2007.find_by_sql(["SELECT * FROM arrests_by_state_2007 WHERE arrests_by_state_2007.age = 'Total all ages' AND arrests_by_state_2007.state = ?", ss.name]);
            property_crime = @a_2007.first.property_crime.to_f
          elsif ss.year==2009
            @a_2009 = Arrests_2009.find_by_sql(["SELECT * FROM arrests_by_state_2009 WHERE arrests_by_state_2009.age = 'Total all ages' AND arrests_by_state_2009.state = ?", ss.name]);
            property_crime = @a_2009.first.property_crime.to_f
          elsif ss.year==2011
            @a_2011 = Arrests_2011.find_by_sql(["SELECT * FROM arrests_by_state_2011 WHERE arrests_by_state_2011.age = 'Total all ages' AND arrests_by_state_2011.state = ?", ss.name]);
            property_crime = @a_2011.first.property_crime.to_f
          elsif ss.year==2012
            @a_2012 = Arrests_2012.find_by_sql(["SELECT * FROM arrests_by_state_2012 WHERE arrests_by_state_2012.age = 'Total all ages' AND arrests_by_state_2012.state = ?", ss.name]);
            property_crime = @a_2012.first.property_crime.to_f
          end 
          percapita_property1 = (property_crime/ss.est_pop)*100000                     
          #Make a hash per crime type in format: {year1=>value1, year2=>value2}
          @compare1_hash[ss.year] = percapita_property1
        end
        States.where(name: params[:state2]).each do |ss|
          if ss.year==2005
            @a_2005 = Arrests_2005.find_by_sql(["SELECT * FROM arrests_by_state_2005 WHERE arrests_by_state_2005.age = 'Total all ages' AND arrests_by_state_2005.state = ?", ss.name]);
            property_crime = @a_2005.first.property_crime.to_f
          elsif ss.year==2007
            @a_2007 = Arrests_2007.find_by_sql(["SELECT * FROM arrests_by_state_2007 WHERE arrests_by_state_2007.age = 'Total all ages' AND arrests_by_state_2007.state = ?", ss.name]);
            property_crime = @a_2007.first.property_crime.to_f
          elsif ss.year==2009
            @a_2009 = Arrests_2009.find_by_sql(["SELECT * FROM arrests_by_state_2009 WHERE arrests_by_state_2009.age = 'Total all ages' AND arrests_by_state_2009.state = ?", ss.name]);
            property_crime = @a_2009.first.property_crime.to_f
          elsif ss.year==2011
            @a_2011 = Arrests_2011.find_by_sql(["SELECT * FROM arrests_by_state_2011 WHERE arrests_by_state_2011.age = 'Total all ages' AND arrests_by_state_2011.state = ?", ss.name]);
            property_crime = @a_2011.first.property_crime.to_f
          elsif ss.year==2012
            @a_2012 = Arrests_2012.find_by_sql(["SELECT * FROM arrests_by_state_2012 WHERE arrests_by_state_2012.age = 'Total all ages' AND arrests_by_state_2012.state = ?", ss.name]);
            property_crime = @a_2012.first.property_crime.to_f
          end 
          percapita_property2 = (property_crime/ss.est_pop)*100000                      
          #Make a hash per crime type in format: {year1=>value1, year2=>value2}
          @compare2_hash[ss.year] = percapita_property2
        end
      when "Drug"
        States.where(name: params[:state1]).each do |ss|
          if ss.year==2005
            @a_2005 = Arrests_2005.find_by_sql(["SELECT * FROM arrests_by_state_2005 WHERE arrests_by_state_2005.age = 'Total all ages' AND arrests_by_state_2005.state = ?", ss.name]);
            drug_abuse = @a_2005.first.drug_abuse_violations.to_f
          elsif ss.year==2007
            @a_2007 = Arrests_2007.find_by_sql(["SELECT * FROM arrests_by_state_2007 WHERE arrests_by_state_2007.age = 'Total all ages' AND arrests_by_state_2007.state = ?", ss.name]);
            drug_abuse = @a_2007.first.drug_abuse_violations.to_f
          elsif ss.year==2009
            @a_2009 = Arrests_2009.find_by_sql(["SELECT * FROM arrests_by_state_2009 WHERE arrests_by_state_2009.age = 'Total all ages' AND arrests_by_state_2009.state = ?", ss.name]);
            drug_abuse = @a_2009.first.drug_abuse_violations.to_f
          elsif ss.year==2011
            @a_2011 = Arrests_2011.find_by_sql(["SELECT * FROM arrests_by_state_2011 WHERE arrests_by_state_2011.age = 'Total all ages' AND arrests_by_state_2011.state = ?", ss.name]);
            drug_abuse = @a_2011.first.drug_abuse_violations.to_f
          elsif ss.year==2012
            @a_2012 = Arrests_2012.find_by_sql(["SELECT * FROM arrests_by_state_2012 WHERE arrests_by_state_2012.age = 'Total all ages' AND arrests_by_state_2012.state = ?", ss.name]);
            drug_abuse = @a_2012.first.drug_abuse_violations.to_f
          end    
          percapita_drug1 = (drug_abuse/ss.est_pop)*100000                     
          #Make a hash per crime type in format: {year1=>value1, year2=>value2}
          @compare1_hash[ss.year] = percapita_drug1
        end
        States.where(name: params[:state2]).each do |ss|
          if ss.year==2005
            @a_2005 = Arrests_2005.find_by_sql(["SELECT * FROM arrests_by_state_2005 WHERE arrests_by_state_2005.age = 'Total all ages' AND arrests_by_state_2005.state = ?", ss.name]);
            drug_abuse = @a_2005.first.drug_abuse_violations.to_f
          elsif ss.year==2007
            @a_2007 = Arrests_2007.find_by_sql(["SELECT * FROM arrests_by_state_2007 WHERE arrests_by_state_2007.age = 'Total all ages' AND arrests_by_state_2007.state = ?", ss.name]);
            drug_abuse = @a_2007.first.drug_abuse_violations.to_f
          elsif ss.year==2009
            @a_2009 = Arrests_2009.find_by_sql(["SELECT * FROM arrests_by_state_2009 WHERE arrests_by_state_2009.age = 'Total all ages' AND arrests_by_state_2009.state = ?", ss.name]);
            drug_abuse = @a_2009.first.drug_abuse_violations.to_f
          elsif ss.year==2011
            @a_2011 = Arrests_2011.find_by_sql(["SELECT * FROM arrests_by_state_2011 WHERE arrests_by_state_2011.age = 'Total all ages' AND arrests_by_state_2011.state = ?", ss.name]);
            drug_abuse = @a_2011.first.drug_abuse_violations.to_f
          elsif ss.year==2012
            @a_2012 = Arrests_2012.find_by_sql(["SELECT * FROM arrests_by_state_2012 WHERE arrests_by_state_2012.age = 'Total all ages' AND arrests_by_state_2012.state = ?", ss.name]);
            drug_abuse = @a_2012.first.drug_abuse_violations.to_f
          end   
          percapita_drug2 = (drug_abuse/ss.est_pop)*100000                     
          #Make a hash per crime type in format: {year1=>value1, year2=>value2}
          @compare2_hash[ss.year] = percapita_drug2
        end
    end
	   render "_comparison_partial"
	end

	#RANKING FORM
	if params[:rank_year].present?
		case params[:rank_year]
		when "2005"
			if params[:rank_crime] == "Violent" 
					rank = Arrests_2005.find_by_sql([
						"SELECT distinct a.state, a.violent_crime FROM arrests_by_state_2005 a WHERE a.age = 'Total all ages'"
					])
			elsif params[:rank_crime] == "Property" 
					rank = Arrests_2005.find_by_sql([
						"SELECT distinct a.state, a.property_crime FROM arrests_by_state_2005 a WHERE a.age = 'Total all ages'"
					])
			else
					rank = Arrests_2005.find_by_sql([
						"SELECT distinct a.state, a.drug_abuse_violations FROM arrests_by_state_2005 a WHERE a.age = 'Total all ages'"
					])		
			end			
		when "2007"
			if params[:rank_crime] == "Violent" 
					rank = Arrests_2007.find_by_sql([
						"SELECT distinct a.state, a.violent_crime FROM arrests_by_state_2007 a WHERE a.age = 'Total all ages'"
					])
			elsif params[:rank_crime] == "Property" 
					rank = Arrests_2007.find_by_sql([
						"SELECT distinct a.state, a.property_crime FROM arrests_by_state_2007 a WHERE a.age = 'Total all ages'"
					])
			else
					rank = Arrests_2007.find_by_sql([
						"SELECT distinct a.state, a.drug_abuse_violations FROM arrests_by_state_2007 a WHERE a.age = 'Total all ages'"
					])		
			end					
		when "2009"
			if params[:rank_crime] == "Violent" 
					rank = Arrests_2009.find_by_sql([
						"SELECT distinct a.state, a.violent_crime FROM arrests_by_state_2009 a WHERE a.age = 'Total all ages'"
					])
			elsif params[:rank_crime] == "Property" 
					rank = Arrests_2009.find_by_sql([
						"SELECT distinct a.state, a.property_crime FROM arrests_by_state_2009 a WHERE a.age = 'Total all ages'"
					])
			else
					rank = Arrests_2009.find_by_sql([
						"SELECT distinct a.state, a.drug_abuse_violations FROM arrests_by_state_2009 a WHERE a.age = 'Total all ages'"
					])		
			end				
		when "2011"	
			if params[:rank_crime] == "Violent" 
					rank = Arrests_2011.find_by_sql([
						"SELECT distinct a.state, a.violent_crime FROM arrests_by_state_2011 a WHERE a.age = 'Total all ages'"
					])
			elsif params[:rank_crime] == "Property" 
					rank = Arrests_2011.find_by_sql([
						"SELECT distinct a.state, a.property_crime FROM arrests_by_state_2011 a WHERE a.age = 'Total all ages'"
					])
			else
					rank = Arrests_2011.find_by_sql([
						"SELECT distinct a.state, a.drug_abuse_violations FROM arrests_by_state_2011 a WHERE a.age = 'Total all ages'"
					])		
			end		
		when "2012"		
			if params[:rank_crime] == "Violent" 
					rank = Arrests_2012.find_by_sql([
						"SELECT distinct a.state, a.violent_crime FROM arrests_by_state_2012 a WHERE a.age = 'Total all ages'"
					])
			elsif params[:rank_crime] == "Property" 
					rank = Arrests_2012.find_by_sql([
						"SELECT distinct a.state, a.property_crime FROM arrests_by_state_2012 a WHERE a.age = 'Total all ages'"
					])
			else
					rank = Arrests_2012.find_by_sql([
						"SELECT distinct a.state, a.drug_abuse_violations FROM arrests_by_state_2012 a WHERE a.age = 'Total all ages'"
					])		
			end			
		end

		rank.collect { |a|
			pop = States.find_by_sql(["SELECT est_pop FROM state WHERE state.year = ? AND state.name = ?",params[:rank_year], a.state]);
			if params[:rank_crime] == "Violent" 
				a.violent_crime = (a.violent_crime.to_f/pop.first.est_pop)*100000			
			elsif params[:rank_crime] == "Property" 
				a.property_crime = (a.property_crime.to_f/pop.first.est_pop)*100000		
			else
				a.drug_abuse_violations = (a.drug_abuse_violations.to_f/pop.first.est_pop)*100000
			end 		
		}

		if params[:rank_crime]=="Violent"
			if params[:hi_lo] == "Highest"
				rank.sort_by!{|a| -a.violent_crime}
			else
				rank.sort_by!{|a| a.violent_crime}
			end	
			@final_rank = rank.take(10)				
			render "_violent_rank_partial"
		elsif params[:rank_crime]=="Property"
			if params[:hi_lo] == "Highest"
				rank.sort_by!{|a| -a.property_crime}
			else
				rank.sort_by!{|a| a.property_crime}
			end		
			@final_rank = rank.take(10)			
			render "_property_rank_partial"
		else
			if params[:hi_lo] == "Highest"
				rank.sort_by!{|a| -a.drug_abuse_violations}
			else
				rank.sort_by!{|a| a.drug_abuse_violations}
			end	
			@final_rank = rank.take(10)		
			render "_drug_rank_partial"
		end			
	end
  #SCATTER PLOT
	if params[:scatter_year].present?
    if params[:scatter_crime] == "Violent"
		  case params[:scatter_year]
		  when "2005"
			 scatter = Arrests_2005.find_by_sql([
					 "SELECT distinct a.state, a.violent_crime, a.drug_abuse_violations FROM arrests_by_state_2005 a WHERE a.age = 'Total all ages'"
					 ])
		  when "2007"
			 scatter = Arrests_2007.find_by_sql([
					 "SELECT distinct a.state, a.violent_crime, a.drug_abuse_violations FROM arrests_by_state_2007 a WHERE a.age = 'Total all ages'"
					 ])			
		  when "2009"
			 scatter = Arrests_2009.find_by_sql([
					 "SELECT distinct a.state, a.violent_crime, a.drug_abuse_violations FROM arrests_by_state_2009 a WHERE a.age = 'Total all ages'"
					 ])		
		  when "2011"
			 scatter = Arrests_2011.find_by_sql([
					 "SELECT distinct a.state, a.violent_crime, a.drug_abuse_violations FROM arrests_by_state_2011 a WHERE a.age = 'Total all ages'"
					 ])
		  when "2012"
			 scatter = Arrests_2012.find_by_sql([
					 "SELECT distinct a.state, a.violent_crime, a.drug_abuse_violations FROM arrests_by_state_2012 a WHERE a.age = 'Total all ages'"
					 ])
		  end
		  scatter.collect { |a|
			 pop = States.find_by_sql(["SELECT est_pop FROM state WHERE state.year = ? AND state.name = ?",params[:scatter_year], a.state]);
			 	 a.violent_crime = (a.violent_crime.to_f/pop.first.est_pop)*100000				
				  a.drug_abuse_violations = (a.drug_abuse_violations.to_f/pop.first.est_pop)*100000		
		  }	
		  @final_scatter = scatter
    else   
      case params[:scatter_year]
      when "2005"
       scatter = Arrests_2005.find_by_sql([
           "SELECT distinct a.state, a.property_crime, a.drug_abuse_violations FROM arrests_by_state_2005 a WHERE a.age = 'Total all ages'"
           ])
      when "2007"
       scatter = Arrests_2007.find_by_sql([
           "SELECT distinct a.state, a.property_crime, a.drug_abuse_violations FROM arrests_by_state_2007 a WHERE a.age = 'Total all ages'"
           ])     
      when "2009"
       scatter = Arrests_2009.find_by_sql([
           "SELECT distinct a.state, a.property_crime, a.drug_abuse_violations FROM arrests_by_state_2009 a WHERE a.age = 'Total all ages'"
           ])   
      when "2011"
       scatter = Arrests_2011.find_by_sql([
           "SELECT distinct a.state, a.property_crime, a.drug_abuse_violations FROM arrests_by_state_2011 a WHERE a.age = 'Total all ages'"
           ])
      when "2012"
       scatter = Arrests_2012.find_by_sql([
           "SELECT distinct a.state, a.property_crime, a.drug_abuse_violations FROM arrests_by_state_2012 a WHERE a.age = 'Total all ages'"
           ])
      end
      scatter.collect { |a|
       pop = States.find_by_sql(["SELECT est_pop FROM state WHERE state.year = ? AND state.name = ?",params[:scatter_year], a.state]);
         a.violent_crime = (a.property_crime.to_f/pop.first.est_pop)*100000        
          a.drug_abuse_violations = (a.drug_abuse_violations.to_f/pop.first.est_pop)*100000   
      } 
      @final_scatter = scatter
	 end 
   render "_scatter_partial"
  end
end 
end
