# == Schema Information
#
# Table name: arts
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  shows_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Art, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
