const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;
require('dotenv').config({ path: '../.env' });



app.use(bodyParser.urlencoded({ extended: true }));
app.set('view engine', 'ejs');
app.set('views', './views');
app.use(express.static('public'));

const membersRouter = require('./routes/members');
const classesRouter = require('./routes/classes'); 
const trainersRouter = require('./routes/trainers'); 

app.use('/members', membersRouter);
app.use('/classes', classesRouter); 
app.use('/trainers', trainersRouter); 

app.get('/', (req, res) => {
  res.render('index'); 
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
