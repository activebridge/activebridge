#= require swipe

[].forEach.call document.querySelectorAll('nav a'), (a) ->
  a.addEventListener('click', (e) -> navigate(e))

navigate = (e) ->
  e.preventDefault()
  @page = @pages.indexOf(e.currentTarget.getAttribute('href'))
  @swipeEndX = @page * 100
  @slider.className = 'active'
  slide(@swipeEndX)
