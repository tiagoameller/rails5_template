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
class Brand < ApplicationRecord
  include CodeNameStuff

  validates :name, presence: true

  def formatted_code
    # avoid CodeNameStuff errors
    nil
  end
end
