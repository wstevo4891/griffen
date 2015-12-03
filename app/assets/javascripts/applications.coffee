# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$radioLabel = $('.radio-row label')
$phoneLabel = $('.phone-line label')

enquire.register('screen and (max-width: 480px)',
  match: ->
    $radioLabel.removeClass('radio-inline').addClass 'radio'
    $phoneLabel.removeClass('radio-inline').addClass 'radio'
    return
  unmatch: ->
    $radioLabel.removeClass('radio').addClass 'radio-inline'
    $phoneLabel.removeClass('radio').addClass 'radio-inline'
    return
).listen()