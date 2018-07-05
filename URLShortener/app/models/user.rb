# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#

class User < ApplicationRecord
  validates :email, presence: true
  
  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Shortened_Url
end 
