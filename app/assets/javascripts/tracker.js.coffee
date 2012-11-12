$ ->
  intervalId = 0
  weekChart = {}

  $('#new_task').click (e) ->
    e.preventDefault()
    $('#new_tsk_mod').modal keyboard: true

  pad = (val) -> if(val > 9) then val else ("0" + val)

  updateTimer = ->
    sec = parseInt($('.secs.label-important').text())
    mins = parseInt($('.mins.label-important').text())
    $('.secs.label-important').html(pad(++sec%60))
    $('.mins.label-important').html(pad(++mins%60)) if sec%60 is 0
##
#

  $('.chart-container').css('height', '150')
  $('.best_in_place').best_in_place()

  if $('tr.error').length
    $('tr.error').find('span.label').addClass('label-important')
    $('tr:not(".error")').find('.btn-group').hide()

    intervalId = setInterval(updateTimer, 1000)

## Start - Stop
#
  $('.btn-danger:contains("Start")').click (e) ->
    e.preventDefault()
    unless $('tr.error').length
      startTaskId = $(@).closest('.btn-group').data('task_id')
      $.ajax(
        url: Routes.task_time_trackings_path(startTaskId, { format: 'json'} ),
        type: 'POST'
      ).done (data) =>
        clearInterval(intervalId)
        $(@).closest('tr').addClass('error')
        $(@).closest('tr').find('span.label').addClass('label-important')
        $('tr:not(".error")').find('.btn-group').hide()
        intervalId = setInterval(updateTimer, 1000)

  $('.btn:contains("Stop")').click (e) ->
    e.preventDefault()
    if $('tr.error').length
      stopTaskId = $(@).closest('.btn-group').data('task_id')
      trackId = $(@).closest('.btn-group').data('track_id')
      $.ajax(
        url: Routes.task_time_tracking_path(stopTaskId, trackId, { format: 'json'} ),
        type: 'DELETE'
      ).done (data) =>
        clearInterval(intervalId)
        $(@).closest('tr').find('.label').removeClass('label-important')
        $(@).closest('tr').removeClass('error')
        $('tr:not(".error")').find('.btn-group').show()

## Chart
#
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


  recSeries = $('div[data-chart_series]').data('chart_series')
  $.each recSeries, (i, s) ->
    recOpts.xAxis.categories.push('Day')
    recOpts.series.push(JSON.parse(s))

  weekChart = new Highcharts.Chart(recOpts)

