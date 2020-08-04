#= require _analytics

navigation = document.getElementById('navigation')
post = document.getElementById('post');
titles = [];

titles.push.apply(titles, post.getElementsByTagName('h2'));

scrollToTitle = () ->
  post.scrollTo({
    top: titles[this.dataset.index].offsetTop,
    behavior: "smooth"
  })

titles.forEach((element, index) =>
  navTitle = document. createElement("p");
  navTitle.textContent = element.textContent
  navTitle.setAttribute('data-index', index)
  navTitle.onclick = scrollToTitle;
  navigation.appendChild(navTitle);
)