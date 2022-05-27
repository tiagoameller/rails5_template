module BrandsHelper
  def render_brand(model)
    {}.tap do |column|
      present(model) do |brand|
        column[:id] = brand.id
        column[:name] = brand.name
        column[:bod] = brand.bod
        column[:yes_or_not] = brand.yes_or_not
        # column << brand.image_thumbnail_link
        # column << link_to(brand.name, brand_path(brand), remote: true, data: { id: brand.id })
        # column << brand.description
        # column << brand.public.humanize
        # column << brand.note
        # column << brand.headset_list
        # column << link_to(
        #   edit_headsets_brand_path(brand),
        #   remote: true,
        #   class: "btn btn-success btn-sm #{'disabled' unless policy(:brand).edit_headsets?}",
        #   title: I18n.t('brand.assign_headsets'),
        #   data: {
        #     toggle: 'c-tooltip',
        #     placement: :top
        #   }) { icon_by_model(:headset) }
        # column << link_to(
        #   edit_brand_path(brand),
        #   remote: true,
        #   class: "btn btn-warning btn-sm btn_edit #{'disabled' unless policy(:brand).edit?}"
        # ) { coreui_icon_l(:pencil) }
        # column << link_to(
        #   brand_path(brand),
        #   method: :delete,
        #   remote: true,
        #   data: { confirm: I18n.t('common.are_you_sure'), disable_with: '...' },
        #   class: "btn btn-danger btn-sm btn_delete #{'disabled' unless policy(:brand).destroy?}"
        # ) { coreui_icon_l(:trash) }
        # column << {
        #   row_id: dom_id(brand)
        # }
      end
    end
  end
end
