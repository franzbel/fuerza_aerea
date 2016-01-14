class System < ActiveRecord::Base
  belongs_to :helicopter
  has_many :components
end
