const express = require('express')

const app = express();
const port = 5000

app.get('/', (req, res) => {
    res.json({message:'This is a test'})
})


app.listen(port,()=>console.log('listening on port ' + port));