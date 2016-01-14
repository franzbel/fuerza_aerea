class Tbo < ActiveRecord::Base
  belongs_to :component
  before_save :set_end_value

  private

  def set_end_value
    self.end_value = (initial_value*0.03 + initial_value).to_i
  end
end
