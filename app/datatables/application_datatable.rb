class ApplicationDatatable
  DEFAULT_PAGE_SIZE = 20
  delegate :params, to: :@view
  delegate :link_to, to: :@view
  delegate :mail_to, to: :@view
  delegate :content_tag, to: :@view
  # delegate :present, to: :@view
  delegate :current_user, to: :@view
  # delegate :coreui_icon_l, to: :@view
  # delegate :distance_of_time_in_words, to: :@view

  def initialize(view)
    @view = view
  end

  def dataset
    records
  end

  def as_json(_options = {})
    {
      totalNotFiltered: total_entries,
      total: records.count,
      rows: paginated_data
    }
  end

  private

  def sort_column_index
    sort_columns.find_index(params[:sort]) || 0
  end

  def sort_direction
    params[:order] == 'desc' ? 'desc' : 'asc'
  end

  def offset
    (params[:offset].to_i / limit) + 1
  end

  def limit
    params[:limit].to_i > 0 ? params[:limit].to_i : DEFAULT_PAGE_SIZE
  end
end
