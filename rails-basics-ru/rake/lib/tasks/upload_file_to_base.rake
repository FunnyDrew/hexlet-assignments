require 'csv'

namespace :hexlet do
  desc "Your task description"
  task :import_users, [:path] => :environment do |t, args|
  	path = args[:path]
    pp "the path is: #{path}"
    CSV.foreach(path, headers: true, header_converters: :symbol) do |row|
      u = User.create(first_name: row[:first_name],
                  last_name: row[:last_name],
                  birthday: Date.strptime(row[:birthday],'%m/%d/%Y'),
                  email: row[:email])
      #debugger
      
    end
  end
end 
#hexlet:import_users[test/fixtures/files/users.csv]

