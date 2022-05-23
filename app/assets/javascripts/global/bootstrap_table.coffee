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
