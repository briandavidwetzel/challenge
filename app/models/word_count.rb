class WordCount < ApplicationRecord
  validates :request_id, presence: true, uniqueness: true
  validates :value, presence: true
end
