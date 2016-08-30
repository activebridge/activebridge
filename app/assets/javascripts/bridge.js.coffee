@setCookie = (trigger) ->
  tomorrow = new Date()
  tomorrow.setDate(tomorrow.getDate() + 1)
  document.cookie = "flag=#{trigger.checked}; expires=#{tomorrow}"

csrf = document.head.querySelector('meta[name=csrf-token]').content

closeWindow = ->
  document.querySelector('#lazy_overlay').className = ''
  document.body.className = ''
  history.pushState({}, null, "/")

openPage = (event) ->
  href = this.href.baseVal
  xhr = new XMLHttpRequest()
  xhr.open( "GET", href, false)
  xhr.setRequestHeader('X-CSRF-Token', csrf)
  xhr.setRequestHeader('Accept', 'text/javascript')
  xhr.onload = ->
    if (xhr.readyState == 4 && xhr.status == 200)
      document.body.className = href
      eval(xhr.responseText)
  xhr.send()
  initTeamScroll()
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
    else return
  rotateTeam(direction)

browseProjects = (keyCode, activeProject) ->
  switch keyCode
    when 37 then direction = 'previous'
    when 39 then direction = 'next'
    when 27 then direction = 'close'
    else return
  if direction == 'close'
    activeProject.checked = false
  else
    switchId = activeProject.dataset[direction]
    document.getElementById(switchId).checked = true

browseData = (event) ->
  if activeProject = document.querySelector(".projects input:checked[name='active-section']")
    browseProjects(event.keyCode, activeProject)
  else if spinShape = document.querySelector('.members')
    browseTeam(event.keyCode)

document.querySelector('#lazy_close').addEventListener('click', closeWindow, false)
document.querySelector('#portfolio').addEventListener('click', openPage, false)
document.querySelector('#testimonials').addEventListener('click', openPage, false)
document.querySelector('#contact').addEventListener('click', openPage, false)
document.querySelector('#about').addEventListener('click', openPage, false)
document.querySelector('#services').addEventListener('click', openPage, false)
document.querySelector('#team').addEventListener('click', openPage, false)
document.addEventListener('keydown', browseData, false)
initTeamScroll()
