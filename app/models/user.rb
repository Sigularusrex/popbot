class User < ApplicationRecord
  validates :first_name, presence: true
  validates :facebook_id, presence: true, uniqueness: true
end
