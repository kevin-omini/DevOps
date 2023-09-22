const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

// Define a catch-all route for any other route
app.all('*', (req, res) => {
  res.status(404).send('Oh Sugar! Page Not Found')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
