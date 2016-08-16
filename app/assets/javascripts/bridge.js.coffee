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
  xhr.setRequestHeader('Content-type', 'applicatio/javascript')
  xhr.onload = ->
    if (xhr.readyState == 4 && xhr.status == 200)
      document.body.className = href
      eval(xhr.responseText)
  xhr.send()
  event.preventDefault()


document.querySelector('#lazy_close').addEventListener('click', closeWindow, false)
document.querySelector('#portfolio').addEventListener('click', openPage, false)
document.querySelector('#testimonials').addEventListener('click', openPage, false)
document.querySelector('#contact').addEventListener('click', openPage, false)
document.querySelector('#about').addEventListener('click', openPage, false)
document.querySelector('#services').addEventListener('click', openPage, false)
document.querySelector('#team').addEventListener('click', openPage, false)
