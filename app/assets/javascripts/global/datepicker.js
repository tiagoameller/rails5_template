//= require moment
//= require moment/ca.js
//= require moment/en-gb.js
//= require_tree .
//= require_tree ../../../../vendor/vanillajs-datepicker/js/.

$(document).on('turbolinks:load', function() {
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
