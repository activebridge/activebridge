#= require _analytics
#= require _smartlook
#= require _navigation
#= require _carousel

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
error = "Couldn't verify reCAPTCHA, please try again"
success = "Your request was successfully submitted, please check your email"
alert = document.querySelector('div.alert');
alertMessage = document.querySelector('span.msg');
technologies = document.querySelector('.index-technologies__items')

window.submit = (form) ->
  document.getElementById('submit').disabled = true
  xhr = ajax('POST', form.action)
  xhr.onreadystatechange = ->
    return if xhr.readyState != 4
    if xhr.status == 200
      alertShow(success)
      form = document.getElementById('contact_form')
      form.reset()
    else
      alertShow(error)
      document.getElementById('submit').disabled = false

  data = new FormData(document.querySelector('form'))
  xhr.send(data)
  dataLayer.push({'event':'formSubmitted', 'formName':'ContactUs'})
  return false

alertShow = (message) -> 
  alertMessage.innerText = message
  alert.classList.add("showAlert");
  setTimeout ->
    alert.classList.remove("showAlert");
  , 10000

window.alertHide = ->
  alert.classList.remove("showAlert");

window.toggleTechnologies = ->
  if technologies.classList.contains('open') then technologies.classList.remove('open') else technologies.classList.add('open')

scrollToTop = ->
  window.scrollTo({
    top: 0
  })

handleScroll = ->
  return

window.onload = () ->
  document.body.onscroll = handleScroll

viewportHeight = window.innerHeight - 1 + 'px'

window.load = ->
  document.getElementById('scroll-container').style.height = viewportHeight
  document.body.style.height = viewportHeight
  document.getElementById('stylesheets').setAttribute('rel', 'stylesheet');
window.load()
