# frozen_string_literal: true
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
15.times do
	Task.create(
		name: Faker::Games::DnD.title_name,
		description: Faker::Lorem.sentences.join,
		status: 'new',
		creator: Faker::Name.name,
		performer: Faker::Name.name,
		completed: [true, false].sample
		)	
end
