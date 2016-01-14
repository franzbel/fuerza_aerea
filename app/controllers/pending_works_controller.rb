class PendingWorksController < ApplicationController
  def index
    @components = get_pending_works
  end

  def update_components
  end

  private
  def get_pending_works
    pending_works = Array.new
    components = Component.all
    components.each do |component|
      if component.elapsed_time >= component.tbos.first.initial_value && component.elapsed_time <= component.tbos.first.end_value
        pending_works.push(component)
      else
        # 'Necesitamos tomar acciones urgentes'
      end
    end
    pending_works
  end
end

