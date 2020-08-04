#= require _analytics

navigation = document.getElementById('navigation')
titles = [];

titles.push.apply(titles, document.getElementById('post').getElementsByTagName('h2'));

scrollToTitle = (param) ->
  titles[this.dataset.index].scrollIntoView({block: "start", behavior: "smooth"});

titles.forEach((element, index) =>
  navTitle = document. createElement("p");
  navTitle.textContent = element.textContent
  navTitle.setAttribute('data-index', index)
  navTitle.onclick = scrollToTitle;
  navigation.appendChild(navTitle);
)