class Post < ActiveRecord::Base
	#attr_accessible :photo, :titulo
	after_save :guardar_foto

	def photo=(file_date)
		unless file_data.blank?
			self.extension= file_data.original_filename.split('.').last.downcase
		end
			
		end

	private
	def guarda_foto
		if @file_date
			FileUtils.mkdir_p FOTOS
			File.open(photo_filename, 'wb') do |f|
				f.write(@file_data.read)
			end
		else 
			@file_data=nill
		end

	end 
end
