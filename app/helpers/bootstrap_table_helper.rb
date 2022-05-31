module BootstrapTableHelper
  def bs_table_tag(base_name, data_attrs = {}, &block)
    data = {
      url: Rails.application.routes.url_helpers.send("#{base_name}_path"),
      'buttons-class': :dark,
      buttons: 'BTTable.default_custom_buttons',
      'cookie-id-table': 'brands-table',
      cookie: true,
      height: 856,
      locale: locale_xx_yy(I18n.locale),
      'maintain-meta-data': true,
      'page-size': 20,
      'pagination-parts': %w[pageInfo pageList],
      pagination: true,
      'query-params-type': :limit,
      'remember-order': true,
      'search-accent-neutralise': true,
      'search-highlight': true,
      search: true,
      'server-sort': true,
      'show-columns-toggle-all': true,
      'show-columns': true,
      'show-extended-pagination': true,
      'show-refresh': true,
      'show-toggle': true,
      'side-pagination': :server,
      sortable: true,
      'sticky-header': true,
      'table-bordered': true,
      'table-hover': true,
      'table-striped': true,
      toggle: :table,
      toolbar: '.toolbar'
    }.merge(data_attrs)
    tag.table(id: "#{base_name}-table", data: data) { block.call }
  end
end
