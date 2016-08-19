namespace :users do
  desc "create users"
  task :create => :environment do
    users = [
              { email: 'christophe@free.fr', password: '12345678', password_confirmation: '12345678' },
              { email: 'pierre@free.fr', password: '12345678', password_confirmation: '12345678' },
              { email: 'arnaud@free.fr', password: '12345678', password_confirmation: '12345678' },
            ]
    users.each do |u|
      User.create!(email: u[:email], password: u[:password], password_confirmation: u[:password_confirmation])
    end
  end
end