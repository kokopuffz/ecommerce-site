class User < ApplicationRecord
  validates_presence_of :username
  validates_presence_of :password
  validates_presence_of :created_at
  validates_presence_of :updated_at
end
