class User < ApplicationRecord

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true
  
  def self.authenticate_with_credentials(email, password)
    email = email.strip
    email = email.downcase
    user = self.find_by_email(email)
    pp user.authenticate(password)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
    
  def self.find_by_email(email)
    User.where('lower(email) = ?', email.downcase).first
  end
end
