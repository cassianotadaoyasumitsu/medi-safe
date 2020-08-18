function draw_pie_chart () {
  function make_pie_chart() {
    const tasks_ratio = document.querySelectorAll('#task-progress');
    tasks_ratio.forEach((task) => {
      var ProgressBar = require('progressbar.js');
      var bar = new ProgressBar.Circle(task, {
        color: '#333',
        // This has to be the same size as the maximum width to
        // prevent clipping
        strokeWidth: 8,
        trailWidth: 4,
        easing: 'bounce',
        duration: 2000,
        text: {
          autoStyleContainer: false
        },
        from: { color: '#aaa', width: 4 },
        to: { color: '#333', width: 8 },
        // Set default step function for all animate calls
        step: function(state, circle) {
          circle.path.setAttribute('stroke', state.color);
          circle.path.setAttribute('stroke-width', state.width);

          var value = Math.round(circle.value() * 100);
          if (value === 0) {
            circle.setText('0%');
          } else {
            circle.setText(`${value}%`);
          }

        }
      });
      bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
      bar.text.style.fontSize = '2rem';
      bar.animate(task.dataset.tasks);
      return bar;
    })
  }
  var bar = make_pie_chart();
}


export { draw_pie_chart };
