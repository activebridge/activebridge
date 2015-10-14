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
  k = window.innerHeight * 1350 / (window.innerWidth * 675);
  scroll = window.scrollY / (document.body.clientHeight - window.innerHeight) * 3000 / k;
  console.log(scroll);

  if (scroll < 500/k) {
    step1.style.top = 0 - scroll*2*k + 'px';
    step1.style.bottom = 0 - scroll*2*k + 'px';

    step2.style.top = 0 - scroll*2*k + 'px';
    step2.style.bottom = 0 - scroll*2*k + 'px';

    step3.style.bottom = 10 - scroll*k/50 + '%';

    hills.style.top = 0 - scroll*k + 'px';
    hills.style.bottom = 0 - scroll*k + 'px';
  } else if (scroll < 1300/k) {
    step1.style.top = 500 - scroll*3*k + 'px';
    step1.style.bottom = 1500 - scroll*5*k + 'px';

    step2.style.top = 500 - scroll*3*k + 'px';
    step2.style.bottom = 1500 - scroll*5*k + 'px';

    step3.style.bottom = 165 - scroll*k/3 + '%';

    hills.style.top = 0 - scroll*k + 'px';
    hills.style.bottom = 1000 - scroll*3*k + 'px';
  } else {
    step1.style.top = 500 - scroll*3*k + 'px';
    step1.style.bottom = 1500 - scroll*5*k + 'px';

    step2.style.top = 13500 - scroll*13*k + 'px';
    step2.style.bottom = 31000 - scroll*23*1.2*k + 'px';

    step3.style.bottom = 100 - scroll*k/5 + '%';

    hills.style.top = 0 - scroll*k + 'px';
    hills.style.bottom = 5500 - scroll*6.5*k + 'px';
  }

  step4.style.left = 0 - scroll*k/4 + '%';
  step5.style.right = 0 - scroll*k/4 + '%';

  front.style.opacity = 1 - scroll/100

  if (scroll > 900/k) {
    contacts.style.opacity = scroll*k/2000;
    contacts.style.transform = 'scale(' + scroll*k/2000 + ')';
    contacts.style.margin =  '0% ' + 100 - scroll/(k*100) + '%';
    contacts.style.top = -360 + scroll*k/6.5 + '%';
    st = Math.random()
    if (st > 0.5) { st = st } else { st = -st}
    lightning.style.transform = "scale(1,"+ st +")";
    light.style.left = 100 - (scroll - 900/k)*k/3 + '%';
  } else {
    contacts.style.opacity = 0;
  }

  if (scroll > 1200/k) {
    portfolio.style.visibility = 'visible';
    lightning.style.transform = "scale("+Math.random()*scroll/100 + "," + Math.random()*scroll/200 + ")";
    machine.style.opacity = scroll*k/1300
    portfolio.style.opacity = scroll*k/1000
    light.style.left = '0%';
  } else {
    machine.style.opacity = 0;
    portfolio.style.opacity = 0;
    portfolio.style.visibility = 'hidden';
  }

  if (scroll < 1300/k && scroll > 900/k) {
    lightning.style.visibility = 'visible';
  } else if (scroll > 1200/k || scroll < 900/k) {
    lightning.style.visibility = 'hidden';
  }

  if (scroll > 1200/k) {
    delorian.style.left = 185/k - scroll*scroll*k/8000 + '%';
    delorian.style.top = -50 + scroll*k/15 + '%';
    delorian.style.transform = 'scale(' + scroll*k/1200 + ')';
  } else {
    delorian.style.left = '0%';
  }

  if (scroll < 500/k) {
    about.style.left = 36 - scroll*k/16 + '%';
    scl = 1 + scroll*k/300;
    about.style.transform = 'scale(' + scl + ')';

    services.style.right = 44 - scroll/40 + '%';
    services.style.transform = 'scale(' + scroll*k/300 + ')';

    our_team.style.left = 48 - scroll/60 + '%';
    our_team.style.transform = 'scale(' + scroll*k/500 + ')';
  } else {
    services.style.right = 74 - scroll/12 + '%';
    services.style.transform = 'scale(' + scroll*k/300 + ')';

    our_team.style.left = 48 - scroll/60 + '%';
    our_team.style.transform = 'scale(' + scroll*k/500 + ')';
  }

}
