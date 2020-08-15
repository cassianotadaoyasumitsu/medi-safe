function make_pie_chart() {
  var ProgressBar = require('progressbar.js');
  var bar = new ProgressBar.Circle('#task-progress', {
    color: '#aaa',
    // This has to be the same size as the maximum width to
    // prevent clipping
    strokeWidth: 8,
    trailWidth: 4,
    easing: 'bounce',
    duration: 2400,
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
        circle.setText('');
      } else {
        circle.setText(`${value}%`);
      }

    }
  });
  return bar;
}

export { make_pie_chart };
