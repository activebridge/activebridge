#= require _analytics

if navigator.appVersion.toUpperCase().indexOf('MSIE') != -1 or
    navigator.appVersion.toUpperCase().indexOf('TRIDENT') != -1 or
      navigator.appVersion.toUpperCase().indexOf('EDGE') != -1

  document.querySelector('html').classList.add('ie')

window.submit = (form) ->
  document.getElementById('submit').disabled = true
  xhr = ajax('POST', form.action)
  xhr.onreadystatechange = ->
    return if xhr.readyState != 4
    if xhr.status == 200
      form = document.getElementById('contact_form').parentNode
      form.reset()
    else
      document.getElementById('submit').disabled = false

  data = new FormData(document.querySelector('form'))
  xhr.send(data)
  dataLayer.push({'event':'formSubmitted', 'formName':'ContactUs'})
  return false

window.animate = -> document.getElementById('ab').checked = true

closeWindow = ->
  document.querySelector('#lazy_overlay').className = ''
  document.body.className = ''
  history.pushState({}, null, '/')

openPage = (event) ->
  document.getElementById('lazy_overlay').className = 'active'
  document.getElementById('lazy_body').innerHTML = ''
  document.getElementById('lazybox').className = 'hidden'
  href = this.href.baseVal || this.href
  xhr = ajax('GET', href)
  xhr.onload = ->
    if (xhr.readyState == 4 && xhr.status == 200)
      document.body.className = href
      eval(xhr.responseText)
      focus()
      initTeamScroll()
  xhr.send()
  dataLayer.push({
    'event':'VirtualPageview',
    'virtualPageURL': href,
    'virtualPageTitle' : href
  })
  event.preventDefault()

initTeamScroll = ->
  if document.querySelector('.members')
    document.querySelector('.members').addEventListener('mousewheel', scrollTeam, false)
    document.querySelector('.members').addEventListener('DOMMouseScroll', scrollTeam, false)

scrollTeam = (event) ->
  event = window.event || event
  delta = Math.max(-1, Math.min(1, (event.wheelDelta || -event.detail)))
  rotateTeam(delta)

rotateTeam = (direction) ->
  currentRotate = document.querySelector('#rotate-shape').style.transform.split('(')[1]
  angle = parseInt(currentRotate) + 2*direction
  document.querySelector('#rotate-shape').style.transform = 'rotateY(' + angle + 'deg)'


browseTeam = (keyCode) ->
  switch event.keyCode
    when 37 then direction = -1
    when 39 then direction = 1
    when 27 then document.getElementById('lazy_close').click()
    else return
  rotateTeam(direction)

browseData = (event) ->
  if spinShape = document.querySelector('.members')
    browseTeam(event.keyCode)
  else if event.keyCode == 27
    document.getElementById('lazy_close').click()

document.querySelector('#lazy_close').addEventListener('click', closeWindow, false)
document.querySelector('#portfolio').addEventListener('click', openPage, false)
document.querySelector('#testimonials').addEventListener('click', openPage, false)
document.querySelector('#contact').addEventListener('click', openPage, false)
document.querySelector('#about').addEventListener('click', openPage, false)
document.querySelector('#services').addEventListener('click', openPage, false)
document.querySelector('#team').addEventListener('click', openPage, false)
document.querySelector('#contactus').addEventListener('click', openPage, false)
document.addEventListener('keydown', browseData, false)
initTeamScroll()

ajax = (method, href, async = true) ->
  xhr = new XMLHttpRequest()
  xhr.open(method, href, async)
  xhr.setRequestHeader('Accept', 'text/javascript')
  return xhr

window.onpopstate = closeWindow

focus = ->
  controls = document.querySelectorAll("input[type='radio']")
  return unless controls[0]
  input.addEventListener('keydown', (e) ->
    @.focus()
    e.preventDefault() if (e.which == 9)) for input in controls
focus()

@keepFocus = (input) ->
  setTimeout ->
    return if document.querySelector('input[type="radio"]:checked') != input
    input.focus()
  , 10
