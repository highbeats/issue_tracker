class Project < ActiveRecord::Base
  attr_accessible :manager_id, :name, :provider

  has_many :tasks
  belongs_to :manager
end
