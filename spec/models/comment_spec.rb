require 'spec_helper'

describe Comment do
  it { should belong_to(:ticket) }
  it { should belong_to(:manager) }
end
