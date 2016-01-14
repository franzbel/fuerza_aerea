class ComponentsController < ApplicationController
  def update
    # render(:text => params[:id])
    component = Component.find(params[:id])
    component.update(component_params)
    redirect_to  pending_works_index_path
  end
  private
  def component_params
    params.require(:component).permit(:state)
  end
end
