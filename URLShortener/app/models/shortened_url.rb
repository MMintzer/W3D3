class ShortenedUrl < ApplicationRecord

  validates :user_id, presence: true
  validates :long_url, presence: true
  # validates :short_url

  include SecureRandom

  def self.random_code
    SecureRandom.urlsafe_base64
  end

  def self.generate_short(user, long_url)
    s_url = random_code
    ShortenedUrl.create!(long_url:long_url, short_url:s_url, user_id:user.id)
  end

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :su_id,
    class_name: :Visit

end
