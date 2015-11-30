# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$v6dcs = $('.v610').attr('data-click-state', 0)

$v5dcs = $('.v510').attr('data-click-state', 0)

$v610Move = ->
  if $v6dcs != 1
    $v6dcs = 1
    $('.v510').hide 'slow'
    $('.v610').animate { left: '+=5em' }, 'slow'
    $('.p610').show 'slow'
  else if $v6dcs == 1
    $v6dcs = 0
    $('.p610').hide 'slow'
    $('.v510').show 'slow'
    $('.v610').animate { left: '-=5em' }, 'slow'

$v510Move = ->
  if $v5dcs != 1
    $v5dcs = 1
    $('.v610').hide 'slow'
    $('.v510').animate { left: '-=5em' }, 'slow'
    $('.p510').show 'slow'
  else if $v5dcs == 1
    $v5dcs = 0
    $('.p510').hide 'slow'
    $('.v610').show 'slow'
    $('.v510').animate { left: '+=5em' }, 'slow'

$mobilev610Move = ->
  if $v6dcs != 1
    $v6dcs = 1
    $('.p610').show 'slow'
  else if $v6dcs == 1
    $v6dcs = 0
    $('.p610').hide 'slow'

$mobilev510Move = ->
  if $v5dcs != 1
    $v5dcs = 1
    $('.p510').show 'slow'
  else if $v5dcs == 1
    $v5dcs = 0
    $('.p510').hide 'slow'

main = ->
  $('.v610').on 'click', ->
    if $('.demo-2').css("display") == "inline-block"
      $v610Move()
    else if $('.demo-2').css("display") == "block"
      $mobilev610Move()
    
  $('.v510').on 'click', ->
    if $('.demo-2').css("display") == "inline-block"
      $v510Move()
    else if $('.demo-2').css("display") == "block"
      $mobilev510Move()


$(document).ready main
