class ScheduledInspection < ActiveRecord::Base


  belongs_to :helicopter
  before_save :write_inspection

  def write_inspection
    if periodical_inspection?
      self.periodical_inspection = true
      return
    end
    if intermediate_inspection?
      self.intermediate_inspection = true
      return
    end
    if supplementary_check_100?
      self.supplementary_check_100 = true
      return
    end
    if supplementary_check_50?
      self.supplementary_check_50 = true
      return
    end
  end

  #**********************************************************************************************#
  def supplementary_check_50?
    if self.flight_hours % 50 == 0
      return true
    end
    return false
  end
  def supplementary_check_100?
    if self.flight_hours % 100 == 0
      return true
    end
    return false
  end
  def intermediate_inspection?
    if ScheduledInspection.is_there_periodical?
      if self.flight_hours - ScheduledInspection.last_periodical_inspection? == 400
        return true
      end
    end
    unless ScheduledInspection.is_there_intermediate?
      if self.flight_hours == 400
        return true
      end
    end
    return false
  end

  def periodical_inspection?
    if ScheduledInspection.is_there_intermediate?
      if self.flight_hours - ScheduledInspection.last_intermediate_inspection? == 400
        return true
      end
    end
    if ScheduledInspection.is_there_periodical?
      if self.flight_hours - ScheduledInspection.last_periodical_inspection? == 800
        return true
      end
    end
    return false
  end
  #**********************************************************************************************#
  def self.is_there_intermediate?
    ScheduledInspection.all.each do |inspection|
      if inspection.intermediate_inspection
        return true
      end
    end
    return false
  end
  def self.is_there_periodical?
    ScheduledInspection.all.each do |inspection|
      if inspection.periodical_inspection
        return true
      end
    end
    return false
  end

  def self.last_intermediate_inspection?
    ScheduledInspection.all.reverse_each do |inspection|
      if inspection.intermediate_inspection
        return inspection.flight_hours
      end
    end
  end
  def self.last_periodical_inspection?
    ScheduledInspection.all.reverse_each do |inspection|
      if inspection.periodical_inspection
        return inspection.flight_hours
      end
    end
  end

end
