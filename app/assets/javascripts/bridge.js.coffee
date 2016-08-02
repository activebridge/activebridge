# Fly through the bridge

navigate = ->
  draw()

draw = ->
  scroll = (window.scrollY or window.pageYOffset) / (document.body.clientHeight - (window.innerHeight)) * 3000
  canvas.setAttribute 'width', window.innerWidth
  canvas.setAttribute 'height', window.innerHeight
  front.style.opacity = 1 - (scroll / 100)
  about.style.opacity = 0
  services.style.opacity = 0
  light.style.opacity = 0
  our_team.style.opacity = 0
  blog_link.style.opacity = 0
  if scroll < 500
    drawImageProp ctx, hills, 0, -scroll * 3.9 / 4, canvas.width, canvas.height + scroll * 3.9 / 2
    drawImageProp ctx, cloudBeforeSecondGate1, -scroll * 2 - 250, -80, canvas.width + 250 + scroll * 2, canvas.height + 550
    drawImageProp ctx, cloudBeforeSecondGate2, scroll / 2 - 100, -400, canvas.width + 330 + scroll, canvas.height + 550
    drawImageProp ctx, bridgeBack, 0, -scroll * 3.9 / 2, canvas.width, canvas.height + scroll * 3.9
    drawImageProp ctx, cloudBeforeSecondGate2, 0, scroll * 0.07 - 35, canvas.width, canvas.height
    drawImageProp ctx, bridgeFront, 0, -scroll * 3.9 / 2, canvas.width, canvas.height + scroll * 3.9
    about.style.opacity = 1
    about.style.left = 36 - (scroll * 1 / 16) + '%'
    about.style.bottom = 36 - (scroll * 1 / 16) + '%'
    scl = 1 + scroll * 1 / 300
    about.style.transform = 'scale(' + scl + ')'
    services.style.opacity = 1
    services.style.right = 42 - (scroll / 55) + '%'
    services.style.transform = 'scale(' + scroll * 1 / 300 + ')'
    our_team.style.opacity = 1
    our_team.style.left = 48 - (scroll / 60) + '%'
    our_team.style.transform = 'scale(' + scroll * 1 / 500 + ')'
    blog_link.style.opacity = 1
    blog_link.style.right = 49 - (scroll / 60) + '%'
    blog_link.style.transform = 'scale(' + scroll * 1 / 500 + ')'
  else if scroll < 1300
    drawImageProp ctx, hills, 0, -500, canvas.width, scroll + 1183
    drawImageProp ctx, cloudBeforeSecondGate1, -scroll * 2 - 250, -80, canvas.width + 250 + scroll * 2, canvas.height + 550
    drawImageProp ctx, cloudBeforeSecondGate2, scroll / 2 - 100, -400, canvas.width + 330 + scroll, canvas.height + 550
    drawImageProp ctx, bridgeBack, 0, -scroll * 2.05, canvas.width, scroll * 5.5
    drawImageProp ctx, cloudBeforeSecondGate2, 0, scroll - 487, canvas.width, canvas.height
    drawImageProp ctx, bridgeFront, 0, -scroll * 2.05, canvas.width, scroll * 5.5
    about.style.opacity = 1
    about.style.left = 36 - (scroll * 1 / 16) + '%'
    about.style.bottom = 36 - (scroll * 1 / 16) + '%'
    services.style.opacity = 1
    services.style.right = 42 - (scroll / 55) + '%'
    services.style.bottom = -(scroll * 2.1 - 1965) / 20 + '%'
    services.style.transform = 'scale(' + scroll * 1 / 300 + ')'
    our_team.style.opacity = 1
    our_team.style.left = 48 - (scroll / 60) + '%'
    our_team.style.bottom = -(scroll * 1.9 - 2000) / 20 + '%'
    our_team.style.transform = 'scale(' + scroll * 1 / 500 + ')'
    blog_link.style.opacity = 1
    blog_link.style.right = 48 - (scroll / 55) + '%'
    blog_link.style.bottom = -(scroll * 1.9 - 2120) / 20 + '%'
    blog_link.style.transform = 'scale(' + scroll * 1 / 500 + ')'
  else
    drawImageProp ctx, hills, 0, -600, canvas.width, scroll * 2.3
    drawImageProp ctx, cloudBeforeSecondGate1, -scroll * 2 - 250, -80, canvas.width + 250 + scroll * 2, canvas.height + 550
    drawImageProp ctx, cloudBeforeSecondGate2, scroll / 2 - 100, -400, canvas.width + 330 + scroll, canvas.height + 550
    drawImageProp ctx, bridgeBack, 0, -(scroll * 43 - 46820) / 3.476, canvas.width, scroll * 40 - 45000
  if scroll > 900
    light.style.opacity = 1
    contacts.style.opacity = scroll / 1000 - 1.5
    contacts.style.transform = 'scale(' + (scroll * 2 - 2000) / 4000 + ')'
    st = Math.random()
    if st > 0.5
      st = st
    else
      st = -st
    lightning.style.transform = 'scale(1,' + st + ')'
    light.style.left = 100 - ((scroll - 900) * 3) + '%'
  else
    contacts.style.opacity = 0
  if scroll > 1200
    portfolio.style.visibility = 'visible'
    lightning.style.transform = 'scale(' + Math.random() * scroll / 100 + ',' + Math.random() * scroll / 200 + ')'
    machine.style.opacity = scroll * 1 / 1300
    portfolio.style.opacity = scroll * 1 / 1000
    light.style.opacity = 1
    light.style.left = '0%'
    delorian.style.left = 185 - (scroll * scroll * 1 / 8000) + '%'
    delorian.style.top = -50 + scroll * 1 / 15 + '%'
    delorian.style.transform = 'scale(' + scroll * 1 / 1200 + ')'
  else
    machine.style.opacity = 0
    portfolio.style.opacity = 0
    portfolio.style.visibility = 'hidden'
    delorian.style.left = '0%'
  if scroll < 1300 and scroll > 900
    lightning.style.visibility = 'visible'
  else if scroll > 1200 or scroll < 900
    lightning.style.visibility = 'hidden'

loadImg = ->
  i += 1
  if i >= counter
    canvas.style.opacity = 1
    document.body.style.overflowY = 'auto'
    $('.popup-link, .scroll-arrows, .hide-image').show()
    $('.loader').hide()

front = document.getElementById('front')
machine = document.getElementById('machine')
lightning = document.getElementById('lightning')
light = document.getElementById('light')
contacts = document.getElementById('our_contacts')
about = document.getElementById('about_us')
services = document.getElementById('our_services')
team = document.getElementById('our_team')
portfolio = document.getElementById('portfolio')
delorian = document.getElementById('delorian')
blog_link = document.getElementById('blog_link')

timeOut = 0

window.onresize = ->
  if timeOut
    clearTimeout timeOut
  timeOut = setTimeout(draw, 10)

window.onload = draw
window.onscroll = navigate

canvas = document.getElementById('canvas')
ctx = canvas.getContext('2d')

bridgeFront = new Image
bridgeFront.onload = loadImg
bridgeFront.src = 'https://res.cloudinary.com/active-bridge/image/upload/bridge_front_ncgkbi.png'

bridgeBack = new Image
bridgeBack.onload = loadImg
bridgeBack.src = 'https://res.cloudinary.com/active-bridge/image/upload/bridge_back_uaxnrh.png'

cloudBeforeSecondGate2 = new Image
cloudBeforeSecondGate2.onload = loadImg
cloudBeforeSecondGate2.src = 'https://res.cloudinary.com/active-bridge/image/upload/cloud_before_second_gate2_fbma0m.png'

cloudBeforeSecondGate1 = new Image
cloudBeforeSecondGate1.onload = loadImg
cloudBeforeSecondGate1.src = 'https://res.cloudinary.com/active-bridge/image/upload/cloud_before_second_gate1_byxhde.png'

hills = new Image
hills.onload = loadImg
hills.src = 'https://res.cloudinary.com/active-bridge/image/upload/hills_jhicrj.jpg'

counter = 5
i = 0

$(document).on 'click', '.scroll-arrows', ->
  $('body, html').animate { scrollTop: 400 }, 'slow'

$(document).on 'click', '.popup-link', (e) ->
  $.getScript this.href
  e.preventDefault()
