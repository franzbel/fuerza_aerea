class ReportsController < ApplicationController
  def index
    @scheduled_inspections = get_inspections(2000)
  end

  def get_inspections(hours)
    last_periodical = 0
    last_intermediate = 0
    intermediate_inspection = false
    periodical_inspection = false
    inspections = Array.new
    hours.times do |n|
      if n - last_periodical == 800 || n - last_intermediate == 400 && intermediate_inspection
        inspections.push([n,'periodical'])
        last_periodical = n
        periodical_inspection = true
      else
        if n - last_periodical == 400 && periodical_inspection  || n == 400
          inspections.push([n,'intermediate'])
          last_intermediate = n
          intermediate_inspection = true
        else
          if n % 100 == 0
            inspections.push([n,'sc-100'])
            last_intermediate = n
          else
            if n % 50 == 0
              inspections.push([n,'sc-50'])
              last_intermediate = n
            end
          end
        end
      end
    end
    inspections
  end
end


