$ ->
  weekChart = {}
  intervalId = 0
  runTimer = $('tr.error .timer')
  hideStoppedControls = ->
    $('tr:not(".error")').find('.btn-group').hide()

  $('.best_in_place').best_in_place()
  $('#new_task').click (e) ->
    e.preventDefault()
    $('#new_tsk_mod').modal keyboard: true

  $('.btn-danger:contains("Start")').click (e) ->
    e.preventDefault()
    taskId = $(@).closest('.btn-group').data('task_id')
    $.ajax(
      url: Routes.task_time_trackings_path(taskId, { format: 'json'} ),
      type: 'POST'
    ).done (data) =>
      $(@).closest('tr').addClass('error')
      $(@).closest('tr').find('span.label').addClass('label-important')
      intervalId = timerGo()

  $('.btn:contains("Stop")').click (e) ->
    e.preventDefault()
    taskId = $(@).closest('.btn-group').data('task_id')
    trackId = $(@).closest('.btn-group').data('track_id')
    $.ajax(
      url: Routes.task_time_tracking_path(taskId, trackId, { format: 'json'} ),
      type: 'DELETE'
    ).done (data) =>
      $(@).closest('tr').find('.label').removeClass('label-important')
      $(@).closest('tr').removeClass('error')
      $('tr:not(".error")').find('.btn-group').show()
      clearInterval(intervalId)

  pad = (val) -> if(val > 9) then val else ("0" + val)

  updateTimer = ->
    sec = parseInt($('span.secs.label-important').text())
    mins = parseInt($('span.mins.label-important').text())
    $('span.secs.label-important').html(pad(++sec%60))
    $('span.mins.label-important').html(pad(++mins%60)) if sec%60 is 0

  timerGo = ->
    setInterval updateTimer, 1000

  if runTimer
    runTimer.find('span.label').addClass('label-important')
    hideStoppedControls()
    intervalId = timerGo()

  $('tr:not(".error")').find('.btn-group').show()

  recOpts =
    chart:
      renderTo: $('#week')[0],
      type: 'bar',
      backgroundColor: '#ddd'
    title: false
    xAxis:
      categories: []
    yAxis:
      min: 0,
      title: false
    plotOptions:
      series:
        stacking: 'normal',
        cursor: 'pointer'
    series: []

  $('.chart-container').css('height', $('table').css('height'))

  recSeries = $('div[data-chart_series]').data('chart_series')
  $.each recSeries, (i, s) ->
    recOpts.xAxis.categories.push('Day')
    recOpts.series.push(JSON.parse(s))
  weekChart = new Highcharts.Chart(recOpts)

