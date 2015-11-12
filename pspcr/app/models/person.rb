class Person < ActiveRecord::Base
  validates :first_name, :last_name, presence: true

  has_one :deputy  
end

