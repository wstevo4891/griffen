# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$v6dcs = $('.v610').attr('data-click-state', 0)

$v5dcs = $('.v510').attr('data-click-state', 0)

$v610Move = ->
  if $v6dcs != 1
    $v6dcs = 1
    $('.v510').hide 1000
    $('.v610').animate { left: '+=3em' }, 1000
    $('.p610').show 1000
  else if $v6dcs == 1
    $v6dcs = 0
    $('.p610').hide 1000
    $('.v510').show 1000
    $('.v610').animate { left: '-=3em' }, 1000
  return

$v510Move = ->
  if $v5dcs != 1
    $v5dcs = 1
    $('.v610').hide 1000
    $('.v510').animate { left: '-=1em' }, 1000
    $('.p510').show 1000
  else if $v5dcs == 1
    $v5dcs = 0
    $('.p510').hide 1000
    $('.v610').show 1000
    $('.v510').animate { left: '+=1em' }, 1000
  return
 
$mv6dcs = $('.mobile-v610').attr('data-click-state', 0)

$mv5dcs = $('.mobile-v510').attr('data-click-state', 0)

$mobile_v610Move = ->
  if $mv6dcs != 1
    $mv6dcs = 1
    $('.mobile-p610').show 'slow'
  else if $mv6dcs == 1
    $mv6dcs = 0
    $('.mobile-p610').hide 'slow'
  return

$mobile_v510Move = ->
  if $mv5dcs != 1
    $mv5dcs = 1
    $('.mobile-p510').show 'slow'
  else if $mv5dcs == 1
    $mv5dcs = 0
    $('.mobile-p510').hide 'slow'
  return

main = ->
  $v6dcs = 0
  $v5dcs = 0
  $mv6dcs = 0
  $mv5dcs = 0

  $('.v610').on 'click', ->
    $v610Move()
    return
    
  $('.v510').on 'click', ->
    $v510Move()
    return
    
  $('.mobile-v610').on 'click', ->
    $mobile_v610Move()
    return
    
  $('.mobile-v510').on 'click', ->
    $mobile_v510Move()
    return
  return

$(document).ready main
