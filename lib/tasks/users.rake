namespace :users do
  desc "create users"
  task :create => :environment do
    users = [
              { email: 'christophe@free.fr', password: '12345678', password_confirmation: '12345678', firstname: "christophe", lastname: "milliere" },
              { email: 'pierre@free.fr', password: '12345678', password_confirmation: '12345678', firstname: "pierre", lastname: "doudou" },
              { email: 'arnaud@free.fr', password: '12345678', password_confirmation: '12345678', firstname: "arnaud", lastname: "didi" }
            ]
    users.each do |u|
      User.create!( email: u[:email],
                    password: u[:password],
                    password_confirmation: u[:password_confirmation],
                    firstname: u[:firstname],
                    lastname: u[:lastname]
                  )
    end
  end
end
