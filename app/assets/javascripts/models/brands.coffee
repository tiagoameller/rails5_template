# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('.focus-me').focus()

  $('#brands-table').bootstrapTable
    url: 'brands.json'
    pagination: true
    search: true
    columns: [
      {
        field: 'id'
        title: 'Item ID'
      }
      {
        field: 'name'
        title: 'Item Name'
      }
      {
        field: 'created_at'
        title: 'created at'
      }
    ]

