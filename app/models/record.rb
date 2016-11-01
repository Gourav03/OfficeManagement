class Record < ApplicationRecord
  belongs_to :user
  attribute :date, :date  
  attribute :total_working_hours, :float 

end
