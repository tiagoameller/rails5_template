class BrandsController < ApplicationController
  include CsvXlsExport
  # before_action :check_user_design_or_office_or_admin, only: [:new, :create, :edit, :update, :destroy]
  # TODO: check_user_design_or_office_or_admin
  before_action :set_brand, only: [:show, :edit, :update, :destroy, :history]
  # autocomplete :brand, :name, full: true
  # TODO: autocomplete

  # GET /brands
  def index
    @current_page_title = Brand.model_name.human(count: :many)
    datatable = BrandsDatatable.new(view_context)
    @brands = datatable.dataset
    respond_to do |format|
      format.json { render json: datatable.to_json }
      format.html
      format.xls
    end
  end

  # GET /brands/1
  def show
    @current_page_title = "#{Brand.model_name.human}: #{@brand.name}"
  end

  # GET /brands/new
  def new
    @current_page_title = "#{t('views.new')} #{Brand.model_name.human}"
    @brand = Brand.new
  end

  # GET /brands/1/edit
  def edit
    @current_page_title = "#{t('views.edit')} #{Brand.model_name.human}"
  end

  # POST /brands
  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      redirect_to new_brand_path,
                  notice: I18n.t('views.flash_messages.item_successfully_created', model_name: Brand.model_name.human)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /brands/1
  def update
    if @brand.update(brand_params)
      redirect_to @brand,
                  notice: I18n.t('views.flash_messages.item_successfully_updated', model_name: Brand.model_name.human)
    else
      render action: 'edit'
    end
  end

  def history; end

  # DELETE /brands/1
  def destroy
    @brand.destroy
    redirect_to brands_url,
                notice: I18n.t('views.flash_messages.item_successfully_destroyed', model_name: Brand.model_name.human)
  rescue ActiveRecord::DeleteRestrictionError
    redirect_to brands_url,
                flash: { error: I18n.t('views.dependent.error', model_name: Brand.model_name.human) }
  end

  def save(*args)
    super
  rescue ActiveRecord::RecordNotUnique => e
    errors[:base] << e.message
    false
  end

  def autocomplete_brand_name
    respond_to do |format|
      format.html
      format.json { render json: Brand.search_collection(params[:term], Brand.order(:name)) }
    end
  end

  # TODO: brands history
  # def history
  #   history_type = params[:history_type]
  #   @history = Brand.send(history_type, @brand)
  #   respond_to do |format|
  #     format.csv do
  #       headers['Content-Disposition'] =
  #         "attachment; filename=\"#{@brand.code_plus_name.to_filename}_#{history_type}_history.csv\""
  #       headers['Content-Type'] ||= 'text/csv'
  #       send_data export_csv(@history, "#{history_type}. #{@brand.code_plus_name}")
  #     end
  #     format.json { render json: @history }
  #     format.xlsx do
  #       send_file(
  #         ExcelBuilder::ExcelBuilderWithSummary.new(
  #           @history, history_type, @brand.code_plus_name, summary_columns: [:units]).execute,
  #         filename: "#{history_type}_#{@brand.code_plus_name.to_filename}.xlsx",
  #         type: 'application/vnd.ms-excel')
  #     end
  #   end
  # rescue NoMethodError, ActionController::UnknownFormat
  #   render text: 'Not Found', status: '404'
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_brand
    @brand = Brand.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to brands_url,
                flash: { error: I18n.t('views.flash_messages.item_not_found', model_name: Brand.model_name.human) }
  end

  # Only allow a trusted parameter "white list" through.
  def brand_params
    params.require(:brand).permit(:name, :yes_or_not, :bod)
  end
end
