class Teacher < ActiveRecord::Base
	attr_accessor :new_password, :new_password_confirmation, :super_box
  validates :email, uniqueness: true
  validates :new_password, presence: true, length: { in: 6..20 }
  validates :new_password_confirmation, presence: true
  validates :new_password, confirmation: true

  before_save :encrypt_password
  
  private
    def encrypt_password
      self.password = Digest::SHA2.hexdigest(new_password)
    end
end
