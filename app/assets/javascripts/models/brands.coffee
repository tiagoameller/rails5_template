# All this logic will automatically be available in application.js.
# Place all the behaviors and hooks related to the matching controller here.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('.focus-me').focus()

  # $('#brands-table').bootstrapTable {
    # url: '/brands'
    # search: true
    # sortable: true
    # showRefresh: true
    # showToggle: true
    # showColumns: true
    # buttons: 'custom_buttons'
    # buttonsClass: 'dark'
    # pagination: true
    # pageSize: 10

    # pagination: true
    # search: true
  #   columns: [
  #     {
  #       field: 'id'
  #       title: 'Item ID'
  #     }
  #     {
  #       field: 'name'
  #       title: 'Item Name'
  #     }
  #     {
  #       field: 'created_at'
  #       title: 'created at'
  #     }
  #   ]
  # }

