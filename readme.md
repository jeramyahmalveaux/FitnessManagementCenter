Frontend: HTML, CSS, EJS
Backend: Node.js used with Express.js

Requirements: 
Make sure you have Node.js installed, version 16 or later should work
Make sure MySQL version 8 or later is installed
Node.js dependencies to make sure is intalled:
Express.js, mysql2, ejs, and faker
    Running the command npm install in terminal will ensure you have the dependencies downloaded
    -npm install does need to be ran in the root "fitness-management-center" directory
    -npm install must also be ran in both the fitness-gui and fitnessdb subdirectories as well

Database setup:
    *make sure that the path to your mysql bin is added to your system variables to be able to run mysql command without having to change to the bin directory

    1. Log in to mysql using command line with command: mysql -u root -p and then process to enter password

    2.create a database named 'fitnesscenter'

    3. Import the fitnesscenter.sql file in the fitnessdb directory
        a. switch to the database in terminal by doing: USE fitnesscenter;
        b. then use the SOURCE command with the full path to the fitnesscenter.sql file to import

    4. You will have to update the credentials in the app.js, dataGen.js, classes.js, members.js, and trainers.js by setting up your environment variables
    -this can be done by filling in the values in the .env.example file and running the command "cp .env.example .env" in the root directory "fitness-management-center" to create your environment variables file that will be used to test the databse
        a. Only the password should be modified unless you have any other username that isn't "root" which then you will have to modify "user" to match what you set during installation
    
    5. To test if GUI connects to database, you can run "node app.js" after changing into the fitness-gui directory

GUI:
After successfully running "node app.js" within fitness-gui directory, you should be able to access the localhost link in the terminal where you will be able to test each application user interface 

Test Queries:
To execute the test queries you can use the SOURCE command with the path to the test-queries.sql file in the terminal
Example: SOURCE /___/___/fitnessdb/test-queries.sql

Miscellaneous: 
If you would like to generate new data, the script, dataGen.js, is located in the fitnessdb directory and running "node .\dataGen.js" in the directory will create new instances of data. To see changes make sure to refresh connection to localhost to view new data