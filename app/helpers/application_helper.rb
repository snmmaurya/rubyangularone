module ApplicationHelper
	def imagewithpath imagename
		"/uploads/images/#{imagename}"
	end

	def time_format(time_data, format=false)
		begin
			time_data = time_data.to_datetime
			case format
				when true, false
					diff = ((Time.now - time_data) / 86400).to_i
					if diff > 1
						if format
							time_data.strftime("at %H:%M")
						else
							time_data.strftime("%B %d %Y at %H:%M")
						end
					else
						time_ago_in_words(time_data)
					end
	  		when 1
	  			time_data.strftime("%d %b %Y")
	  		when 2
	  			time_data.strftime("%B %d %Y at %H:%M")
	  		else
	  			time_data.strftime("%B %d %Y at %H:%M")
		  end
		rescue
			Time.new.strftime("%B %d %Y at %H:%M")
		end
	end

	def menus
		@menubar = ""
		@menus = [
			{method: :get ,multilebel: false, label: :Home, url: root_path},
			{method: :get ,multilebel: false, label: :Solutions, url: programmers_solutions_path},
			{method: :get ,multilebel: false, label: :Contact, url: contact_path},
			{method: :get ,multilebel: false, label: :Portfolio, url: portfolios_path},
			{method: :get ,multilebel: false, label: :Signup, url: new_user_registration_path},
			{method: :get ,multilebel: false, label: :Signin, url: new_user_session_path},
			{method: :get ,multilebel: true, label: (current_user.username if current_user.present?), nextlevel: [
			{method: :delete ,multilebel: false, label: :Dashboard, url: root_path},
			{method: :get ,multilebel: false, label: :Signout, url: destroy_user_session_path}]},
			{method: :get ,multilebel: false, label: :Home, url: root_path}] 
		@menus.each do |menu|
			@menubar += "<li>#{link_to menu[:label], menu[:url]}</li>"
		end
		@menu
	end

	# def solutions 
	# 	solutions_html =  "<div class='item active'><div class='row'>"
	# 	counter = 1
	# 	Solution.where(status: :ACTIVE).each do |solution|
	# 	solutions_html +=  "<div class='item active'><div class='row'>" if [5,9].include?(counter)
 #    solutions_html += "<div class='col-xs-3'><a href='#{programmers_solution_problems_path(solution)}'>#{(image_tag solution.image, size: "700x400", title: solution.solution, alt: solution.solution, class: "img-responsive")}</a></div>"
	# 	solutions_html +=  "</div></div>" if [4,8].include?(counter)
	# 	counter += 1
	# 	end
	# 	solutions_html.html_safe
	# end

	def solutions 
		solutions_html = ""
		Solution.where(status: :ACTIVE).each do |solution| 
    	solutions_html += "<a href='#{programmers_solution_problems_path(solution)}'><div class='col-sm-2 col-sm-12'> #{(image_tag (solution.image), size: "700x400", title: solution.solution, alt: solution.solution, class: "img-responsive")}</div></a>"
		end
		solutions_html.html_safe
	end

	def admin?
		(current_user && current_user.role_id == 1) ? true : false;
	end

	def dropdown which
		# dropdown = []
		case which
			when :gender
				[[:Male, :Male],[:Female, :Female]]
			when :martial
				[[:Married, :Married],[:Unmarried, :Unmarried]]		
		end
		# dropdown
	end

	def default_image
		"#{root_url}uploads/no-image.jpg"
	end

	def current_menu url
		current_page?(url) ? "active" : ""
		# check namespace also
	end

	def selected url
		current_page?(url) ? "snm-selected" : ""
	end

#------------------------ Method to create Next/Previous options ------------------------#
	def next_object model_name, object
		model = model_name.constantize
		data = model.where("#{model_name.pluralize.downcase}.id > ?", object.id).first
		(data.present?) ? data : object
	end

	def previous_object model_name, object
		model = model_name.constantize
		data = model.where("#{model_name.pluralize.downcase}.id < ?", object.id).last
		(data.present?) ? data : object
	end
#------------------------ Method to create Next/Previous options ------------------------#

	def genders
		[["MALE", "MALE"],["FEMALE", "FEMALE"],["COMMON","COMMON"]]
		# select_tag "credit_card", options_for_select([ "VISA", "MasterCard" ], "MasterCard")
	end
end
