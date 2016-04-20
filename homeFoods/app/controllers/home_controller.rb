class HomeController < ApplicationController

  def index
  	stores = Store.all
  	tmp = Array.new
  	@stores = Array.new

	  	stores.each do |store|
	  		if store.zipcode == current_user.zip.to_i
	  		   @stores.push(store)
	  		elsif /#store.zipcode/ =~ current_user.zip.to_i
	  			tmp.push(store)
	  		end
	  		tmp.sort_by { |zip| hsh[:zipcode] }.reverse 
	  		@stores.concat tmp
	 	end
                                      
                      
	end

	def check_time store
		time = Time.new
		if ((convert_days store.fromDay) <= time.day && time.day <= (convert_days store.toDay)) && 
			((convert_hours store.fromHour) <= time.hour && time.hour <= (convert_hours store.toHour)) && 
	 		(store.fromMinute.to_i <= time.min && time.min <= store.toMinute.to_i)
	 		return true
	 	else
	 		false
	 	end
	end

	def convert_hours hour
		case hour
			when hour == "1"
			  return 13
			when hour == "2"
			  return 14
		    when hour == "3"
			  return 16
		    when hour == "4"
			  return 17
			when hour == "5"
			  return 18
			when hour == "6"
			  return 19
		    when hour == "7"
			  return 20
		    when hour == "8"
			  return 21
			when hour == "9"
			  return 22
			when hour == "10"
			  return 23
		    when hour == "11"
			  return 24
		end
	end

  def convert_days day
		case day
			when day == "Sunday"
			  return 0
			  when day == "Saturday"
			  return 1
			  when day == "Friday"
			  return 2
			  when day == "Thursday"
			  return 3
			  when day == "Wednesday"
			  return 4
			  when day == "Tuesday"
			  return 5
			  when day == "Monday"
			  return 6
		end
	end

end
