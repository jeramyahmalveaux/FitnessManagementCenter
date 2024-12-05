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

//views all trainers
router.get('/', (req, res) => {
  db.query('SELECT * FROM Trainers', (err, results) => {
    if (err) {
      return res.status(500).send('Error fetching trainers');
    }
    res.render('trainers', { trainers: results });
  });
});

//add trainer
router.post('/add', (req, res) => {
  const { Name, Specialization, Phone, Email, Schedule } = req.body;
  const query = `INSERT INTO Trainers (Name, Specialization, Phone, Email, Schedule)
                 VALUES (?, ?, ?, ?, ?)`;

  db.query(query, [Name, Specialization, Phone, Email, Schedule], (err) => {
    if (err) {
      return res.status(500).send('Error adding trainer');
    }
    res.redirect('/trainers');
  });
});

//delete trainer
router.post('/delete', (req, res) => {
  const { TrainerID } = req.body;

  if (!TrainerID) {
    return res.status(400).send('TrainerID is required.');
  }

  const query = 'DELETE FROM Trainers WHERE TrainerID = ?';
  db.query(query, [TrainerID], (err) => {
    if (err) {
      console.error('Error deleting trainer:', err);
      return res.status(500).send('Error deleting trainer.');
    }

    console.log(`Deleted trainer with ID: ${TrainerID}`);
    res.redirect('/trainers');
  });
});

module.exports = router;
