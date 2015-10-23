class Student < ActiveRecord::Base
	attr_accessor :new_password, :new_password_confirmation

  validates :sid, presence: true, uniqueness: true
  validates :new_password, presence: true, length: { in: 6..20 }
  validates :new_password_confirmation, presence: true
  validates :new_password, confirmation: true
end
