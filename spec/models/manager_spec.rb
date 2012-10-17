require 'spec_helper'

describe Manager do
  it { should have_many(:tickets) }
  it { should have_many(:comments) }
end
