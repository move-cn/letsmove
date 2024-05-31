import express from 'express'
import bodyParser from 'body-parser'
import fs from 'fs/promises'
import cors from 'cors' // 引入cors中间件

const app = express()

// 使用cors中间件
app.use(cors())

app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())

app.post('/save-mnemonic', async (req, res) => {
  const mnemonic = req.body.mnemonic
  try {
    await fs.writeFile('mnemonic.txt', mnemonic)
    res.send('Mnemonic saved successfully')
  } catch (error) {
    res.status(500).send('Error saving mnemonic')
  }
})

app.listen(3000, () => {
  console.log('Server running on port 3000')
})
