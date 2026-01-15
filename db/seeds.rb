# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_1 = User.create!(
  email:    'example@email.com',
  password: 'password!',
  username: 'example'
)

user_2 = User.create!(
  email:    'admin@email.com',
  password: 'password!',
  username: 'admin',
  role:     1
)

# WORKOUT PLANS

# FULL BODY WORKOUT PLANS
wp1 = WorkoutPlan.create!(
  name:             'Beginner Workout Plan Full Body',
  description:      '12 week full body workout plan for beginner lifters.',
  price:            20.00,
  experience_level: 'Beginner',
  muscle_group:     'Full Body'
)
wp1.picture.attach(io: File.open(Rails.root.join('app/assets/images/wp1.png')), filename: 'wp1.png',
                   content_type: 'image/png')
wp1.file.attach(io: File.open(Rails.root.join('app/assets/images/wp_files/wp1.pdf')), filename: 'wp1.pdf',
                content_type: 'pdf')

wp2 = WorkoutPlan.create!(
  name:             'Intermediate Workout Plan Full Body',
  description:      '12 week full body workout plan for intermediate lifters.',
  price:            20.00,
  experience_level: 'Intermediate',
  muscle_group:     'Full Body'
)
wp2.picture.attach(io: File.open(Rails.root.join('app/assets/images/wp2.png')), filename: 'wp2.png',
                   content_type: 'image/png')
wp2.file.attach(io: File.open(Rails.root.join('app/assets/images/wp_files/wp2.pdf')), filename: 'wp2.pdf',
                content_type: 'pdf')

wp3 = WorkoutPlan.create!(
  name:             'Advanced Workout Plan Full Body',
  description:      '12 week full body workout plan for advanced lifters.',
  price:            20.00,
  experience_level: 'Advanced',
  muscle_group:     'Full Body'
)
wp3.picture.attach(io: File.open(Rails.root.join('app/assets/images/wp3.png')), filename: 'wp3.png',
                   content_type: 'image/png')
wp3.file.attach(io: File.open(Rails.root.join('app/assets/images/wp_files/wp3.pdf')), filename: 'wp3.pdf',
                content_type: 'pdf')

# UPPER BODY WORKOUT PLANS

wp4 = WorkoutPlan.create!(
  name:             'Beginner Workout Plan Upper Body',
  description:      '12 week upper body focused workout plan for beginner lifters.',
  price:            20.00,
  experience_level: 'Beginner',
  muscle_group:     'Upper Body'
)
wp4.picture.attach(io: File.open(Rails.root.join('app/assets/images/wp4.png')), filename: 'wp4.png',
                   content_type: 'image/png')
wp4.file.attach(io: File.open(Rails.root.join('app/assets/images/wp_files/wp4.pdf')), filename: 'wp4.pdf',
                content_type: 'pdf')

wp5 = WorkoutPlan.create!(
  name:             'Intermediate Workout Plan Upper Body',
  description:      '12 week upper body focused workout plan for intermediate lifters.',
  price:            20.00,
  experience_level: 'Intermediate',
  muscle_group:     'Upper Body'
)
wp5.picture.attach(io: File.open(Rails.root.join('app/assets/images/wp5.png')), filename: 'wp5.png',
                   content_type: 'image/png')
wp5.file.attach(io: File.open(Rails.root.join('app/assets/images/wp_files/wp5.pdf')), filename: 'wp5.pdf',
                content_type: 'pdf')
wp6 = WorkoutPlan.create!(
  name:             'Advanced Workout Plan Upper Body',
  description:      '12 week upper body focused workout plan for advanced lifters.',
  price:            20.00,
  experience_level: 'Advanced',
  muscle_group:     'Upper Body'
)
wp6.picture.attach(io: File.open(Rails.root.join('app/assets/images/wp6.png')), filename: 'wp6.png',
                   content_type: 'image/png')
wp6.file.attach(io: File.open(Rails.root.join('app/assets/images/wp_files/wp6.pdf')), filename: 'wp6.pdf',
                content_type: 'pdf')

# LOWER BODY WORKOUT PLANS

wp7 = WorkoutPlan.create!(
  name:             'Beginner Workout Plan Lower Body',
  description:      '12 week lower body focused workout plan for beginner lifters.',
  price:            20.00,
  experience_level: 'Beginner',
  muscle_group:     'Lower Body'
)
wp7.picture.attach(io: File.open(Rails.root.join('app/assets/images/wp7.png')), filename: 'wp7.png',
                   content_type: 'image/png')
wp7.file.attach(io: File.open(Rails.root.join('app/assets/images/wp_files/wp7.pdf')), filename: 'wp7.pdf',
                content_type: 'pdf')

wp8 = WorkoutPlan.create!(
  name:             'Intermediate Workout Plan Lower Body',
  description:      '12 week lower body focused workout plan for intermediate lifters.',
  price:            20.00,
  experience_level: 'Intermediate',
  muscle_group:     'Lower Body'
)
wp8.picture.attach(io: File.open(Rails.root.join('app/assets/images/wp8.png')), filename: 'wp8.png',
                   content_type: 'image/png')
wp8.file.attach(io: File.open(Rails.root.join('app/assets/images/wp_files/wp8.pdf')), filename: 'wp8.pdf',
                content_type: 'pdf')

# DIET PLANS

# GENERAL DIET PLANS

mp1 = MealPlan.create!(
  name:                 'Meal Plan Standard',
  description:          '12 week meal plan for general health and wellness.',
  price:                20.00,
  diet_type:            nil,
  dietary_restrictions: nil
)
mp1.picture.attach(io: File.open(Rails.root.join('app/assets/images/mp1.png')), filename: 'mp1.png',
                   content_type: 'image/png')
mp1.file.attach(io: File.open(Rails.root.join('app/assets/images/mp_files/mp1.pdf')), filename: 'mp1.pdf',
                content_type: 'pdf')

mp2 = MealPlan.create!(
  name:                 'Meal Plan Gluten Free',
  description:          '12 week gluten free meal plan for general health and wellness.',
  price:                20.00,
  diet_type:            nil,
  dietary_restrictions: 'Gluten Free'
)
mp2.picture.attach(io: File.open(Rails.root.join('app/assets/images/mp2.png')), filename: 'mp2.png',
                   content_type: 'image/png')
mp2.file.attach(io: File.open(Rails.root.join('app/assets/images/mp_files/mp2.pdf')), filename: 'mp2.pdf',
                content_type: 'pdf')

# VEGAN DIET PLANS
mp3 = MealPlan.create!(
  name:                 'Vegan Meal Plan Standard',
  description:          '12 week vegan meal plan for general health and wellness.',
  price:                20.00,
  diet_type:            'Vegan',
  dietary_restrictions: nil
)
mp3.picture.attach(io: File.open(Rails.root.join('app/assets/images/mp3.png')), filename: 'mp3.png',
                   content_type: 'image/png')
mp3.file.attach(io: File.open(Rails.root.join('app/assets/images/mp_files/mp3.pdf')), filename: 'mp3.pdf',
                content_type: 'pdf')

mp4 = MealPlan.create!(
  name:                 'Vegan Meal Plan Nut Free',
  description:          '12 week vegan and nut free meal plan for general health and wellness.',
  price:                20.00,
  diet_type:            'Vegan',
  dietary_restrictions: 'Nut Free'
)
mp4.picture.attach(io: File.open(Rails.root.join('app/assets/images/mp4.png')), filename: 'mp4.png',
                   content_type: 'image/png')
mp4.file.attach(io: File.open(Rails.root.join('app/assets/images/mp_files/mp4.pdf')), filename: 'mp4.pdf',
                content_type: 'pdf')

# KETO DIET PLANS
mp5 = MealPlan.create!(
  name:                 'Keto Meal Plan Standard',
  description:          '12 week keto meal plan for general health and wellness.',
  price:                20.00,
  diet_type:            'Keto',
  dietary_restrictions: nil
)
mp5.picture.attach(io: File.open(Rails.root.join('app/assets/images/mp5.png')), filename: 'mp5.png',
                   content_type: 'image/png')
mp5.file.attach(io: File.open(Rails.root.join('app/assets/images/mp_files/mp5.pdf')), filename: 'mp5.pdf',
                content_type: 'pdf')

mp6 = MealPlan.create!(
  name:                 'Keto Meal Plan Dairy Free',
  description:          '12 week keto and dairy free meal plan for general health and wellness.',
  price:                20.00,
  diet_type:            'Keto',
  dietary_restrictions: 'Dairy Free'
)
mp6.picture.attach(io: File.open(Rails.root.join('app/assets/images/mp6.png')), filename: 'mp6.png',
                   content_type: 'image/png')
mp6.file.attach(io: File.open(Rails.root.join('app/assets/images/mp_files/mp6.pdf')), filename: 'mp6.pdf',
                content_type: 'pdf')

# KOSHER DIET PLANS
mp7 = MealPlan.create!(
  name:                 'Kosher Meal Plan Standard',
  description:          '12 week kosher meal plan for general health and wellness.',
  price:                20.00,
  diet_type:            'Kosher',
  dietary_restrictions: nil
)
mp7.picture.attach(io: File.open(Rails.root.join('app/assets/images/mp7.png')), filename: 'mp7.png',
                   content_type: 'image/png')
mp7.file.attach(io: File.open(Rails.root.join('app/assets/images/mp_files/mp7.pdf')), filename: 'mp7.pdf',
                content_type: 'pdf')

mp8 = MealPlan.create!(
  name:                 'Kosher Meal Plan Gluten Free',
  description:          '12 week kosher and gluten free meal plan for general health and wellness.',
  price:                20.00,
  diet_type:            'Kosher',
  dietary_restrictions: 'Gluten Free'
)
mp8.picture.attach(io: File.open(Rails.root.join('app/assets/images/mp8.png')), filename: 'mp8.png',
                   content_type: 'image/png')
mp8.file.attach(io: File.open(Rails.root.join('app/assets/images/mp_files/mp8.pdf')), filename: 'mp8.pdf',
                content_type: 'pdf')
