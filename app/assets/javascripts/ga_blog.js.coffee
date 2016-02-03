window.ga = window.ga or ->
  (ga.q = ga.q or []).push arguments
ga.l = +new Date
ga 'create', 'UA-50401698-1', 'auto', {'allowLinker':true}

#Load the pluggins
ga 'requare', 'linker'
#Define which domains to autoLink
ga 'linker:autolink', ['active-bridge.com', 'blog.active-bridge.com']
ga 'send', 'pageview'
