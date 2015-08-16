class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
   has_many :jobs
  validates :name, uniqueness: true, presence: true
  validates :url, uniqueness: true, presence: true
end


