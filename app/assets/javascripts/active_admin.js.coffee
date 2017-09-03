#= require active_admin/base
#= require activeadmin_addons/all

$(document).ready ->

  hide_all = ->
    $('#prize_condition_one_input').hide()
    $('#prize_condition_two_input').hide()
    $('#prize_condition_three_multiple_of_input').hide()
    $('#prize_condition_three_greater_than_input').hide()
    return

  hide_all()
  $('#prize_condition_exact_numbers').click ->
    hide_all()
    $('#prize_condition_one_input').show()
    return
  $('#prize_condition_multiple_of').click ->
    hide_all()
    $('#prize_condition_two_input').show()
    return
  $('#prize_condition_multiple_of_and_greater_than').click ->
    hide_all()
    $('#prize_condition_three_multiple_of_input').show()
    $('#prize_condition_three_greater_than_input').show()
    return
  return
