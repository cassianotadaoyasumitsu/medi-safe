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
  var el = document.getElementById('nurse-tasks');
  if (!el) {
    return
  }
  var sortable = new Sortable(el, {
    onUpdate: function(e,ui){
      fetch(el.dataset.url, {
        method: 'PATCH',
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify({ nurse_tasks: sortable.toArray()})
      });
    }
  });
});


// One group per column (multiple sortable elements)
// Each sortable group should be a string that matches the group attribute(ex: time group in DB, "Matin", "Midi", "Soir")
// OnUpdate
// JSON.stringify({
//   "nurse_tasks_morning": sortableMorning.toArray(),
//   "nurse_tasks_noon": sortableNoon.toArray(),
//   "nurse_tasks_evening": sortableEvening.toArray(),
// })
// And will need to update the group in the nurse_tasks_controller
// params[:nurse_tasks_morning].each_with_index do |id, index|
//   NurseTask.where(id: id).update_all(time_group: "morning", position: index + 1)
// end
// params[:nurse_tasks_noon].each_with_index do |id, index|
//   NurseTask.where(id: id).update_all(time_group: "morning", position: index + 1)
// end
// params[:nurse_tasks_evening].each_with_index do |id, index|
//   NurseTask.where(id: id).update_all(time_group: "morning", position: index + 1)
// end
// And need to do also for the other groups
