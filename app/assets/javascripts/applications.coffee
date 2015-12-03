# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $radioLabel = $('label.radio-inline')
  enquire.register 'screen and (max-width: 480px)',
    match: ->
      $radioLabel.removeClass('radio-inline').addClass 'radio'
      return
    unmatch: ->
      $radioLabel.removeClass('radio').addClass 'radio-inline'
      return
  return