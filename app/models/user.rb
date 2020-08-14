class User < ApplicationRecord
  before_create :create_uuid
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, uniqueness: { :case_sensitive => false }, format: { with: URI::MailTo::EMAIL_REGEXP }, length: {maximum: 256}
  validates :name, length: { in: 1..256, message: "must be between 1 and 256 characters long"}
  has_many :voters

  default_scope { order(created_at: :asc) }

  def self.create_user(auth_hash)
    User.create(
        email: auth_hash.info.email,
        name: auth_hash.info.name,
    )
  end

  def stats
      count = Voter.count
      called = Voter.where.not(status: "Not Called Yet").count

      return called.to_s+ "/"+count.to_s
  end


  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end
end
