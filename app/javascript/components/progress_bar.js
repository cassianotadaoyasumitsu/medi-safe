function draw_pie_chart () {
  function make_pie_chart() {
    const tasks_ratio = document.querySelectorAll('#task-progress');
    tasks_ratio.forEach((task) => {
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
        from: { color: '#DC143C', width: 16 },
        to: { color: '#228B22', width: 16 },
        // Set default step function for all animate calls
        step: function(state, circle) {
          circle.path.setAttribute('stroke', state.color);
          circle.path.setAttribute('stroke-width', state.width);

          // var value = Math.round(circle.value() * 100);
          // if (value === 0) {
          //   circle.setText('0%');
          // } else {
          //   circle.setText();
          // }

        }
      });
      // bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
      // bar.text.style.fontSize = '2rem';
      bar.animate(task.dataset.tasks);
      return bar;
    })
  }
  var bar = make_pie_chart();
}


export { draw_pie_chart };
