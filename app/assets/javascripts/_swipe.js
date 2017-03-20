var startX = startY = endX = endY = swipeX = swipeY = page = 0,
  pages = ['home', 'about', 'services', 'testimonials', 'contact'],
  slider = document.getElementById('pages'),
  bg = document.getElementById('bg'),
  horizontal,
  swipeEndX = 100 * page;

slider.addEventListener('touchstart', function(event) {
    swipeX = 0;
    startX = event.changedTouches[0].pageX;
    startY = event.changedTouches[0].pageY;
}, false);

slider.addEventListener('touchmove', function(event) {
  swipeX = (Math.abs(event.changedTouches[0].pageX - startX) / (window.outerWidth || window.innerWidth) * 100)
  swipeY = (Math.abs(event.changedTouches[0].pageY - startY) / (window.outerHeight || window.innerHeight) * 100)
  horizontal = horizontal || swipeX > swipeY
  if (horizontal) {
    event.preventDefault();
    if (startX > event.changedTouches[0].pageX) {
      touch = Math.abs(swipeEndX) + swipeX
    } else {
      touch = Math.abs(swipeEndX) - swipeX
    }
    slide(touch);
  }
}, false);

slider.addEventListener('touchend', function(event) {
  this.className = 'active'
  if (swipeX > 25 && swipeY < 10) {
    if (startX > event.changedTouches[0].pageX) {
      page += 1;
    } else {
      page -= 1;
    }
  }
  if (page > pages.length - 1) page = 0;
  if (page < 0) page = pages.length - 1;
  swipeX = 100 * page;
  swipeEndX = swipeX
  horizontal = null;
  nav(page);
  slide(swipeX);
}, false);

function slide(val) {
  slider.style.transform = 'translate(-' + (val).toFixed() + '%)';
  bg.style.transform = 'translate(' + (val/8).toFixed() + '%)';
}

slider.addEventListener('transitionend', function(){ this.className = '' }, false);
