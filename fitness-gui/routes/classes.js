const express = require('express');
const router = express.Router();
const mysql = require('mysql2');
require('dotenv').config({ path: '../.env' });


const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

router.get('/', (req, res) => {
  db.query('SELECT * FROM Classes', (err, results) => {
    if (err) {
      return res.status(500).send('Error fetching classes');
    }
    res.render('classes', { classes: results });
  });
});
//add class
router.post('/add', (req, res) => {
  const { ClassName, StartTime, EndTime, Capacity, TrainerID, CategoryID } = req.body;
  const query = `INSERT INTO Classes (ClassName, StartTime, EndTime, Capacity, TrainerID, CategoryID)
                 VALUES (?, ?, ?, ?, ?, ?)`;

  db.query(query, [ClassName, StartTime, EndTime, Capacity, TrainerID, CategoryID], (err) => {
    if (err) {
      return res.status(500).send('Error adding class');
    }
    res.redirect('/classes');
  });
});

//delete class
router.post('/delete', (req, res) => {
  const { ClassID } = req.body;

  if (!ClassID) {
    return res.status(400).send('ClassID is required.');
  }

  const query = 'DELETE FROM Classes WHERE ClassID = ?';
  db.query(query, [ClassID], (err) => {
    if (err) {
      console.error('Error deleting class:', err);
      return res.status(500).send('Error deleting class.');
    }

    console.log(`Deleted class with ID: ${ClassID}`);
    res.redirect('/classes');
  });
});

module.exports = router;
