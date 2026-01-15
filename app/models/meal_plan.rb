# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id                   :bigint           not null, primary key
#  description          :string
#  diet_type            :string
#  dietary_restrictions :string
#  experience_level     :string
#  file                 :string
#  muscle_group         :string
#  name                 :string
#  picture              :string
#  price                :decimal(, )
#  type                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class MealPlan < Product
end
