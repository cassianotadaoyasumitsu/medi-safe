function drawProgressBar () {
  function makeProgressBar() {
    const tasksRatio = document.querySelectorAll('#task-progress');
    tasksRatio.forEach((task) => {
      var ProgressBar = require('progressbar.js');
      var bar = new ProgressBar.Circle(task, {
        color: '#333',
        // This has to be the same size as the maximum width to
        // prevent clipping
        strokeWidth: 16,
        trailWidth: 16,
        easing: 'bounce',
        duration: 2000,
        // text: {
        //   autoStyleContainer: false
        // },

        // This sets the color of the progress bar as it fills
        from: { color: '#DC143C', width: 16 },
        to: { color: '#228B22', width: 16 },
        // Set default step function for all animate calls
        step: function(state, circle) {
          circle.path.setAttribute('stroke', state.color);
          circle.path.setAttribute('stroke-width', state.width);

          // This sets the text inside the progress bar

          // var value = Math.round(circle.value() * 100);
          // if (value === 0) {
          //   circle.setText('0%');
          // } else {
          //   circle.setText();
          // }

        }
      });
      // This styles the font in the progress bar but removed due to feedback

      // bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
      // bar.text.style.fontSize = '2rem';

      // This executes the function using the data-tasks as a paramenter
      // on each of the elements with task-progress id
      bar.animate(task.dataset.tasks);
      return bar;
    })
  }
  var bar = makeProgressBar();
}


export { drawProgressBar };
