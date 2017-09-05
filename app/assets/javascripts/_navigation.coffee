slides = document.querySelectorAll('main section')
links = document.querySelectorAll('nav a')

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
