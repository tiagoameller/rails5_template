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
  if table_id?
    $(table_id).bootstrapTable() # initialize the table. Options are set by html attributes

    $(table_id).on('click-row.bs.table', (row, element, field) ->
      window.location.href = show_path.replace /%7BID%7D/, element.id
    ) if show_path?

    $(table_id).on('dbl-click-row.bs.table', (row, element, field) ->
      window.location.href = edit_path.replace /%7BID%7D/, element.id
    ) if edit_path?

  # $(table_id).on('post-body.bs.table', (data) ->
  #   debugger
  #   console.log(data)
  # )


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

