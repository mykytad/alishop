// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// import Chart from 'chart.js/auto';
import 'chart.js'
document.addEventListener('turbo:load', () => {
  var ctx = document.getElementById('myChart').getContext('2d');
  var myChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: JSON.parse(ctx.canvas.dataset.labels),
    datasets: [{
      label: 'Your orders',
      backgroundColor: "#20c997",
      data: JSON.parse(ctx.canvas.dataset.data),
    }]
  },
  });
})