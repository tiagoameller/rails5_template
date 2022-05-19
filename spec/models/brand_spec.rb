# == Schema Information
#
# Table name: brands
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  yes_or_not :boolean          default(FALSE)
#
require 'rails_helper'

RSpec.describe Brand, type: :model do
  it { should validate_presence_of(:name) }
end
