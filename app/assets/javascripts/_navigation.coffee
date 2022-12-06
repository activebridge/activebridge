drag = document.getElementById('draggable-zone')
scrollContainer = document.getElementById('scroll-container')
body = document.body
container = document.getElementById('main-container')

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
  if horizontal
    if (startX > event.changedTouches[0].pageX)
      drag.classList.add('touch-left')
    else
      drag.classList.add('touch-right')

)

body.addEventListener 'touchend', ((event) ->
  drag.classList.remove('touch-right')
  drag.classList.remove('touch-left')
)

scrollContainer.addEventListener 'click', ((event) ->
  if container.scrollLeft <= 0
    container.scrollTo({
      left: 1000,
      behavior: "smooth"
    })
)