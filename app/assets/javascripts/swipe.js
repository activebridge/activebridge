var start = end = swipe = page = 0,
  pages = ['home', 'about', 'services', 'team', 'portfolio'],
  slider = document.getElementById('pages'),
  swipeEndX = 100 * page;

slider.addEventListener('touchstart', function(event) {
    swipe = 0;
    start = event.changedTouches[0].pageX;
}, false);

slider.addEventListener('touchmove', function(event) {
  swipe = (Math.abs(event.changedTouches[0].pageX - start) / window.outerWidth * 100) + 10
  if (swipe > 15) {
    if (start > event.changedTouches[0].pageX) {
      touch = Math.abs(swipeEndX) + swipe
    } else {
      touch = Math.abs(swipeEndX) - swipe
    }
    slide(touch);
  }
}, false);

slider.addEventListener('touchend', function(event) {
  end = event.changedTouches[0].pageX;
  if (swipe > 25) {
    this.className = 'active'
    if (start > end) {
      page += 1;
    } else {
      page -= 1;
    }
  }
  if (page > 3) page = 0;
  if (page < 0) page = 0;
  swipe = 100 * page;
  swipeEndX = swipe
  slide(swipe);
}, false);

function slide(val) {
  slider.style.transform = 'translate(-' + (val).toFixed() + '%)';
}

slider.addEventListener('transitionend', function(){ this.className = '' }, false);
