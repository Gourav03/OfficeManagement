class Profile < ApplicationRecord
  belongs_to :user
  attribute :contact_number, :string
 	validates :name, presence: { message: "must be given please"}
	#validates :contact_number, length: { is: 10 }, on: :update, presence: { message: "must be given in 10 digit"}
	has_attached_file :image,
                  styles: { thumb: ["64x64#", :jpg] },
                  :path => ":rails_root/public/images/:id/:filename",
    							:url  => "/images/:id/:filename"
	validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }, size: { in: 0..500.kilobytes }
                    
end
