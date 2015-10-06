// Fly through the bridge

var step1 = document.getElementById('step1'),
step2 = document.getElementById('step2'),
step3 = document.getElementById('step3'),
step4 = document.getElementById('step4'),
step5 = document.getElementById('step5'),
hills = document.getElementById('hills'),
front = document.getElementById('front'),
machine = document.getElementById('machine'),
lightning = document.getElementById('lightning'),
light = document.getElementById('light'),
contacts = document.getElementById('our_contacts'),
about = document.getElementById('about_us'),
services = document.getElementById('our_services'),
team = document.getElementById('our_team'),
portfolio = document.getElementById('portfolio'),
delorian = document.getElementById('delorian');

window.onscroll = navigate;
function navigate() {
  scroll = document.body.scrollTop / (document.body.clientHeight - window.innerHeight) * 3000

  k = window.innerHeight / 675

  if (scroll < 500/k) {
    step1.style.top = 0 - scroll*2*k + 'px';
    step2.style.top = 0 - scroll*2*k + 'px';
    step1.style.bottom = 0 - scroll*2*k + 'px';
    step2.style.bottom = 0 - scroll*2*k + 'px';
    hills.style.top = 0 - scroll*k + 'px';
    hills.style.bottom = 0 - scroll*k + 'px';
  } else {
    step1.style.top = 500 - scroll*3*k + 'px';
    step2.style.top = 500 - scroll*3*k + 'px';
    step1.style.bottom = 1500 - scroll*5*k + 'px';
    step2.style.bottom = 1500 - scroll*5*k + 'px';
    hills.style.top = 0 - scroll*k + 'px';
    hills.style.bottom = 1000 - scroll*3*k + 'px';
  }

  step3.style.backgroundPositionY = 75 + scroll/6 + '%';
  step4.style.backgroundPositionX = 70 - scroll/6 + '%';
  step5.style.backgroundPositionX = 40 + scroll/6 + '%';

  front.style.opacity = 1 - scroll/100

  if (scroll > 900) {
    contacts.style.opacity = scroll/2000;
    contacts.style.zoom = scroll / 500;
    contacts.style.margin =  '0% ' + 100 - scroll/100 + '%';
    contacts.style.top = -330 + scroll/6 + '%';
    st = Math.random()
    if (st > 0.5) { st = st } else { st = -st}
    lightning.style.transform = "scale(1,"+ st +")";
    light.style.left = 100 - (scroll - 900)/3 + '%';
    step1.style.pointerEvents = 'none';
    step3.style.pointerEvents = 'none';
  } else {
    step1.style.pointerEvents = 'auto';
    step3.style.pointerEvents = 'auto';
    contacts.style.opacity = 0;
  }

  if (scroll > 1200) {
    lightning.style.transform = "scale("+Math.random()*scroll/100 + "," + Math.random()*scroll/200 + ")";
    machine.style.opacity = scroll/1300
    portfolio.style.opacity = scroll/1000
    light.style.left = '0%';
  } else {
    machine.style.opacity = 0;
    portfolio.style.opacity = 0;
  }

  if (scroll < 1300 && scroll > 900) {
    lightning.style.visibility = 'visible';
  } else if (scroll > 1200 || scroll < 900) {
    lightning.style.visibility = 'hidden';
  }

  if (scroll > 1200) {
    delorian.style.left = 185 - scroll*scroll/8000 + '%';
    delorian.style.bottom = 125 - scroll/10 + '%';
    delorian.style.zoom = scroll/12 + '%';
  } else {
    delorian.style.left = '0%';
  }

  if (scroll < 600) {
    about.style.bottom = 37 - scroll/11 + '%';
    about.style.left = 38 - scroll/28 + '%';
    about.style.zoom = 1 + scroll/300;

    services.style.bottom = 48 - scroll/18 + '%';
    services.style.right = 45 - scroll/60 + '%';
    services.style.zoom = scroll/300;
  } else {
    about.style.bottom = 37 - scroll/11 + '%';

    services.style.bottom = 316 - scroll/2 + '%';
    services.style.right = 74 - scroll/15 + '%';
    services.style.zoom = scroll/300;
  }

}
