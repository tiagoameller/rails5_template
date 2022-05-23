$(document).on('turbolinks:load', function() {
  $('#brands-table').bootstrapTable({
    url: 'http://localhost:3000/brands.json',
    pagination: true,
    search: true,
    columns: [{
      field: 'id',
      title: 'Item ID'
    }, {
      field: 'name',
      title: 'Item Name'
    }, {
      field: 'created_at',
      title: 'created at'
    }]
  })
});
