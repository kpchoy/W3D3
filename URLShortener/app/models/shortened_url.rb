# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint(8)        not null, primary key
#  long_url  :string
#  short_url :string
#  user_id   :integer
#

class Shortened_Url < ApplicationRecord
  validates :long_url, :short_url, uniqueness: true, presence: true
  
  def self.random_code
    rand = SecureRandom.urlsafe_base64
    
    while self.exists?(short_url: rand)
      rand = SecureRandom.urlsafe_base64(16)
    end
    
    rand
  end
  
  def self.short(user, long) 
    Shortened_Url.new(long_url: long, short_url: Shortened_Url.random_code, user_id: user.id)
  end 
  
  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
