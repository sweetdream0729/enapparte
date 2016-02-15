# == Schema Information
#
# Table name: bookings
#
#  id                 :integer          not null, primary key
#  status             :integer
#  date               :datetime
#  spectators         :integer
#  price              :float
#  message            :text
#  payout             :float
#  payment_received?  :boolean
#  payment_sent?      :boolean
#  paid_on            :datetime
#  paid_out_on        :datetime
#  show_id            :integer
#  user_id            :integer
#  address_id         :integer
#  payment_methods_id :integer
#  ratings_id         :integer
#  comment_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe Booking, type: :model do

  context '#change_status' do
    let(:user) { create :user }
    let(:show) { create :show }
    let(:booking) { create :booking, user: user, show: show }
    context 'when change to 3' do
      subject { booking.change_status(3) }
      it { expect { subject }.to change { ActionMailer::Base.deliveries.count }.by(1) }
    end
  end

  context '.check_expired' do
    let!(:booking) { create :booking, status: 2, date: 48.hours.ago }
    let!(:booking2) { create :booking, status: 2, date: 47.hours.ago }
    subject { Booking.check_expired }
    it { expect { subject }.to change { Booking.where(status: 4).count }.by(1)  }
  end

end
