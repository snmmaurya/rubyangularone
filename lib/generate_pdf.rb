module GeneratePdf

	def individual_problem(problems, title)
		filepath = filename(title)
		if pdf_expired?(filepath)
			Prawn::Document.generate(filepath) do
				problems.each do |problem|
					text problem.problem.html_safe
				end
			end
		end
		return filepath
	end

	def individual_lession(lession, title)
		filepath = filename(title)
		if pdf_expired?(filepath)
			Prawn::Document.generate(filepath) do
				text lession.title.html_safe, :size => 12, :style => :bold
				text lession.description.html_safe, :size => 10, :style => :normal
			end
		end
		return filepath
	end


#-----------------------------------------------------------------------------#
	def pdf_expired?(filepath) #Validity of a file is 1 month or 30 days only
		(File.exists?(filepath)) ? (((expired_at = File.ctime(filepath) + (30*24*60*60)) <= Time.now) ? true : false) : true
	end

	def filename(title)
		path = File.join("public/uploads/pdfs", "#{title.gsub(" ", "_")}.pdf")		
	end	
#-----------------------------------------------------------------------------#
end	