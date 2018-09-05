class Visit < ApplicationRecord
  def self.record_visit!(user, shortened_url)
    Visit.create!(user_id: user.id, url_id: shortened_url.id)
  end

  belongs_to :visitor,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :visited,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl

  validates :user_id, :url_id, presence: true
end
