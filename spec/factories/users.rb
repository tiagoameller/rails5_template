# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  email                  :string           default(""), not null
#  admin_level            :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  locale                 :string           default("ca")
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
  factory :user do
    factory :basic_user do
      admin_level { :basic }
    end
    factory :commercial_user do
      admin_level { :commercial }
    end
    factory :delivery_user do
      admin_level { :delivery }
    end
    factory :delivery_super_user do
      admin_level { :delivery_super }
    end
    factory :office_user do
      admin_level { :office }
    end
    factory :admin_user do
      admin_level { :admin }
    end

    name { 'user' }
    email { 'user@pounou.com' }
    password { '123456' }
    admin_level { :office }
  end
end
