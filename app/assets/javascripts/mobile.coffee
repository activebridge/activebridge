#= require _analytics
#= require _navigation

# IOS safari zoom hack
document.body.addEventListener 'gesturestart', (e) -> e.preventDefault()
#

#Service Worker
navigator.serviceWorker.register('/serviceworker.js', { scope: './' }) if (navigator.serviceWorker)
