class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
   has_many :jobs
  validates :name, presence: true
  validates :url, presence: true
end


