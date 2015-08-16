class Event < ActiveRecord::Base
  belongs_to :registered_application
  has_many :events
end
