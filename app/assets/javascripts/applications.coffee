# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$mobileRadio = ->
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

$imagePreview = (image, upload) ->
  preview = $(image)
  $(upload).change (event) ->
    input = $(event.currentTarget)
    file = input[0].files[0]
    reader = new FileReader

    reader.onload = (e) ->
      image_base64 = e.target.result
      preview.attr 'src', image_base64
      return

    reader.readAsDataURL file
    return
  return

main = ->
  $mobileRadio()
  $imagePreview '.check-preview img', '.check'
  $imagePreview '.license-preview img', '.license'
  $imagePreview '.iblicense-preview img', '.iblicense'
  $imagePreview '.bpra-preview img', '.bpra'
  $imagePreview '.artinc-preview img', '.artinc'
  $imagePreview '.certform-preview img', '.certform'
  $imagePreview '.opagree-preview img', '.opagree'
  $imagePreview '.stockcert-preview img', '.stockcert'
  $imagePreview '.llclist-preview img', '.llclist'
  $imagePreview '.shlist-preview img', '.shlist'
  $imagePreview '.combuslicense-preview img', '.combuslicense'
  $imagePreview '.combpra-preview img', '.combpra'
  return

$(document).ready(main)
