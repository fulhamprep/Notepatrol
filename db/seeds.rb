# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
puts 'hardcoded'
#YAML.load(ENV['ROLES']).each do |role|
# Role.find_or_create_by_name({ :name => role }, :without_protection => true)
# puts 'role: ' << role
#end

Role.find_or_create_by_name({ :name => 'admin' }, :without_protection => true)
puts 'role: admin'

Role.find_or_create_by_name({ :name => 'user' }, :without_protection => true)
puts 'role: user'

puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => 'Piers Young', :email => 'pyoung@fulhamprep.co.uk', :password => 'password', :password_confirmation => 'password'
puts 'user: ' << user.name
user.add_role :admin
puts 'is now admin - yay!'