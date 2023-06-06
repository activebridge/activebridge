carouselLists = document.querySelectorAll('.carousel__list')

touchstartX = touchstartY = touchendX = touchendY = 0;

carouselLists.forEach (carousel) ->
  carousel.addEventListener 'touchstart', ((event) ->
    touchstartX = event.touches[0].screenX
    touchstartY = event.touches[0].screenY
    return
  ), false
  carousel.addEventListener 'touchend', ((event) ->
    touchendX = event.changedTouches[0].screenX
    touchendY = event.changedTouches[0].screenY

    if touchendX < touchstartX
      el = carousel.querySelector("[data-index='1']")
      update el, carousel

    if touchendX > touchstartX
      el = carousel.querySelector("[data-index='-1']")
      update el, carousel
    return
  ), false

  carousel.addEventListener 'click', (event) ->
    newActive = event.target
    isItem = newActive.parentElement

    if !isItem or newActive.classList.contains('carousel__item_active')
      return
    update((if isItem.classList.contains('carousel__item') then isItem else newActive), carousel)

update = (newActive, carousel) ->
  carouselItems = carousel.querySelectorAll('.carousel__item')
  elems = Array.from(carouselItems).sort((a, b) -> Number(a.dataset.index) - Number(b.dataset.index))
  newActiveIndex = newActive.dataset.index
  current = elems.find((elem) ->
    elem.dataset.index == '0'
  )

  newElems = []
  if newActiveIndex < 0
    newElems.push elems[elems.length - 1]
    newElems.push elems.slice(0, elems.length - 1)
  else
    newElems.push elems.slice(1, elems.length)
    newElems.push elems[0]
  newElems = newElems.flat()
  min = Math.min.apply Math, (x for x in elems.map((item) => Number(item.dataset.index)))
  els = Array.from({ length: elems.length }, (val, index) => min + index)

  current.classList.remove 'carousel__item_active'
  els.forEach (index, idx) ->
    if newElems[idx]
      newElems[idx].dataset.index = index
