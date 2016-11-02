class Gallery < ApplicationRecord
	
	has_many :pictures, :dependent => :destroy_all
end
