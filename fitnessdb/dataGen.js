const mysql = require('mysql2');
const { faker } = require('@faker-js/faker'); 
require('dotenv').config();

const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

async function insertMembershipTypes() {
  const membershipTypes = [
    ['Bronze', 50.00, 1],
    ['Silver', 125.00, 3],
    ['Gold', 200.00, 6],
    ['Platinum', 350.00, 12]
  ];

  for (const type of membershipTypes) {
    await connection.promise().query(
      'INSERT INTO MembershipTypes (MembershipName, Price, DurationMonths) VALUES (?, ?, ?)',
      type
    );
  }

  console.log('MembershipTypes inserted.');
}

async function insertMembers() {
  for (let i = 0; i < 100; i++) {
    const name = faker.person.fullName();
    const [firstName, lastName] = name.split(' ');
    const email = `${firstName.toLowerCase()}.${lastName.toLowerCase()}@example.com`;
    const phone = faker.phone.number('###########').substring(0, 15);
    const membershipTypeID = faker.number.int({ min: 1, max: 4 });
    const joinDate = faker.date.past({ years: 1}).toISOString().split('T')[0];
    const expiryDate = faker.date.future({years: 1}).toISOString().split('T')[0];

    await connection.promise().query(
      'INSERT INTO Members (Name, Phone, Email, MembershipTypeID, JoinDate, ExpiryDate) VALUES (?, ?, ?, ?, ?, ?)',
      [name, phone, email, membershipTypeID, joinDate, expiryDate]
    );
  }

  console.log('Members inserted.');
}

async function insertTrainers() {
    const possibleSchedules = [
      'Mon-Fri: 9 AM - 12 PM',
      'Tue-Thu: 10 AM - 2 PM',
      'Sat-Sun: 8 AM - 11 AM',
      'Mon-Wed: 1 PM - 5 PM',
      'Fri-Sun: 2 PM - 6 PM',
    ];
  
    for (let i = 0; i < 5; i++) {
      const name = faker.person.fullName();
      const specialization = faker.helpers.arrayElement(['Yoga', 'Cardio', 'Strength Training']);
      const phone = faker.phone.number('###########').substring(0, 15);
      const [firstName, lastName] = name.split(' ');
      const email = `${firstName.toLowerCase()}.${lastName.toLowerCase()}@example.com`;
      const schedule = faker.helpers.arrayElement(possibleSchedules);
  
      await connection.promise().query(
        'INSERT INTO Trainers (Name, Specialization, Phone, Email, Schedule) VALUES (?, ?, ?, ?, ?)',
        [name, specialization, phone, email, schedule]
      );
    }
  
    console.log('Trainers inserted.');
  }
  
async function insertClassCategories() {
  const categories = ['Yoga', 'Cardio', 'Strength Training'];
  for (const category of categories) {
    await connection.promise().query(
      'INSERT INTO ClassCategories (CategoryName) VALUES (?)',
      [category]
    );
  }
  console.log('ClassCategories inserted.');
}
  
async function insertClasses() {
  for (let i = 0; i < 5; i++) {
    const className = faker.helpers.arrayElement(['Yoga Class', 'Cardio Blast', 'Strength Training']);
    const startHour = faker.number.int({ min: 6, max: 18 });
    const startMinute = faker.helpers.arrayElement([0, 15, 30, 45]);
    const duration = faker.number.int({ min: 1, max: 2 });
    const startTime = `${startHour.toString().padStart(2, '0')}:${startMinute.toString().padStart(2, '0')}:00`;
    const endTime = `${(startHour + duration).toString().padStart(2, '0')}:${startMinute.toString().padStart(2, '0')}:00`;
    const capacity = faker.number.int({ min: 10, max: 30 });
    const trainerID = faker.number.int({ min: 1, max: 5 });
    const categoryID = faker.number.int({ min: 1, max: 3 });
    await connection.promise().query(
      'INSERT INTO Classes (ClassName, StartTime, EndTime, Capacity, TrainerID, CategoryID) VALUES (?, ?, ?, ?, ?, ?)',
      [className, startTime, endTime, capacity, trainerID, categoryID]
    );
  }
  console.log('Classes inserted.');
}
  
async function insertBookings() {
    const [members] = await connection.promise().query('SELECT MemberID FROM Members');
    const [classes] = await connection.promise().query('SELECT ClassID FROM Classes');
    const memberIDs = members.map((member) => member.MemberID);
    const classIDs = classes.map((cls) => cls.ClassID);
  
    for (let i = 0; i < 15; i++) {
      const memberID = faker.helpers.arrayElement(memberIDs);
      const classID = faker.helpers.arrayElement(classIDs);
      const bookingDate = faker.date.soon({ days: 30}).toISOString().split('T')[0];
      await connection.promise().query(
        'INSERT INTO Bookings (MemberID, ClassID, BookingDate) VALUES (?, ?, ?)',
        [memberID, classID, bookingDate]
      );
    }
    console.log('Bookings inserted.');
  }

async function insertTrainingSessions() {
  for (let i = 0; i < 20; i++) {
    const trainerID = faker.number.int({ min: 1, max: 5 }); 
    const memberID = faker.number.int({ min: 1, max: 100 });
    const sessionDate = new Date(faker.date.soon({ days: 60 })); 
    const randomHour = faker.number.int({ min: 6, max: 20 }); 
    const randomMinute = faker.helpers.arrayElement([0, 15, 30, 45]); 
    sessionDate.setHours(randomHour, randomMinute, 0, 0);
    const formattedSessionDate = sessionDate.toISOString().slice(0, 19).replace('T', ' '); 
    const durationMinutes = faker.number.int({ min: 30, max: 120 }); 
    const notes = faker.lorem.sentence();
    await connection.promise().query(
      'INSERT INTO TrainingSessions (TrainerID, MemberID, SessionDate, DurationMinutes, Notes) VALUES (?, ?, ?, ?, ?)',
      [trainerID, memberID, formattedSessionDate, durationMinutes, notes]
    );
  }

  console.log('TrainingSessions inserted.');
}
  

async function insertStaff() {
  const roles = ['Manager', 'Front Desk', 'Maintenance', 'Janitor'];

  for (let i = 0; i < 10; i++) {
    const name = faker.person.fullName();
    const role = faker.helpers.arrayElement(roles);
    const phone = faker.phone.number('###########').substring(0, 15);
    const email = `${name.split(' ')[0].toLowerCase()}.${name.split(' ')[1].toLowerCase()}@fitnesscenter.com`;
    const hireDate = faker.date.past({ years: 10 }).toISOString().split('T')[0];
    await connection.promise().query(
      'INSERT INTO Staff (Name, Role, Phone, Email, HireDate) VALUES (?, ?, ?, ?, ?)',
      [name, role, phone, email, hireDate]
    );
  }
  console.log('Staff inserted.');
}
  
//to reset tables automatically 
async function clearTables() {
  const tables = [
    'TrainingSessions',
    'Bookings',
    'Classes',
    'Trainers',
    'Members',
    'ClassCategories',
    'MembershipTypes',
    'Staff'
  ];

  for (const table of tables) {
    try {
      await connection.promise().query(`DELETE FROM ${table}`);
      await connection.promise().query(`ALTER TABLE ${table} AUTO_INCREMENT = 1`);
    } catch (error) {
      console.error(`Error clearing table ${table}:`, error);
    }
  }
  console.log('Tables cleared.');
}
  
async function main() {
  try {
    await clearTables();
    await insertMembershipTypes();
    await insertMembers();
    await insertTrainers();
    await insertClassCategories();
    await insertClasses();
    await insertBookings();
    await insertStaff();
    await insertTrainingSessions();
  } catch (error) {
    console.error('Error inserting data:', error);
  } finally {
    connection.end();
  }
}
main();
