require 'faker'

10.times do 
	user = User.new(
		name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password(8)
		)
	user.skip_confirmation!
	user.save!
end

	user = User.new(
		name: "Junjun",
		email: "aliciajace@gmail.com",
		password: "alicia16"
		)
	user.skip_confirmation!
	user.save!
users = User.all

50.times do
	RegisteredApplication.create!(
    	user: users.sample,
    	name: Faker::Hacker.verb, 
    	url: Faker::Internet.url
		)
end
registered_applications = RegisteredApplication.all

150.times do
	Job.create!(
        registered_application: registered_applications.sample,
        name: Faker::Hacker.verb
		)
end
	
puts "Seed finished."
puts "#{User.count} users created."
puts "#{RegisteredApplication.count} registered applications created."
puts "#{Job.count} events created."