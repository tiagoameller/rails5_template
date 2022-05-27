window.BTTable = {
  default_custom_buttons: () ->
    result = {}

    result.btnExcel = {
      text: 'Excel'
      icon: 'bi-file-earmark-excel',
      event: () -> window.location = excel_path
      attributes: {
        title: 'Search all users which has logged in the last week'
      }
    } if excel_path?

    result.btnNew = {
      text: 'Add new row',
      icon: 'bi-file-earmark-plus',
      event: () -> window.location = new_path
      attributes: {
        title: 'Add a new row to the table'
      }
    } if new_path?

    result
}

$(document).on 'turbolinks:load', ->
  $(table_id).on('click-row.bs.table', (row, element, field) ->
    window.location = show_path.replace /%3CID%3E/, element.id
  ) if table_id? && show_path?

  $(table_id).on('dbl-click-row.bs.table', (row, element, field) ->
    window.location = edit_path.replace /%3CID%3E/, element.id
  ) if table_id? && edit_path?


  # rowAttributtes: (row, index) ->
  #   console.log row
  #   console.log index
  #   {
  #     'data-toggle': 'popover',
  #     'data-placement': 'bottom',
  #     'data-trigger': 'click'
  #   }


# $(document).on 'turbolinks:load', ->
#   $('table > tbody > tr').on('click', BTTable.trClick)

