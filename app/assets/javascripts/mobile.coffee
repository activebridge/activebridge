#= require _analytics
#= require _swipe

[].forEach.call document.querySelectorAll('nav a'), (a) ->
  a.className = ''
  a.addEventListener('click', (e) -> navigate(e))

navigate = (e) ->
  e.preventDefault()
  @page = @pages.indexOf(e.currentTarget.getAttribute('href'))
  @swipeEndX = @page * 100
  @slider.className = 'active'
  nav(@page)
  slide(@swipeEndX)
  navigator.vibrate(70)

@nav = (i) ->
  link = document.querySelector('nav a.active')
  link && link.className = ''
  document.querySelectorAll('nav a')[i].className = 'active'


# IOS safari zoom hack
document.body.addEventListener 'gesturestart', (e) -> e.preventDefault()
#

#Anchor
document.getElementById('pages').setAttribute('data-page', location.pathname.split('/')[1])

#Service Worker
navigator.serviceWorker.register('/serviceworker.js', { scope: './' }) if (navigator.serviceWorker)

link = document.querySelector("nav a[href='#{location.pathname}']")
link && link.className = 'active'
