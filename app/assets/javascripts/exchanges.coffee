$(document).ready ->

  convert = () ->
    $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
                  source_currency: $("#source_currency").val(),
                  target_currency: $("#target_currency").val(),
                  amount: $("#amount").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
            $('#btcresult').val(data.btcvalue)
        return false;
 
  $('#amount').keyup ->    
    convert()
  
  $('#source_currency').change ->
    convert()
  
  $('#target_currency').change ->
    convert()

  $('#btn-change').click ->
    source = $("#source_currency").val()
    target = $("#target_currency").val()
    $("#source_currency").val(target)
    $("#target_currency").val(source)