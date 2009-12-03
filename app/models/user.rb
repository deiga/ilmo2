require 'digest/sha1'

class User < ActiveRecord::Base
  
  has_many    :users_in_groups
  has_many    :exercise_groups, :through => :users_in_groups
  
  validates_uniqueness_of :username, :on => :create
  validates_length_of :username, :in => 4..40
  validates_length_of :password, :in => 5..40, :on => :create
  validates_length_of :password, :in => 5..40, :allow_blank => true, :on => :update, :message => "must be present"
  validates_length_of :realname, :in => 3..20, :allow_blank => true
  validates_length_of :studentnumber, :is => 9, :allow_blank => true
  validates_confirmation_of :password, :message => "should match confirmation"
  
  attr_protected :id, :salt

  attr_accessor :password, :password_confirmation

  def password=(pass)
    @password=pass
    self.salt = User.random_string(10) if !self.salt?
    self.enc_password = User.encrypt(@password, self.salt)
  end

  def self.authenticate(login, pass)
    user = find(:first, :conditions=>["username = ?", login])
    return nil if user.nil?
    return user if User.encrypt(pass, user.salt) == user.enc_password
    nil
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