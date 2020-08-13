// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import Sortable from 'sortablejs';
import { bar } from '../components/progress_bar'
var ProgressBar = require('progressbar.js')

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  const tasks_ratio = document.getElementById('task-progress');
  console.log(tasks_ratio.dataset.tasks);
  bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
  bar.text.style.fontSize = '2rem';
  bar.animate(tasks_ratio.dataset.tasks);

  var el8 = document.getElementById('nurse-tasks-8');
  var el12 = document.getElementById('nurse-tasks-12');
  if (!el8 && !el12) {
    return
  }
  var sortable8 = new Sortable(el8, {
    group: 'shared',
    onAdd: function(e,ui){
      fetch(el8.dataset.url, {
        method: 'PATCH',
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify({
          "nurse_tasks_8": sortable8.toArray(),
          "nurse_tasks_12": sortable12.toArray(),
        })
      });
    },
    onUpdate: function(e,ui){
      fetch(el8.dataset.url, {
        method: 'PATCH',
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify({
          "nurse_tasks_8": sortable8.toArray(),
          "nurse_tasks_12": sortable12.toArray(),
        })
      });
    }
  });

  var sortable12 = new Sortable(el12, {
    group: 'shared',
    onAdd: function(e,ui){
      fetch(el12.dataset.url, {
        method: 'PATCH',
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify({
          "nurse_tasks_8": sortable8.toArray(),
          "nurse_tasks_12": sortable12.toArray(),
        })
      });
    },
    onUpdate: function(e,ui){
      fetch(el12.dataset.url, {
        method: 'PATCH',
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify({
          "nurse_tasks_8": sortable8.toArray(),
          "nurse_tasks_12": sortable12.toArray(),
        })
      });
    }
  });
});
