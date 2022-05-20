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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum admin_level: { basic: 0, commercial: 1, design: 2, delivery: 3, delivery_super: 4, office: 5, admin: 7 }

  validates :name, presence: true, length: { in: 3..12 }, uniqueness: true

  def current_salesman_name
    'current_salesman_name'
  end

  def user_can_change_salesman?
    true
  end
end
