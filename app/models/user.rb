class User < ActiveRecord::Base
  has_secure_password
  def name
    "#{self.first_name} #{self.last_name}"
  end

 

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {within: 7..40}
  validates :password_confirmation, presence: true
  before_save :to_lowercase
  
  def to_lowercase
    self.email.downcase!
 end

 def self.authenticate_with_credentials(email, password)
  
  @user = User.find_by_email(email.downcase.strip)
  if @user && @user.authenticate(password)
    @user
  else
    nil  
  end
end

end
