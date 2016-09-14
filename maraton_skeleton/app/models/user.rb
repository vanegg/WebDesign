class User < ActiveRecord::Base
  # Remember to create a migration!
      # ej. User.authenticate('fernando@codea.mx', 'qwerty')
validates :name, :email, :password, presence: true
#validates :email, uniqueness: true
validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

has_many :rounds

  def self.authenticate(email, password)
    if User.exists?(email: email)
      user = User.find_by(email: email)
      user.password === password ? user : nil
    else
      nil
    end
  end
end
