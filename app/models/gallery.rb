class Gallery < ApplicationRecord
	
	has_many :pictures, :dependent => :delete_all
end
