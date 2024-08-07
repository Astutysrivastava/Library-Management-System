show databases;
create database library_management;
use library_management;
show tables;
# Library Management;

## creating STUDENT Table
# Library Management

show databases;
use sumit_db;

## creating STUDENT Table
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address TEXT
);
ALTER TABLE Students
ADD COLUMN Department varchar(255),
ADD COLUMN Dateofbirth DATE;

INSERT INTO Students (Name, Email,phone_number, Department, DateOfBirth) VALUES
('Astuty Srivastava', 'astuty@gmail.com', '1234567890', 'Computer Science', '2000-01-15'),
('Anjali Kumari', 'anjali@gmail.com', '0987654321', 'Mechanical Engineering', '2001-03-22'),
('Rishika Sharma', 'rishika@gmail.com', '1112223333', 'Electrical Engineering', '1999-07-08'),
('Nandita kumari', 'nandita@gmail.com', '4445556666', 'Civil Engineering', '2000-11-11'),
('Abhi Kumar', 'abhi.davis@gmail.com', '7778889999', 'Computer Science', '2001-04-16'),
('Gagan Mishra', 'gagan.miller@gmail.com', '2223334444', 'Information Technology', '1998-09-25'),
('Sumit kumar', 'sumit.wilson@gmail.com', '5556667777', 'Computer Science', '2000-12-30'),
('saurabh kumar', 'saurabh.white@gmail.com', '8889990000', 'Electronics Engineering', '1999-02-14'),
('Nisha Verma', 'nishas@gmail.com', '1231231234', 'Mechanical Engineering', '2001-06-10'),
('Shivanshu Kumar', 'shivanshu.martin@gmail.com', '3213214321', 'Civil Engineering', '2000-08-21'),
('Khushboo kumari', 'khushboo@gmail.com', '9876543210', 'Computer Science', '1998-05-05'),
('Khushi Gupta', 'khushi@gmail.com', '2345678901', 'Electrical Engineering', '2001-09-19'),
('Anamika Dubey', 'anamika@gmail.com', '3456789012', 'Mechanical Engineering', '1999-01-01'),
('smita kumari', 'smita@gmail.com', '4567890123', 'Civil Engineering', '2000-02-29'),
('Mona kumari', 'mona.allen@gmail.com', '5678901234', 'Information Technology', '1999-03-31');

## creating TEACHER Table
CREATE TABLE Teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address TEXT
);
ALTER TABLE Teachers
ADD COLUMN address TEXT;
ALTER TABLE Teachers
DROP COLUMN address;

DESCRIBE Teachers;


INSERT INTO Teachers (Name, Email,phone_number , address) VALUES
('Dr. Renu Bagoria', 'renubagoria@gmail.com', '9876543210', 'Jaipur'),
('Prof. Suraj yadav', 'surajyadav@gmail.com', '8765432109', 'Kolkata'),
('Dr. Ranjana Mishra', 'ranjana23@gmail.com', '7654321098', 'patna'),
('Prof.Manish khandelwal', 'manish@gmail.com', '6543210987', 'Mumabi'),
('Dr. Shailendra Sharma', 'shailendra@gmail.com', '5432109876', 'Goa'),
('Prof. Rajkumar Sharma', 'rajkumar@gmail.com', '4321098765', 'Kerala'),
('Dr. Ajay Shrivastava', 'ajaykr@gmail.com', '3210987654', 'Shimla');
show tables;

## creating BOOK Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    publisher VARCHAR(100),
    year_published YEAR,
    copy_number INT
);
ALTER TABLE Books MODIFY year_published VARCHAR(4);

INSERT INTO Books (title, author, genre, publisher, year_published, copy_number) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 'Scribner', 1925, 5),
('1984', 'George Orwell', 'Dystopian', 'Secker & Warburg', 1949, 3),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 'J.B. Lippincott & Co.', 1960, 2),
('Pride and Prejudice', 'Jane Austen', 'Romance', 'T. Egerton', 1813, 4),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 'Little, Brown and Company', 1951, 6),
('Moby-Dick', 'Herman Melville', 'Adventure', 'Richard Bentley', 1851, 2),
('War and Peace', 'Leo Tolstoy', 'Historical', 'The Russian Messenger', 1869, 1),
('Brave New World', 'Aldous Huxley', 'Science Fiction', 'Chatto & Windus', 1932, 3),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 'George Allen & Unwin', 1937, 5),
('The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 'George Allen & Unwin', 1954, 7),
('Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 'Fantasy', 'Scholastic Inc.', 1997, 10),
('Harry Potter and the Chamber of Secrets', 'J.K. Rowling', 'Fantasy', 'Scholastic Inc.', 1998, 8);

## creating IssuedBook Table
CREATE TABLE IssuedBooks (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    issued_to_student INT,
    issued_to_teacher INT,
    issue_date DATE,
    return_date DATE,
    fine DECIMAL(5, 2),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (issued_to_student) REFERENCES Students(student_id),
    FOREIGN KEY (issued_to_teacher) REFERENCES Teachers(teacher_id),
    CHECK (
        (issued_to_student IS NOT NULL AND issued_to_teacher IS NULL) OR
        (issued_to_student IS NULL AND issued_to_teacher IS NOT NULL)
    )
);
ALTER TABLE IssuedBooks DROP CHECK issuedbooks_chk_1;

INSERT INTO IssuedBooks (book_id, issued_to_student, issue_date, return_date, fine) VALUES
(15, 1, '2024-08-01', '2024-08-15', 0.00), -- BookID 15, StudentID 1
(17, 2, '2024-08-02', '2024-08-16', 0.00), -- BookID 17, StudentID 2
(13, NULL, '2024-08-03', '2024-08-17', 0.00), -- BookID 13, TeacherID 1 (Assuming you have this teacher ID)
(14, 3, '2024-08-04', '2024-08-18', 5.00), -- BookID 14, StudentID 3
(16, NULL, '2024-08-05', '2024-08-19', 0.00); -- BookID 16, TeacherID 2 (if needed)

SELECT * FROM Books;


SELECT * FROM Students;

SELECT * FROM Teachers;




















## creating TEACHER Table
CREATE TABLE Teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address TEXT
);
## creating BOOK Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    publisher VARCHAR(100),
    year_published YEAR,
    copy_number INT
);

## creating IssuedBook Table
CREATE TABLE IssuedBooks (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    issued_to_student INT,
    issued_to_teacher INT,
    issue_date DATE,
    return_date DATE,
    fine DECIMAL(5, 2),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (issued_to_student) REFERENCES Students(student_id),
    FOREIGN KEY (issued_to_teacher) REFERENCES Teachers(teacher_id),
    CHECK (
        (issued_to_student IS NOT NULL AND issued_to_teacher IS NULL) OR
        (issued_to_student IS NULL AND issued_to_teacher IS NOT NULL)
    )
);

















