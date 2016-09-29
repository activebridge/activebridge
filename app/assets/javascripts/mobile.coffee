#= require swipe

[].forEach.call document.querySelectorAll('nav a'), (a) ->
  a.addEventListener('click', (e) -> navigate(e))

navigate = (e) ->
  e.preventDefault()
  @page = @pages.indexOf(e.currentTarget.getAttribute('href'))
  @swipeEndX = @page * 100
  @slider.className = 'active'
  slide(@swipeEndX)
  navigator.vibrate(70)

document.body.addEventListener 'gesturestart', (e) -> e.preventDefault()

# navigator.serviceWorker.register('/sw.js') if (navigator.serviceWorker)
