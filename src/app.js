var riot = require('riot')
require('./tags/sample.tag')
import axios from 'axios'

axios.defaults.headers.common['Authorization'] = 'Bearer eGuwe0MktbhJHGhC9kOFgU3mC216qfQiIal1yJLIiCvQ0EbYYPRHiqQiW0qTdLqp3yY6hfpezmzGCfstpYHj673diAToRut3tVyUSfNN0-1QOYxA4qg8rLXpuLwPWXYx'


document.addEventListener('DOMContentLoaded', () => riot.mount('sample'))

axios.get('https://api.yelp.com/v3/businesses/search?location=48103', {
    headers: {
      Authorization: 'Bearer eGuwe0MktbhJHGhC9kOFgU3mC216qfQiIal1yJLIiCvQ0EbYYPRHiqQiW0qTdLqp3yY6hfpezmzGCfstpYHj673diAToRut3tVyUSfNN0-1QOYxA4qg8rLXpuLwPWXYx'
    }
  })
  .then(console.log)
  .catch(console.log)
