# == Schema Information
#
# Table name: brands
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  yes_or_not :boolean          default(FALSE)
#  bod        :date
#
FactoryBot.define do
  factory :brand do
    name { Faker::Lorem.word }
  end
end
