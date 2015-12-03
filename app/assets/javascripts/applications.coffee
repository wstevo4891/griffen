# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $radioLabel = $('label.radio-inline')
  $radioRow = $('div.radio-row')
  $phoneLine = $('div.phone-line')
  enquire.register 'screen and (max-width: 480px)',
    match: ->
      $radioLabel.removeClass('radio-inline').addClass 'radio'
      $radioRow.removeClass('radio-row').addClass 'mobile-radio-row'
      $phoneLine.removeClass('phone-line').addClass 'mobile-radio-row'
      return
    unmatch: ->
      $radioLabel.removeClass('radio').addClass 'radio-inline'
      $radioRow.removeClass('mobile-radio-row').addClass 'radio-row'
      $phoneLine.removeClass('mobile-radio-row').addClass 'phone-line'
      return
  return