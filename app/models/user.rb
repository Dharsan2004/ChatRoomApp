class User < ApplicationRecord
    validates :username, presence: true, length: { minimum: 3, maximum: 15 },
            uniqueness: { case_sensitive: false }
  has_many :messages
  has_secure_password

  def invalidate_session!
    update(session_token: nil)
  end

  def generate_session_token!
    self.session_token = SecureRandom.hex(16)
    save!
  end

end
