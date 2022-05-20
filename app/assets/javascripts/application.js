// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require moment
//= require moment/ca.js
//= require moment/en-gb.js
//= require_tree .
//= require_tree ../../../vendor/vanillajs-datepicker/js/.

$(document).on('turbolinks:load', function() {
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })

  const elems = document.querySelectorAll('.datepicker_input');
  for (const elem of elems) {
    // date comes in rails format
    const convertDate = moment(elem.value, 'YYYY-MM-DD');
    elem.value = moment(convertDate).format('DD/MM/YYYY');
    const datepicker = new Datepicker(elem, {
      language: 'ca',
      // language: 'en-gb',
      clearBtn: true,
      todayBtn: true,
      autohide: true,
      title: elem.getAttribute('data-title')
    });
  }
})
