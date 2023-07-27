document.addEventListener('turbo:load', () => {
  var ctx = document.getElementById('myChart');
  if (ctx != null){
    ctx = ctx.getContext('2d')

    var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: JSON.parse(ctx.canvas.dataset.labels),
        datasets: [{
          label: 'Your orders',
          backgroundColor: "#20c997",
          data: JSON.parse(ctx.canvas.dataset.data),
        }]
      }
    })
  }
})
