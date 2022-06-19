# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  Tag.create([

  { name: '2022年春' }, { name: '2022年夏' },{ name: '2022年秋'},{ name: '2022年冬'},

  ])

  Admin.create!(
  email: 'admin@admin.com',
  password: 'animmend',
  )
