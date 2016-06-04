class User

  include MongoMapper::Document

  key :username, String, :key => true, :unique => true, :length => 5..25
  key :active, Boolean
  key :secret, String
  key :email, String, :unique => true

  timestamps!   # adds created_at and updated_at fields

  validates_presence_of :username
  validates_presence_of :email

  def password=(password)
    self.secret = BCrypt::Password.create(password)
  end

  def password
    return BCrypt::Password.new(secret) if self.secret
    nil
  end

  def self.authenticate(requested_username, requested_password)
    u = self.find_by_username(requested_username)
    u if u && u.password == requested_password
  end
end