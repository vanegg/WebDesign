class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  has_many :questions
  has_many :answers
  has_many :votes

  validates :name, :email, :password_digest, presence: true
  #validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  def self.authenticate(email, user_password)
    user = User.find_by(email: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end

end

