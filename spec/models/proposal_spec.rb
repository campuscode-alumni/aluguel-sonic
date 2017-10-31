# == Schema Information
#
# Table name: proposals
#
#  id               :integer          not null, primary key
#  user_name        :string
#  email            :string
#  start_date       :date
#  end_date         :date
#  total_amount     :decimal(, )
#  total_guests     :integer
#  rent_purpose     :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  property_id      :integer
#  agree_with_rules :boolean
#  status           :integer          default("pending")
#

require 'rails_helper'

RSpec.describe Proposal, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
end
