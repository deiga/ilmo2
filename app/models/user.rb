require 'digest/sha1'

class User < ActiveRecord::Base
  
  has_many    :registrations
  has_many    :exercise_groups, :through => :registrations
  
  has_many :rights
  has_many :roles, :through => :rights
  
  validates_uniqueness_of :username, :on => :create
  validates_length_of :username, :in => 4..40
  validates_length_of :realname, :in => 3..20, :allow_blank => true
  
  validates_length_of :password, :in => 5..40, :on => :create
  validates_length_of :password, :in => 5..40, :allow_blank => true, :on => :update
  validates_confirmation_of :password
  
  validates_length_of :studentnumber, :is => 9, :allow_blank => true
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :allow_blank => true
  
  has_attached_file :avatar, :default_url => '/images/user_avatars/missing.jpg'
  
  attr_protected :id, :salt

  attr_accessor :password, :password_confirmation
  
  named_scope :with_email, :conditions => "email IS NOT NULL AND LENGTH(email) > 0"
  
  before_save :downcase_username
  after_create :update_newsfeed

  def password=(pass)
    @password=pass
    self.salt = User.random_string(10) if !self.salt?
    self.enc_password = User.encrypt(@password, self.salt)
  end

  def self.authenticate(username, pass)
    user = find_by_username(username)
    
    return nil if user.nil?
    return user if User.encrypt(pass, user.salt) == user.enc_password
    nil
  end 
  
private

  def update_newsfeed
    Newsfeed.user_created(self)
  end
  
  def downcase_username
    self.username.downcase!
  end

protected 
  
  def self.encrypt(pass, salt)
     Digest::SHA1.hexdigest(pass+salt)
  end
  
  def self.random_string(len)
     #generate a random password consisting of strings and digits
     chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
     newpass = ""
     1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
     return newpass
  end  

end