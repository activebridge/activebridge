#= require _analytics
#= require _smartlook
if navigator.appVersion.toUpperCase().indexOf('MSIE') != -1 or
    navigator.appVersion.toUpperCase().indexOf('TRIDENT') != -1 or
      navigator.appVersion.toUpperCase().indexOf('EDGE') != -1

  document.querySelector('html').classList.add('ie')

ajax = (method, href, async = true) ->
  xhr = new XMLHttpRequest()
  xhr.open(method, href, async)
  xhr.setRequestHeader('Accept', 'text/javascript')
  return xhr

currentEl = 0
prevEl = 0
header = document.getElementById('header')
backToTopButton = document.getElementById('back-to-top')
transformTetris = (first, second, third, fourth, fifth, lower) ->
  first.style.transform = 'rotate(90deg)'
  second.style.transform = 'translate(57%, 165%)'
  third.style.transform = 'rotate(180deg) translate(-56.5%, 77.5%)'
  fourth.style.transform = 'rotate(90deg) translate(17.8%, -79.5%)'
  fifth.style.transform = 'rotate(90deg) translate(31.5%, 213.5%)'
  lower.style.visibility = 'visible'
  lower.style.transform = 'translateY(100%) translateX(-7%)'


toggleHeader = () ->
  if header
    prevEl = currentEl
    currentEl = window.pageYOffset
    if ( currentEl > prevEl )
      header.style.cssText = 'opacity: 1; z-index: 4'
    else
      header.style.cssText = 'opacity: 0'
    if ((currentEl/document.documentElement.clientHeight * 100) > 160 )
      first = document.getElementById('first_lower')
      second = document.getElementById('second_lower')
      third = document.getElementById('third_lower')
      fourth = document.getElementById('fourth_lower')
      fifth = document.getElementById('fifth_lower')
      lower = document.getElementById('lower')
      transformTetris(first, second, third, fourth, fifth, lower)

rotateLogo = (e) ->
  elementX = 0
  elementY = 0
  elementW = 0
  elementH = 0
  mouseX = 0
  mouseY = 0
  position = document.querySelector(".inner").getBoundingClientRect()
  obj = document.querySelector(".inner")
  elementX = position.left
  elementY = position.top

  elementW = obj.offsetWidth
  elementH = obj.offsetHeight

  halfW = elementW/2
  halfH = elementH/2

  mouseX = (e.pageX - elementX - halfW)/halfW
  mouseY = (e.pageY - elementY - halfH)/halfH

  mouseX = Math.round(mouseX * 100)/100
  mouseY = Math.round(mouseY * 100)/100
  obj.style.transform = "rotateX(" + (-mouseY*10) + "deg) rotateY(" + mouseX*10 + "deg)"

zeroizeLogoTransform = ->
   document.querySelector(".inner").style.transform = "rotateX(0deg) rotateY(0deg)"

window.submit = (form) ->
  document.getElementById('submit').disabled = true
  xhr = ajax('POST', form.action)
  xhr.onreadystatechange = ->
    return if xhr.readyState != 4
    if xhr.status == 200
      form = document.getElementById('contact_form')
      form.reset()
    else
      document.getElementById('submit').disabled = false

  data = new FormData(document.querySelector('form'))
  xhr.send(data)
  dataLayer.push({'event':'formSubmitted', 'formName':'ContactUs'})
  document.getElementById('toggle-envelop-checkbox').checked = false
  document.getElementById('envelop_success_message').style.opacity = '0.8'
  setTimeout ->
    closeWindow()
  , 3500
  return false

scrollToTop = ->
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  })

showBackToTopButton = ->
  scroll = window.pageYOffset
  if scroll > 50
    if !backToTopButton.classList.contains('show')
      backToTopButton.classList += 'show'
  else
    backToTopButton.classList.remove('show')

handleScroll = ->
  toggleHeader()
  showBackToTopButton() if document.querySelector('#back-to-top')
  return

document.body.onscroll = handleScroll
backToTopButton.onclick = scrollToTop if backToTopButton
document.querySelector(".container_index").onmousemove = rotateLogo if document.querySelector(".container_index")
document.querySelector(".container_index").onmouseout = zeroizeLogoTransform if document.querySelector(".container_index")
