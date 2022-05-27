$(document).on 'turbolinks:load', ->
  $('.focus-me').focus()

  $('.field_with_errors').each ->
    $(this).children('input').addClass('is-invalid')

