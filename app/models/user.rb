class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  validates :username, presence: true, length: {minimum: 5, maximum: 30}
  validates :email, presence: true, uniqueness: true , length: {minimum: 5, maximum: 30},
            format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
end