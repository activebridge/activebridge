$('#new_article, .edit_article').replaceWith '<%= j render "form" %>'
simplemde = new SimpleMDE({ element: document.getElementById('simplemde') })
