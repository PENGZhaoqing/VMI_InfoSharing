class StockDb < ActiveRecord::Base

  def self.search(params)

    @result=StockDb.where('stock_dbs.complete_time LIKE ?', "%#{params[:complete_time]}%")
                .where('stock_dbs.client_name LIKE ?', "%#{params[:client_name]}%")
                .where('stock_dbs.product_name LIKE ?', "%#{params[:product_name]}%")
                .where('stock_dbs.product_code LIKE ?', "%#{params[:product_code]}%")
                .where('stock_dbs.standard LIKE ?', "%#{params[:standard]}%")
                .where('stock_dbs.kind LIKE ?', "%#{params[:kind]}%")
                .where('stock_dbs.project_name LIKE ?', "%#{params[:project_name]}%")
                .where('stock_dbs.project_code LIKE ?', "%#{params[:project_code]}%")
                .where('stock_dbs.supplier LIKE ?', "%#{params[:supplier]}%")

    @result=@result.where('stock_dbs.export_num = ?', params[:export_num]) if !params[:export_num].blank?
    return @result
  end

  def self.filter_by_type(type)
    where("stock_dbs.supplier LIKE ?", "%#{type}%")
  end

end
