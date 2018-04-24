class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :username
      t.string :first_name
      t.string :image 
      t.string :github 
      t.datetime :created_at
      t.string :password_digest
      t.timestamps
    end
  end
end

#add phone number verification https://www.twilio.com/docs/sms/tutorials/two-factor-authentication-ruby-sinatra

#https://developer.github.com/apps/building-github-apps/identifying-and-authorizing-users-for-github-apps/#identifying-users-on-your-site