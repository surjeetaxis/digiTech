-- Create the database
CREATE DATABASE IF NOT EXISTS tutorgrapher;

select * from tutor

-- Create the tutor table
CREATE TABLE tutor (
                       tutorId SERIAL PRIMARY KEY,
                       firstName VARCHAR(50) NOT NULL,
                       lastName VARCHAR(50) NOT NULL,
                       salutation VARCHAR(10) NOT NULL,
                       phone BIGINT NOT NULL,
                       email VARCHAR(50) NOT NULL,
                       photo BYTEA
);

-- Insert into tutor table
INSERT INTO tutor (firstName, lastName, salutation, phone, email)
VALUES ('Tofu', 'Cube', 'Ms.', 91112222, 'tofuyong@gmail.com');

INSERT INTO tutor (firstName, lastName, salutation, phone, email)
VALUES ('Surjeet', 'kumar', 'Ms.', 8872937777, 'surjeet@gmail.com');

-- Create the student table
CREATE TABLE student (
                         studentId INT PRIMARY KEY,
                         isActive BOOLEAN,
                         firstName VARCHAR(50) NOT NULL,
                         lastName VARCHAR(50) NOT NULL,
                         gender VARCHAR(10) NOT NULL,
                         dob DATE,
                         phone BIGINT,
                         email VARCHAR(50),
                         photo BYTEA,
                         school VARCHAR(50) NOT NULL,
                         level VARCHAR(20) NOT NULL,
                         year INT NOT NULL,
                         band VARCHAR(30) NOT NULL,
                         cca VARCHAR(30) NOT NULL,
                         interests VARCHAR(100),
                         tutorId INT NOT NULL,
                         FOREIGN KEY (tutorId) REFERENCES tutor(tutorId)
);

-- Insert into student table
INSERT INTO student (studentId, isActive, firstName, lastName, gender, dob, phone, email, school, level, year, band, cca, interests, tutorId)
VALUES
    (10001, true, 'Pebbles', 'Flintstone', 'Female', '1963-02-12', 91112222, 'pebblesflintstone@students.com', 'Punggol Secondary School', 'Secondary', 1, 'Express', 'Outdoor Activity Club', 'Rock climbing', 1),
    (10002, true, 'Bugs', 'Bunny', 'Male', '1940-07-27', 91113333, 'bugsbunny@students.com', 'Broadrick Secondary School', 'Secondary', 1, 'Express', 'Cooking Club', 'Eating Carrots', 1),
    (10003, true, 'Daffy', 'Duck', 'Male', '1937-04-17', 91114444, 'daffyduck@students.com', 'Dunman High', 'Secondary', 1, 'Express', 'Swimming Club', 'Water Polo', 1),
    (10004, true, 'Scooby', 'Doo', 'Male', '1969-09-13', 91115555, 'scoobydoo@students.com', 'Serangoon Secondary School', 'Secondary', 1, 'Express', 'NPCC', 'Reading comics', 1),
    (10005, true, 'Minnie', 'Mouse', 'Female', '1928-11-18', 91116666, 'minniemouse@students.com', 'Mayflower Secondary School', 'Secondary', 1, 'Express', 'Girl Guides', 'Sewing', 1),
    (10006, true, 'Daisy', 'Duck', 'Male', '1937-01-09', 91117777, 'daisyduck@students.com', 'Deyi Secondary School', 'Secondary', 1, 'Express', 'Netball', 'Bowling', 1),
    (10007, true, 'Winnie', 'Pooh', 'Male', '1926-10-14', 91118888, 'winniethepooh@students.com', 'Westspring Secondary School', 'Secondary', 1, 'Express', 'Football', 'Collecting honey', 1);

-- Create the grade table
CREATE TABLE grade (
                       gradeId VARCHAR(10) PRIMARY KEY,
                       subject VARCHAR(50) NOT NULL,
                       date DATE NOT NULL,
                       assessment VARCHAR(20) NOT NULL,
                       score DECIMAL(10,1) NOT NULL,
                       baseScore DECIMAL(10,1) NOT NULL,
                       percentageScore DECIMAL(5,2),
                       format VARCHAR(100),
                       studentId INT NOT NULL,
                       FOREIGN KEY (studentId) REFERENCES student(studentId)
);

-- Create the lesson table
CREATE TABLE lesson (
                        lessonId VARCHAR(40) PRIMARY KEY,
                        subject VARCHAR(30),
                        dayOfWeek VARCHAR(10),
                        duration VARCHAR(10),
                        startTime VARCHAR(10),
                        endTime VARCHAR(10),
                        hourlyRate INT,
                        address VARCHAR(100),
                        postalCode INT,
                        studentId INT NOT NULL,
                        FOREIGN KEY (studentId) REFERENCES student(studentId)
);

-- Create the observation table
CREATE TABLE observation (
                             observationId VARCHAR(20) PRIMARY KEY,
                             date DATE NOT NULL,
                             notes VARCHAR(1000),
                             studentId INT NOT NULL,
                             FOREIGN KEY (studentId) REFERENCES student(studentId)
);

-- Create the report table
CREATE TABLE report (
                        reportId VARCHAR(20) PRIMARY KEY,
                        date DATE NOT NULL,
                        reportUrl VARCHAR(100),
                        studentId INT NOT NULL,
                        FOREIGN KEY (studentId) REFERENCES student(studentId)
);

-- Create the holidays table
CREATE TABLE holidays (
                          holidayId SERIAL PRIMARY KEY,
                          title VARCHAR(100) NOT NULL,
                          type VARCHAR(50) NOT NULL,
                          start DATE NOT NULL,
                          "end" DATE NOT NULL,
                          allDay BOOLEAN NOT NULL
);

-- Insert into holidays table (2023 dates)
INSERT INTO holidays (title, type, start, "end", allDay)
VALUES
    ('New Year''s Day', 'PH', '2023-01-01', '2023-01-01', true),
    ('Chinese New Year', 'PH', '2023-01-22', '2023-01-23', true),
    ('Good Friday', 'PH', '2023-04-07', '2023-04-07', true),
    ('Hari Raya Puasa', 'PH', '2023-04-22', '2023-04-22', true),
    ('Labour Day', 'PH', '2023-05-01', '2023-05-01', true),
    ('Vesak Day', 'PH', '2023-06-02', '2023-06-02', true),
    ('Hari Raya Haji', 'PH', '2023-06-29', '2023-06-29', true),
    ('National Day', 'PH', '2023-08-09', '2023-08-09', true),
    ('Deepavali', 'PH', '2023-11-12', '2023-11-12', true),
    ('Christmas Day', 'PH', '2023-12-25', '2023-12-25', true),
    ('Youth Day', 'SH', '2023-07-02', '2023-07-03', true),
    ('National Day School Holiday', 'SH', '2023-08-10', '2023-08-10', true),
    ('Teacher''s Day', 'SH', '2023-09-01', '2023-09-01', true),
    ('Children''s Day', 'SH', '2023-10-06', '2023-10-06', true),
    ('March School Holidays', 'TH', '2023-03-11', '2023-03-19', true),
    ('June School Holidays', 'TH', '2023-05-27', '2023-06-25', true),
    ('September School Holidays', 'TH', '2023-09-02', '2023-09-10', true),
    ('Year End School Holidays', 'TH', '2023-11-18', '2023-12-31', true);

-- Insert into holidays table (2024 dates)
INSERT INTO holidays (title, type, start, "end", allDay)
VALUES
    ('New Year''s Day', 'PH', '2024-01-01', '2024-01-01', true),
    ('Chinese New Year', 'PH', '2024-02-10', '2024-02-11', true),
    ('Good Friday', 'PH', '2024-03-29', '2024-03-29', true),
    ('Hari Raya Puasa', 'PH', '2024-04-10', '2024-04-10', true),
    ('Labour Day', 'PH', '2024-05-01', '2024-05-01', true),
    ('Vesak Day', 'PH', '2024-05-22', '2024-05-22', true),
    ('Hari Raya Haji', 'PH', '2024-06-17', '2024-06-17', true),
    ('National Day', 'PH', '2024-08-09', '2024-08-09', true),
    ('Deepavali', 'PH', '2024-10-31', '2024-10-31', true),
    ('Christmas Day', 'PH', '2024-12-25', '2024-12-25', true),
    ('Youth Day', 'SH', '2024-07-01', '2024-07-01', true),
    ('National Day School Holiday', 'SH', '2024-08-08', '2024-08-08', true),
    ('Teacher''s Day', 'SH', '2024-08-31', '2024-08-31', true),
    ('Children''s Day', 'SH', '2024-10-04', '2024-10-04', true),
    ('March School Holidays', 'TH', '2024-03-09', '2024-03-17', true),
    ('June School Holidays', 'TH', '2024-05-25', '2024-06-23', true),
    ('September School Holidays', 'TH', '2024-08-31', '2024-09-08', true),
    ('Year End School Holidays', 'TH', '2024-11-16', '2024-12-31', true);

