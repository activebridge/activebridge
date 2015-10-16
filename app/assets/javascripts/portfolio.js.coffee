$(document).on 'click', '.arrows #right, .arrows #left', (e) ->
  wrapper = $(@).parent().siblings('.wrapper')
  scrollTo(wrapper, @.id)
  e.preventDefault()

scrollTo = (wrapper, direction) ->
  tf= wrapper.data('tf')
  step = wrapper.data('step')
  scroll = Math.floor(100/step)
  if direction == 'right'
    if tf > -(wrapper.children().length-step)
      wrapper.data('tf', tf - 1).css("transform", "translateX("+wrapper.data('tf')*scroll+"%)")
      return true
  else
    if tf < 0
      wrapper.data('tf', tf + 1).css("transform", "translateX("+wrapper.data('tf')*scroll+"%)")
      return true
  false
