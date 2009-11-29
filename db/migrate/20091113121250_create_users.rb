class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username, :null => false, :limit => 40
      t.string :realname
      t.string :studentnumber
      t.string :enc_password
      t.string :salt

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
