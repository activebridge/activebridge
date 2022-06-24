carouselLists = document.querySelectorAll('.carousel__list')

carouselLists.forEach (carousel) ->
  carouselNext = carousel.parentElement.querySelector('.carousel__next')
  carouselPrev = carousel.parentElement.querySelector('.carousel__prev')
  if carouselPrev
    carouselPrev.addEventListener 'click', (event) ->
      event.preventDefault
      el = carousel.querySelector("[data-index='-1']")
      update el, carousel

  if carouselNext
    carouselNext.addEventListener 'click', (event) ->
      event.preventDefault
      el = carousel.querySelector("[data-index='1']")
      update el, carousel

  carousel.addEventListener 'click', (event) ->
    newActive = event.target
    isItem = newActive.parentElement

    if !isItem or newActive.classList.contains('carousel__item_active')
      return
    update((if isItem.classList.contains('carousel__item') then isItem else newActive), carousel)

update = (newActive, carousel) ->
  carouselItems = carousel.querySelectorAll('.carousel__item')
  elems = Array.from(carouselItems)
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
    if item
      itemIndex = item.dataset.index
      item.dataset.index = getIndex(itemIndex, newActiveIndex, elems)

getIndex = (current, active = 0, elems) ->
  diff = current - active
  if Math.abs(current - active) > (if elems.length > 3 then 3 else 1)
    return -current
  diff
