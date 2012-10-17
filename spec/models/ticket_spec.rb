require 'spec_helper'

describe Ticket do
  it { should belong_to(:manager) }
  it { should belong_to(:department) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:customer) }
  it { should validate_presence_of(:department_id) }
  it { should validate_presence_of(:subject) }
  it { should validate_presence_of(:question) }

  it 'should assign unique reference no' do
    ticket = FactoryGirl.create(:ticket)
    ticket.uid.should_not be_nil
  end

  it 'should set default status' do
    ticket = FactoryGirl.create(:ticket)
    ticket.status.should == 'Waiting for Staff Response'
  end

end
