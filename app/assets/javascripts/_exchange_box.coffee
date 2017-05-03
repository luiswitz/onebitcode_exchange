$(document).ready ->
  $('form :input').on 'change keyup', ->
    if $('form').attr('action') == '/exchange'
      $.ajax '/exchange',
        type: 'POST'
        dataType: 'json'
        data: {
          currency: $('#currency').val(),
          currency_destination: $('#currency_destination').val(),
          quantity: $('#quantity').val()
        }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, textStatus, jqXHR) ->
          $('#result').val(data.value)
          return false;

  $('#btn-exchange-currencies').click ->
    currency_val = $('#currency').val()
    currency_destination_val = $('#currency_destination').val()
    $('#currency').val(currency_destination_val)
    $('#currency_destination').val(currency_val).change()
