# Shared code across CodeName models (colors, stampings ...)
module CodeNameStuff
  extend ActiveSupport::Concern

  module ClassMethods
    def search_collection(search, collection, attribute_for_display = 'name_plus_code')
      result = []
      collection.each do |e|
        display_name = e.send(attribute_for_display)
        result << { id: e.id.to_s, label: display_name } if search == '**' || display_name =~ /#{search}/i
      end
      result
    end
  end

  included do
    def code_len(value)
      @code_len_formatter = "%0#{value}d"
    end
  end

  def name_plus_code
    "#{name} #{formatted_code}".strip if name.present?
  end

  def code_plus_name
    "#{formatted_code} #{name}".strip if name.present?
  end

  def formatted_code
    format_code(code)
  end

  def format_code(a_code)
    format(@code_len_formatter, a_code)
  end

  def contact_type_str(contact)
    result = []
    result << 'Cli' if contact.is_customer
    result << 'Pro' if contact.is_supplier
    result << 'Ven' if contact.is_salesman
    result << 'Aut' if contact.is_author
    result.join('/')
  end

  def method_missing(name, *args)
    return code_plus_name if name == :full_name
    return nil if name == :code=
    return nil if name == :link_to_list

    # WARN experimental
    Rails.logger.warn "~!~ method_missing: #{name}. #{args}"
    return nil if Rails.env.production? || self.class.name.to_s.empty?

    # WARN experimental
    # raise NoMethodError, "Method '#{name}' not found in class '#{self.class.name}'"
    super
  end

  def respond_to_missing?(method_name, include_private = false)
    if Rails.env.production?
      [:full_name, :code=, :link_to_list].include? method_name
    else
      super
    end
  end

  def build_account(prefix, code)
    "#{prefix}#{format('%07d', code)}"
  end
end
