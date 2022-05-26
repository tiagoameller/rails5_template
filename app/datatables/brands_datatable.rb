class BrandsDatatable < ApplicationDatatable
  SORT_COLUMNS = %w(
    id
    name
    bod
  ).freeze

  SEARCH_COLUMNS = %w(
    name
  ).freeze

  private

  def sort_columns
    SORT_COLUMNS
  end

  def paginated_data
    records.offset(offset).limit(limit).map { |model| @view.render_brand(model) }
  end

  def total_entries
    Brand.count
  end

  def records
    @records ||= fetch_brands
  end

  def fetch_brands
    search_value = params[:search] if params.key? :search
    brands = Brand.order("#{SORT_COLUMNS[sort_column_index]} #{sort_direction}")
    if search_value.blank?
      brands
    else
      search_string = []
      SEARCH_COLUMNS.each { |term| search_string << "cast(#{term} as varchar) ilike :search" }
      brands.where(search_string.join(' or '), search: "%#{search_value}%")
    end
  end
end
