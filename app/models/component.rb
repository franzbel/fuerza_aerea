class Component < ActiveRecord::Base
  belongs_to :system
  has_many :parts
  has_many :tbos
  before_update :update_elapsed_time

  def update_elapsed_time
    self.elapsed_time= 0
  end
end
