class HomeController < ApplicationController

  def index
  	stores = Store.all
  	tmp = Array.new
  	@stores = Array.new
    fullZone = Array.new
  	Time.zone = current_user.timezone
  	date_and_time = Time.zone.now.strftime("%a %H:%M")
  	@user_day = date_and_time[0..2]
  	@user_hour = date_and_time[4..5].to_i
  	@user_minute = date_and_time[7..9].to_i
  	query = params[:query]

  	if query != nil
  		query = params[:query].strip
	  	stores.each do |store|
	  		if (store.zipcode == current_user.zip.to_i) && 
	  			(/#query/ =~ store.name || /#query/ =~ store.type || /#query/ =~ store.description || /#query/ =~ store.tag)
	  		   @stores.push(store)
	  		elsif /#store.zipcode/ =~ current_user.zip.to_i && 
	  			(/#query/ =~ store.name || /#query/ =~ store.type || /#query/ =~ store.description || /#query/ =~ store.tag)
	  			tmp.push(store)
	  		end
	  		tmp.sort_by { |zip| hsh[:zipcode] }.reverse 
	  		@stores.concat tmp
	 	end
	 else
	 	stores.each do |store|
	  		if (store.zipcode == current_user.zip.to_i)
	  		   @stores.push(store)
	  		elsif /#store.zipcode/ =~ current_user.zip.to_i
	  			tmp.push(store)
	  		end
	  		tmp.sort_by { |zip| hsh[:zipcode] }.reverse 
	  		@stores.concat tmp
	 	end
	 end

                                      
                      
	end

	def check_time(x)
		store = x
		if ((convert_days store.fromDay[0..2]) <= (convert_days @user_day)  && (convert_days @user_day) <= (convert_days store.toDay[0..2])) &&
			((convert_hours store.fromHour) <= @user_hour || (convert_hours store.toHour) >= @user_hour) &&
            (store.fromMinute.to_i <= @user_minute || store.toMinute.to_i >= @user_minute)
	 		return true
	 	else
	 		false
	 	end
	end
	helper_method :check_time

private
	def convert_hours(x) 
		hour = x
		ret = case hour
			when "1" then 1
			when "2" then 2
		    when "3" then 3
		    when "4" then 4
			when "5" then 5
			when "6" then 6
		    when "7" then 7
		    when "8" then 8
			when "9" then 9
			when "10" then 10
		    when "11" then 11
			when "12" then 12
			when "13" then 1
			when "14" then 2
		    when "15" then 3
		    when "16" then 4
			when "17" then 5
			when "18" then 6
		    when "19" then 7
		    when "20" then 8
			when "21" then 9
			when "22" then 10
		    when "23" then 11
			when "24" then 12
		end
		return ret 
	end

   def convert_days(x)
  		day = x
		ret = case day
			  when "Sun" then 6
			  when "Sat" then 5
			  when "Fri" then 4
			  when "Thu" then 3
			  when "Wed" then 2
			  when "Tue" then 1
			  when "Mon" then 0
		end
		return ret
	end
end
