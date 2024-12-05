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
  db.query('SELECT * FROM Members', (err, results) => {
    if (err) {
      return res.status(500).send('Error fetching members');
    }
    res.render('members', { members: results });
  });
});

//add member
router.post('/add', (req, res) => {
  const { Name, Phone, Email, MembershipTypeID, JoinDate, ExpiryDate } = req.body;
  const query = `INSERT INTO Members (Name, Phone, Email, MembershipTypeID, JoinDate, ExpiryDate)
                 VALUES (?, ?, ?, ?, ?, ?)`;
  db.query(query, [Name, Phone, Email, MembershipTypeID, JoinDate, ExpiryDate], (err) => {
    if (err) {
      return res.status(500).send('Error adding member');
    }
    res.redirect('/members');
  });
});

//delete member
router.post('/delete', (req, res) => {
    const { MemberID } = req.body;
  
    if (!MemberID) {
      return res.status(400).send('MemberID is required.');
    }
  
    const query = 'DELETE FROM Members WHERE MemberID = ?';
    db.query(query, [MemberID], (err, results) => {
      if (err) {
        console.error('Error deleting member:', err);
        return res.status(500).send('Error deleting member.');
      }
  
      console.log(`Deleted member with ID: ${MemberID}`);
      res.redirect('/members');
    });
  });
  
module.exports = router;