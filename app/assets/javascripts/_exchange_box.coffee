debounce = (func, threshold, execAsap) ->
  timeout = null
  (args...) ->
    obj = this
    delayed = ->
      func.apply(obj, args) unless execAsap
      timeout = null
    if timeout
      clearTimeout(timeout)
    else if (execAsap)
      func.apply(obj, args)
    timeout = setTimeout delayed, threshold || 100
    
wait_change = debounce((e) ->
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
, 250, false)

$(document).ready ->
  $('form :input').on 'change keyup', ->
    wait_change()

  $('#btn-exchange-currencies').click ->
    currency_val = $('#currency').val()
    currency_destination_val = $('#currency_destination').val()
    $('#currency').val(currency_destination_val)
    $('#currency_destination').val(currency_val).change()
