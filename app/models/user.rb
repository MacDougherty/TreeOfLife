class User < ApplicationRecord
  require 'mail'
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validate :email_domain      
         
  def email_domain
    begin
      domain = ::Mail::Address.new(self.email).domain.downcase
    rescue => e
      puts e
      domain = ""
    end
    approved_domains = ["websensing.com", "microarx.com", "apiotics.com"]
    unless approved_domains.include?(domain)
      errors.add(:email, "Invalid domain.  Your email domain (#{domain}) must be one of #{approved_domains.to_s} to register.")
    end
  end
  
end
