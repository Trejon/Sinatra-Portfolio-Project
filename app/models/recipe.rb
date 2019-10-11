class Recipe < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :ingredients, presence: true
end
