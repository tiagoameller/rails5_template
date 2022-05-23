# http://railscasts.com/episodes/362-exporting-csv-and-excel?language=es&view=asciicast
# provides basic CSV and Excel export for simple models
# generate xls docs: https://msdn.microsoft.com/en-us/library/aa140066(v=office.10).aspx
module CsvXlsExport
  extend ActiveSupport::Concern

  module ClassMethods
    # see options at http://devdocs.io/ruby/csv#method-c-new
    def to_csv(options = {})
      CSV.generate(options) do |csv|
        exportable_columns = column_names.delete_if { |c| %w(id created_at updated_at).include? c }
        csv << exportable_columns
        all.find_each do |record|
          csv << record.attributes.values_at(*exportable_columns)
        end
      end.html_safe
    end
  end

  included do
    # see options at http://devdocs.io/ruby/csv#method-c-new
    def export_csv(query_result, title = nil, options = {})
      CSV.generate(options) do |csv|
        csv << [title] if title
        csv << query_result.columns
        query_result.rows.each do |row|
          csv << row
        end
      end.html_safe
    end
  end
end
