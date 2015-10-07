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
  k = window.innerHeight / 675
  scroll = document.body.scrollTop / (document.body.clientHeight - window.innerHeight) * 3000/k

  if (scroll < 500/k) {
    step1.style.top = 0 - scroll*2*k + 'px';
    step1.style.bottom = 0 - scroll*2*k + 'px';

    step2.style.top = 0 - scroll*2*k + 'px';
    step2.style.bottom = 0 - scroll*2*k + 'px';

    hills.style.top = 0 - scroll*k + 'px';
    hills.style.bottom = 0 - scroll*k + 'px';
  } else if (scroll < 1300/k) {
    step1.style.top = 500 - scroll*3*k + 'px';
    step1.style.bottom = 1500 - scroll*5*k + 'px';

    step2.style.top = 500 - scroll*3*k + 'px';
    step2.style.bottom = 1500 - scroll*5*k + 'px';

    hills.style.top = 0 - scroll*k + 'px';
    hills.style.bottom = 1000 - scroll*3*k + 'px';
  } else {
    step1.style.top = 500 - scroll*3*k + 'px';
    step1.style.bottom = 1500 - scroll*5*k + 'px';

    step2.style.top = 4000 - scroll*6*k + 'px';
    step2.style.bottom = 11100 - scroll*13*k + 'px';

    hills.style.top = 0 - scroll*k + 'px';
    hills.style.bottom = 1000 - scroll*3*k + 'px';
  }

  step3.style.backgroundPositionY = 75 + scroll/6 + '%';
  step4.style.backgroundPositionX = 70 - scroll/6 + '%';
  step5.style.backgroundPositionX = 40 + scroll/6 + '%';

  front.style.opacity = 1 - scroll/100

  if (scroll > 900/k) {
    contacts.style.opacity = scroll*k/2000;
    contacts.style.zoom = scroll*k / 500;
    contacts.style.margin =  '0% ' + 100 - scroll/(k*100) + '%';
    contacts.style.top = -520 + scroll*k/6 + '%';
    st = Math.random()
    if (st > 0.5) { st = st } else { st = -st}
    lightning.style.transform = "scale(1,"+ st +")";
    light.style.left = 100 - (scroll - 900/k)/3 + '%';
  } else {
    contacts.style.opacity = 0;
  }

  if (scroll > 1200/k) {
    lightning.style.transform = "scale("+Math.random()*scroll/100 + "," + Math.random()*scroll/200 + ")";
    machine.style.opacity = scroll*k/1300
    portfolio.style.opacity = scroll*k/1000
    light.style.left = '0%';
  } else {
    machine.style.opacity = 0;
    portfolio.style.opacity = 0;
  }

  if (scroll < 1300/k && scroll > 900/k) {
    lightning.style.visibility = 'visible';
  } else if (scroll > 1200/k || scroll < 900/k) {
    lightning.style.visibility = 'hidden';
  }

  if (scroll > 1200/k) {
    delorian.style.left = 185/k - scroll*scroll*k/8000 + '%';
    delorian.style.bottom = 125 - scroll*k/10 + '%';
    delorian.style.zoom = scroll*k/12 + '%';
  } else {
    delorian.style.left = '0%';
  }

  if (scroll < 500/k) {
    about.style.left = 36 - scroll/16 + '%';
    about.style.zoom = 1 + scroll*k/300;

    services.style.right = 44 - scroll/40 + '%';
    services.style.zoom = scroll*k/300;

    our_team.style.left = 48 - scroll/60 + '%';
    our_team.style.zoom = scroll*k/500;
  } else {
    services.style.right = 74 - scroll/12 + '%';
    services.style.zoom = scroll*k/300;

    our_team.style.left = 48 - scroll/60 + '%';
    our_team.style.zoom = scroll*k/500;
  }

}
