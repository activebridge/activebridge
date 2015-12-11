window.ga = window.ga or ->
  (ga.q = ga.q or []).push arguments
ga.l = +new Date
ga 'create', 'UA-50401698-1', 'auto'
ga 'send', 'pageview', '/about'
ga 'send', 'pageview', '/services'
ga 'send', 'pageview', '/team'
ga 'send', 'pageview', '/portfolio'

ga 'send', 'social', 'Facebook', 'share', 'https://active-bridge.com'
ga 'send', 'social', 'Github', 'share', 'https://active-bridge.com'
ga 'send', 'social', 'Twitter', 'share', 'https://active-bridge.com'
ga 'send', 'social', 'LinkedIn', 'share', 'https://active-bridge.com'

