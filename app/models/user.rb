class User < ActiveRecord::Base
  has_secure_password
  validates :fullname, :password, :role, presence: true
  validates :email, presence: true, uniqueness: true
  validates :display_name, length: { in: 2..32 }, allow_nil: true
  has_many :orders
  enum role: %w(default admin)

  def admin?
    role == "admin"
  end
end
