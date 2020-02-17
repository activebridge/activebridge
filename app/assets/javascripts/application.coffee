#= require _analytics
#= require _smartlook
#= require _navigation

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

toggleHeader = () ->
  if header
    prevEl = currentEl
    currentEl = window.pageYOffset
    if ( currentEl > prevEl )
      header.style.cssText = 'opacity: 1; z-index: 4'
    else
      header.style.cssText = 'opacity: 0'

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
    top: 0
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
  showBackToTopButton() if backToTopButton
  return

window.onload = () ->
  document.body.onscroll = handleScroll
  backToTopButton.onclick = scrollToTop if backToTopButton

viewportHeight = window.innerHeight - 1 + 'px'

window.load = ->
  document.getElementById('scroll-container').style.height = viewportHeight
  document.body.style.height = viewportHeight
  document.getElementById('stylesheets').setAttribute('rel', 'stylesheet');
window.load()
