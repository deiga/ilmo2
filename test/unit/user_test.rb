require 'test_helper'

class UserTest < ActiveSupport::TestCase

  self.use_instantiated_fixtures  = true
  fixtures :users

  def test_auth 
    #check that we can login we a valid user 
    assert_equal  @bobby, User.authenticate("bobby", "test")    
    #wrong username
    assert_nil    User.authenticate("nonbob", "test")
    #wrong password
    assert_nil    User.authenticate("bobby", "wrongpass")
    #wrong login and pass
    assert_nil    User.authenticate("nonbob", "wrongpass")
  end
  
  def test_add_studentnumber
    assert_equal @longbob, User.authenticate("longbob", "longtest")
    @longbob.studentnumber = "013312882"
    assert @longbob.save
  end
  
  def test_edit_studentnumber
    assert_equal @longbob, User.authenticate("longbob", "longtest")
    @longbob.studentnumber = "013312882"
    assert @longbob.save
    @longbob.studentnumber = "123213"
    assert !@longbob.save
    @longbob.studentnumber = "012345678"
    assert @longbob.save
  end
  
  def test_wrong_studentnumbers
    u = User.new
    u.username = "Testperson1"
    u.password = u.password_confirmation = "tester22"
    u.studentnumber = "Lolcats"
    assert !u.save
    assert u.errors.invalid?('studentnumber')
    u.studentnumber = "32423424"
    assert !u.save
    assert u.errors.invalid?('studentnumber')
  end
  
  def test_add_real_name
    assert_equal @longbob, User.authenticate("longbob", "longtest")
    @longbob.realname = "Timo Sand"
    assert @longbob.save
  end
  
  def test_edit_real_name
    assert_equal @longbob, User.authenticate("longbob", "longtest")
    @longbob.realname = "Timo Sand"
    assert @longbob.save
    @longbob.realname = "Timo"
    assert @longbob.save
    @longbob.realname = "Timo Joachim Sand"
    assert @longbob.save
    @longbob.realname = ""
    assert @longbob.save
  end

  def test_passwordchange
    # check success
    assert_equal @longbob, User.authenticate("longbob", "longtest")
    #change password
    @longbob.password = @longbob.password_confirmation = "nonbobpasswd"
    assert @longbob.save
    #new password works
    assert_equal @longbob, User.authenticate("longbob", "nonbobpasswd")
    #old pasword doesn't work anymore
    assert_nil   User.authenticate("longbob", "longtest")
    #change back again
    @longbob.password = @longbob.password_confirmation = "longtest"
    assert @longbob.save
    assert_equal @longbob, User.authenticate("longbob", "longtest")
    assert_nil   User.authenticate("longbob", "nonbobpasswd")
  end

  def test_disallowed_passwords
    #check that we can't create a user with any of the disallowed paswords
    u = User.new    
    u.username = "nonbob"
    #too short
    u.password = u.password_confirmation = "tiny" 
    assert !u.save     
    assert u.errors.invalid?('password')
    #too long
    u.password = u.password_confirmation = "hugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehuge"
    assert !u.save     
    assert u.errors.invalid?('password')
    #empty
    u.password = u.password_confirmation = ""
    assert !u.save    
    assert u.errors.invalid?('password')
    #ok
    u.password = u.password_confirmation = "bobs_secure_password"
    assert u.save     
    assert u.errors.empty? 
  end

  def test_bad_logins
    #check we cant create a user with an invalid username
    u = User.new  
    u.password = u.password_confirmation = "bobs_secure_password"
    #too short
    u.username = "x"
    assert !u.save     
    assert u.errors.invalid?('username')
    #too long
    u.username = "hugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhug"
    assert !u.save     
    assert u.errors.invalid?('username')
    #empty
    u.username = ""
    assert !u.save
    assert u.errors.invalid?('username')
    #ok
    u.username = "okbob"
    assert u.save  
    assert u.errors.empty?
  end

  def test_collision
    #check can't create new user with existing username
    u = User.new
    u.username = "existingbob"
    u.password = u.password_confirmation = "bobs_secure_password"
    assert !u.save
  end


  def test_create
    #check create works and we can authenticate after creation
    u = User.new
    u.username      = "nonexistingbob"
    u.password = u.password_confirmation = "bobs_secure_password"
    assert_not_nil u.salt
    assert u.save
    assert_equal 10, u.salt.length
    assert_equal u, User.authenticate(u.username, u.password)

    u = User.new(:username => "newbob", :password => "newpassword", :password_confirmation => "newpassword" )
    assert_not_nil u.salt
    assert_not_nil u.password
    assert_not_nil u.enc_password
    assert u.save 
    assert_equal u, User.authenticate(u.username, u.password)

  end

  def test_rand_str
    new_pass = User.random_string(10)
    assert_not_nil new_pass
    assert_equal 10, new_pass.length
  end

  def test_sha1
    u=User.new
    u.username      = "nonexistingbob"
    u.salt="1000"
    u.password = u.password_confirmation = "bobs_secure_password"
    assert u.save   
    assert_equal 'b1d27036d59f9499d403f90e0bcf43281adaa844', u.enc_password
    assert_equal 'b1d27036d59f9499d403f90e0bcf43281adaa844', User.encrypt("bobs_secure_password", "1000")
  end

  def test_protected_attributes
    #check attributes are protected
    u = User.new(:id=>999999, :salt=>"I-want-to-set-my-salt", :username => "badbob", :password => "newpassword", :password_confirmation => "newpassword" )
    assert u.save
    assert_not_equal 999999, u.id
    assert_not_equal "I-want-to-set-my-salt", u.salt

    u.update_attributes(:id=>999999, :salt=>"I-want-to-set-my-salt", :username => "verybadbob")
    assert u.save
    assert_not_equal 999999, u.id
    assert_not_equal "I-want-to-set-my-salt", u.salt
    assert_equal "verybadbob", u.username
  end
end

