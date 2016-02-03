window.ga = window.ga or ->
  (ga.q = ga.q or []).push arguments
ga.l = +new Date
ga 'create', 'UA-50401698-1', 'auto', {'allowLinker':true}
ga 'send', 'pageview', '/about'
ga 'send', 'pageview', '/services'
ga 'send', 'pageview', '/team'
ga 'send', 'pageview', '/portfolio'

ga 'send', 'event', 'Email', 'click to email', 'eugene@active-bridge.com'
ga 'send', 'event', 'Address', 'click to address', "https://www.google.com/maps/place/Marshala+Krasovs'koho+St,+8,+Cherkasy,+Cherkas'ka+oblast,+Ukraine/@44.6228353,29.6920978,5z/data=!4m2!3m1!1s0x40d14b8febf9aa21:0xe43a326d1c2451c2"

ga 'send', 'social', 'Facebook', 'share', 'https://active-bridge.com'
ga 'send', 'social', 'Github', 'share', 'https://active-bridge.com'
ga 'send', 'social', 'Twitter', 'share', 'https://active-bridge.com'
ga 'send', 'social', 'LinkedIn', 'share', 'https://active-bridge.com'
ga 'send', 'social', 'Pinterest', 'share', 'https://ru.pinterest.com/activebridg0459/'
ga 'send', 'social', 'Youtube', 'share', 'https://www.youtube.com/channel/UCw5hPDX1sKgDZczIvcaIepw'

