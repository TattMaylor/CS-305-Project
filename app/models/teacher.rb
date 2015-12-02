class Teacher < ActiveRecord::Base
	attr_accessor :new_password, :new_password_confirmation, :super_box

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, uniqueness: true, presence: true
  validates :new_password, presence: true, length: { in: 6..20 }
  validates :new_password_confirmation, presence: true
  validates :new_password, confirmation: true, presence: true

  before_save :encrypt_password
  
  private
    def encrypt_password
      self.password = Digest::SHA2.hexdigest(new_password)
    end
end
