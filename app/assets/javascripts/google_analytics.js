$.getScript 'www.google-analytics.com/analytics.js', () ->
  window.ga = window.ga or ->
    (ga.q = ga.q or []).push arguments
  ga.l = +new Date
  ga 'create', 'UA-50401698-1', 'auto'
  ga 'send', 'pageview', '/abot'
  ga 'send', 'pageview', '/services'
  ga 'send', 'pageview', '/team'
  ga 'send', 'pageview', '/portfolio'
