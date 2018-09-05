class ShortenedUrl < ApplicationRecord
  def self.random_code
    code = SecureRandom.urlsafe_base64
    until ShortenedUrl.where(short_url: code).exists? == false
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def self.cool_link(user, long_url)
    ShortenedUrl.create!(
      user_id: user.id,
      long_url: long_url,
      short_url: ShortenedUrl.random_code
    )
  end

  validates :short_url, presence: true, uniqueness: true
  validates :long_url, :user_id, presence: true

  belongs_to :submitter,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User
end
