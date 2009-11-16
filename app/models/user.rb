require 'digest/sha1'

class User < ActiveRecord::Base
  validates_presence_of :username, :password, :message => "can't be blank"
  validates_uniqueness_of :username, :on => :create, :message => "must be unique"
  validates_uniqueness_of :studentnumber, :allow_nil => true
  validates_length_of :username, :within => 5..40, :message => "must be present"
  validates_length_of :password, :within => 8..40, :message => "must be present"
  validates_format_of :studentnumber, :allow_nil => true, :with => /\A\d{9}\Z/
  validates_format_of :realname, :allow_nil => true, :with => /^\w+[\s{1}\w+]*$/
  validates_confirmation_of :enc_password, :message => "should match confirmation"
  
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