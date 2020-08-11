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

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  var el_morning = document.getElementById('nurse-tasks-morning');
  var el_afternoon = document.getElementById('nurse-tasks-afternoon');
  if (!el_morning && !el_afternoon) {
    return
  }
  var sortable_morning = new Sortable(el_morning, {
    group: 'shared',
    onAdd: function(e,ui){
      fetch(el_morning.dataset.url, {
        method: 'PATCH',
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify({
          "nurse_tasks_morning": sortable_morning.toArray(),
          "nurse_tasks_afternoon": sortable_afternoon.toArray(),
        })
      });
    },
    onUpdate: function(e,ui){
      fetch(el_morning.dataset.url, {
        method: 'PATCH',
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify({
          "nurse_tasks_morning": sortable_morning.toArray(),
          "nurse_tasks_afternoon": sortable_afternoon.toArray(),
        })
      });
    }
  });

  var sortable_afternoon = new Sortable(el_afternoon, {
    group: 'shared',
    onAdd: function(e,ui){
      fetch(el_afternoon.dataset.url, {
        method: 'PATCH',
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify({
          "nurse_tasks_morning": sortable_morning.toArray(),
          "nurse_tasks_afternoon": sortable_afternoon.toArray(),
        })
      });
    },
    onUpdate: function(e,ui){
      fetch(el_afternoon.dataset.url, {
        method: 'PATCH',
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify({
          "nurse_tasks_morning": sortable_morning.toArray(),
          "nurse_tasks_afternoon": sortable_afternoon.toArray(),
        })
      });
    }
  });
});
