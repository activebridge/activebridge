$(document).on 'click', '.scroll-arrows', ->
  $('body, html').animate { scrollTop: 400 }, 'slow'

$(document).on 'click', 'svg a', (e) ->
  $.getScript this.href.baseVal
  # $('svg').addClass('portfolio')
  e.preventDefault()

setTimeout((->
    document.body.className = 'awesome'
  ), 2000)


$(document).on 'click', '#lazy_close, #lazy_overlay', ->
  $('svg#main').removeClass()
