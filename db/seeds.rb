# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |n|
	email = "user_#{n+1}@lehiep.com"
	password = "123456"
	User.create!(
		email: email,
		password: password,
		password_confirmation: password
		)
end
10.times do |n|
	title = "book-#{n+1}"
	author = "hiep dai ca"
	description = "sach de test"
	category = 1
	Book.create!(
		title: title,
		author: author,
		description: description,
		category: category
		)
end
10.times do |n|
	title = "post-#{n+1}"
	book_id = 1
	content = "post de test"
	user_id = n+1
	Post.create!(
		title: title,
		content: content,
		book_id: book_id,
		user_id: user_id
		)
end



	