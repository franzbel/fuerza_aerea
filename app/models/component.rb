class Component < ActiveRecord::Base
  belongs_to :system
  has_many :parts
  has_many :tbos
end
