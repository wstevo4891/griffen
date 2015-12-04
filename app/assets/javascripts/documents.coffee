# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('page:change', ()->

  onAddFile = (event) ->
    file = event.target.files[0]
    url = URL.createObjectURL(file)

    memidContainer = $(this).parent().siblings('div.memid')
    shidContainer = $(this).parent().siblings('div.shid')

    if memidContainer.find('img').length == 0
      memidContainer.append('<img src="' + url + '" />')
    else
      memidContainer.find('img').attr('src', url)
      
    if shidContainer.find('img').length == 0
      shidContainer.append('<img src="' + url + '" />')
    else
      shidContainer.find('img').attr('src', url)  

  # for redisplayed file inputs and file inputs in edit page
  $('input[type=file]').each(()->
      $(this).change(onAddFile)
  )
  
  $('#members, #shareholders').bind('cocoon:before-insert', (e,task_to_be_added) ->
      console.log(task_to_be_added)
      task_to_be_added.fadeIn('slow')
  )

  $('#members, #shareholders').bind('cocoon:before-remove', (e, task) ->
      $(this).data('remove-timeout', 1000)
      task.fadeOut('slow')
  )  

  # register event handler when new cocoon partial is inserted from link_to_add_association link
  $('body').on('cocoon:after-insert', (e, addedPartial) ->
      $('input[type=file]', addedPartial).change(onAddFile)
  )

)    