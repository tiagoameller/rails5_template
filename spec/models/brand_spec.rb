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
  pending "add some examples to (or delete) #{__FILE__}"
end
