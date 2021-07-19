class Teacher < ApplicationRecord

  # Validations

  validates :password_digest, :session_token, :email, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  attr_reader :password

  # Associations
  
  # TODO: Need to fix associations to properly show relationships
  has_many :students
  has_many :classes


  before_validation :ensure_session_token

  # Auth Methods 
  def self.find_by_credentials(email, password)
    teacher = Teacher.find_by(email: email)
    teacher && teacher.is_password?(password) ? teacher : nil
  end

  def is_password?(password)
      BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
  end

  def self.generate_session_token
      SecureRandom.urlsafe_base64(16)
  end

  def ensure_session_token
      self.session_token ||= Teacher.generate_session_token
  end

  def reset_session_token!
      self.session_token = Teacher.generate_session_token
      self.save!
      self.session_token
  end

end 