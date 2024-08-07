# Library-Management-System
In a typical college library, both teachers and students can issue books. The return period varies for both groups, and each book has a unique ID, even if they are copies of the same book by the same author. The system captures details such as who has issued the book, the issue duration, and any applicable fines.
Creating a library management system involves defining several entities and their relationships. Here are the primary entities and their attributes:
1. Student

Attributes:

    StudentID: Unique identifier for each student
    Name: Full name of the student
    DateOfBirth: Birth date of the student
    Address: Address of the student
    PhoneNumber: Contact number
    Email: Email address
    Course: Course the student is enrolled in

2. Book

Attributes:

    BookID: Unique identifier for each book
    Title: Title of the book
    Author: Author(s) of the book
    Publisher: Publisher of the book
    ISBN: International Standard Book Number
    Edition: Edition of the book
    CopiesAvailable: Number of copies available in the library

3. Teacher

Attributes:

    TeacherID: Unique identifier for each teacher
    Name: Full name of the teacher
    Department: Department the teacher belongs to
    Email: Email address
    PhoneNumber: Contact number

4. Issue

Attributes:

    IssueID: Unique identifier for each issue transaction
    StudentID: ID of the student who issued the book
    BookID: ID of the book that was issued
    IssueDate: Date when the book was issued
    DueDate: Date when the book is due to be returned
    ReturnDate: Date when the book was returned (nullable)
    FineAmount: Fine amount if the book is returned late (nullable)
