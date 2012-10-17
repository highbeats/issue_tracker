require 'spec_helper'

describe Ticket do
  it { should belong_to(:manager) }
  it { should belong_to(:department) }
  it { should have_many(:comments) }
end
