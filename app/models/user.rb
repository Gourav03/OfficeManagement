class User < ApplicationRecord

	has_one :profile
  has_one :record
  attribute :role, :integer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
       :recoverable, :rememberable, :trackable, :validatable, :confirmable,
        :lockable
 

  after_create :create_profile
  

  def create_profile
  	self.build_profile(name: self.email.split('@')[0])
  	self.profile.save
  end

 end