class HomesController < ApplicationController

  def index
    @supplier_dbs=SupplierDb.filter(label_params).paginate(:page => params[:supplier_page], :per_page => 5)
    @supplier_labels=SupplierDb.label
    @project_dbs=ProjectDb.paginate(:page => params[:project_page], :per_page => 7)
    if current_visit
      @repertory_dbs=RepertoryDb.filter_by_type(current_visit.supplier2).paginate(:page => params[:repertory_page], :per_page => 18)
    elsif current_user
      @repertory_dbs=RepertoryDb.paginate(:page => params[:repertory_page], :per_page => 12)
    end
  end

  def get_warnings
    @repertory_warning= RepertoryDb.filter_by_num.limit(10)
    render json: @repertory_warning.as_json
  end

  def label_params
    params[:label]
  end

end
