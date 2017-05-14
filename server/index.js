var express = require('express')
var cors = require('cors')
const axios = require('axios');
var app = express()

app.use(cors())

app.get('/', (req, res) => {
  return res.send('Hello')
})

app.get('/search', (req, res) => {
  let { filter, query } = req.query
  axios.get(`https://api.yelp.com/v3/businesses/search?location=48103&term=${query}&category=${filter}`,
    {
      headers: {
        Authorization: 'Bearer eGuwe0MktbhJHGhC9kOFgU3mC216qfQiIal1yJLIiCvQ0EbYYPRHiqQiW0qTdLqp3yY6hfpezmzGCfstpYHj673diAToRut3tVyUSfNN0-1QOYxA4qg8rLXpuLwPWXYx'
      }
    }
  )
    .then((data) => {
      var businesses = data.data.businesses
      return res.send(businesses)
    })
    .catch((err) => res.send(new Error(err)))
})

app.listen(8081, function () {
  console.log('CORS-enabled web server listening on port 8081')
})
