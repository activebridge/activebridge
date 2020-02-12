slides = document.querySelectorAll('main section')
links = document.querySelectorAll('nav a')
drag = document.getElementById('draggable-zone')
scrollContainer = document.getElementById('scroll-container')
body = document.body

navigate = ->
  trigered = false
  i = 0
  while i < slides.length
    slide = slides[i]
    links[i].classList.remove 'active'
    if slide.offsetTop + slide.offsetHeight > window.scrollY + window.outerHeight * 0.3
      if !trigered
        links[i].className = 'active'
        history.replaceState {}, '', '#' + slide.id
      trigered = true
    i++

window.onscroll = navigate

startX = startY = swipeX = swipeY = 0

body.addEventListener 'touchstart', ((event) ->
  swipeX = 0;
  startX = event.changedTouches[0].pageX;
  startY = event.changedTouches[0].pageY;
)

body.addEventListener 'touchmove', ((event) ->
  swipeX = (Math.abs(event.changedTouches[0].pageX - startX) / (window.outerWidth || window.innerWidth) * 100)
  swipeY = (Math.abs(event.changedTouches[0].pageY - startY) / (window.outerHeight || window.innerHeight) * 100)
  horizontal = horizontal || swipeX > swipeY
  if horizontal && !Object.values(event.path).includes(document.getElementById('testimonials'))
    drag.classList.add('touch')
)

body.addEventListener 'touchend', ((event) ->
  drag.classList.remove('touch')
)

scrollContainer.addEventListener 'click', ((event) ->
  if body.scrollLeft == 0
    body.scrollTo(100, 0);
)