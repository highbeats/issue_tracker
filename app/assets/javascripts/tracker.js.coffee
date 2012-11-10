$ ->
  $('.best_in_place').best_in_place()
  $('#new_task').click (e) ->
    e.preventDefault()
    $('#new_tsk_mod').modal keyboard: true

  $('.btn-danger:contains("Start")').click ->
    taskId = $(@).closest('.btn-group').data('task_id')
    $.ajax(
      url: Routes.task_time_trackings_path(taskId, { format: 'json'} ),
      type: 'POST'
    ).done (data) =>
      $(@).closest('tr').addClass('error')

  $('.btn:contains("Stop")').click ->
    taskId = $(@).closest('.btn-group').data('task_id')
    trackId = $(@).closest('.btn-group').data('track_id')
    $.ajax(
      url: Routes.task_time_tracking_path(taskId, trackId, { format: 'json'} ),
      type: 'DELETE'
    ).done (data) => $(@).closest('tr').removeClass('error')


  incrementTimer = ->
    timer = $('td.timer').first()
    timerHours = parseInt(timer.text().split(':')[0])
    timerMins = parseInt(timer.text().split(':')[1])
    if timerMins < 60
      newHours = timerHours
      newMins = timerMins++
      timer.text(newHours.toString() + ":" + newMins.toString())
    else
      newHours = timerHours + 1
      newMins = 0
      timer.text(newHours.toString() + ":" + newMins.toString())

  setInterval(incrementTimer(), 6000)

