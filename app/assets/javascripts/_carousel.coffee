carouselList = document.querySelector('.carousel__list')
carouselItems = document.querySelectorAll('.carousel__item')
elems = Array.from(carouselItems)
carouselNext = document.querySelector('.carousel__next')
carouselPrev = document.querySelector('.carousel__prev')

carouselPrev.addEventListener 'click', (event) ->
  event.preventDefault
  el = document.querySelector("[data-index='-1']")
  update el

carouselNext.addEventListener 'click', (event) ->
  event.preventDefault
  el = document.querySelector("[data-index='1']")
  update el

carouselList.addEventListener 'click', (event) ->
  newActive = event.target
  isItem = newActive.parentElement
  if !isItem or newActive.classList.contains('carousel__item_active')
    return
  update(if isItem.classList.contains('carousel__item') then isItem else newActive)

update = (newActive) ->
  newActiveIndex = newActive.dataset.index
  current = elems.find((elem) ->
    elem.dataset.index == '0'
  )
  prev = elems.find((elem) ->
    elem.dataset.index == '-1'
  )
  next = elems.find((elem) ->
    elem.dataset.index == '1'
  )
  second = elems.find((elem) ->
    elem.dataset.index == '-2'
  )
  second_last = elems.find((elem) ->
    elem.dataset.index == '2'
  )
  first = elems.find((elem) ->
    elem.dataset.index == '-3'
  )
  last = elems.find((elem) ->
    elem.dataset.index == '3'
  )

  current.classList.remove 'carousel__item_active'
  [current, prev, next, second, second_last, first, last].forEach (item) ->
    itemIndex = item.dataset.index
    item.dataset.index = getIndex(itemIndex, newActiveIndex)

getIndex = (current, active = 0) ->
  diff = current - active
  if Math.abs(current - active) > 3
    return -current
  diff
