class Visit < ApplicationRecord

  validates :user_id, presence: true
  validates :su_id, presence: true

  belongs_to :users,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :short_url,
    primary_key: :id,
    foreign_key: :su_id,
    class_name: :User

end
