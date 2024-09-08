create database library;
use library;
create table Branch (
  Branch_no int primary key,
  Manager_Id int,
  Branch_address varchar(50),
  Contact_no bigint unique);
  select * from branch;
  desc branch;
insert into Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, '123 2nd St', '1234567890'),
(2, 102, '123 3rd St', '2345678901'),
(3, 103, '234 4th St', '3456789012'),
(4, 104, '345 5th St', '4567890123'),
(5, 105, '456 6th St', '5678901234'),
(6, 106, '567 7th St', '6789012345'),
(7, 107, '789 8th St', '7890123456'),
(8, 108, '890 9th St', '8901234567');
select * from branch;
create table Employee (
  Emp_Id int primary key,
  Emp_name varchar(50),
  Position varchar(50),
  Salary DECIMAL(10, 2) not null,
  Branch_no int,
  foreign key (Branch_no) references Branch(Branch_no));
  insert into Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(1, 'Acub bob', 'Manager', 60000.00, 1),
(2, 'Cane James', 'Assistant', 50000.00, 1),
(3, 'Daniel George', 'Digital Librarian', 45000.00, 2),
(4, 'Ezabel mathew', 'Clerk', 35000.00, 4),
(5, 'Don Paul', 'Librarian', 55000.00, 2),
(6, 'Martin Jose', 'Cataloger', 50000.00, 3),
(7, 'Nelson Page', 'Coordinator', 40000.00, 3),
(8, 'Logan sadison', 'Maintenance', 40000.00, 5);
select * from employee;
Create table Books (
  ISBN varchar(14) primary key,
  Book_title Varchar(100),
  Category varchar(50),
  Rental_Price decimal(10, 2),
  Status varchar(3),
  Author varchar(100),
  Publisher varchar(100));
insert into Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('978-1476740188', 'The Library Book', 'History', 17.99, 'yes', 'Susan Orlean', 'Simon & Schuster.'),
('978-0062316110', 'Sapiens: A Brief History of Humankind', 'Anthropology', 37.50, 'yes', 'Yuval Noah Harari', 'Harvill Secker'),
('978-0441013593', 'Dune', 'Science Fiction', 23.49, 'yes', 'Frank Herbert', 'Chilton Books'),
('978-3608987492', 'The Hobbit', 'Fantasy', 21.99, 'yes', ' J.R.R. Tolkien', 'George Allen & Unwin'),
('978-1501173219', 'All the Light We Cannot See', ' histrical Fiction', 15.57, 'yes', 'Anthony Doerr', 'Scribner'),
('978-0553296983', 'The Diary of a Young Girl', 'Biography', 31.99, 'yes', 'Anne Frank', 'Contact Publishing'),
('978-1400052189', 'The Immortal Life of Henrietta Lacks', 'Science', 32.99, 'yes', 'Rebecca Skloot', 'Crown Publishing Group'),
('978-0735211292', 'Atomic habits', 'Self help', 13.77, 'yes', 'James Clear', 'Avery');
select * from books;
create table Customer (
  Customer_Id int primary key,
  Customer_name varchar(50),
  Customer_address varchar(50),
  Reg_date date);
insert into Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
values
(1, 'Thomas muller', '123 4th St', '2022-02-01'),
(2, 'Warrent buffet ', '456 3rd St', '2020-02-01'),
(3, 'Lamine yamal', '789 1st St', '2023-04-01'),
(4, 'Christphor Nolan', '321 5th St', '2022-06-01'),
(5, 'John wick', '901 15th St', '2021-05-01'),
(6, ' Emma mathew', '234 17th St', '2020-01-01'),
(7, 'Sam manuel', '567 20th St', '2022-02-01'),
(8, 'Paul varghese', '890 6th St', '2022-08-01');
select * from customer;
create table IssueStatus (
  Issue_Id int primary key ,
  Issued_cust int,
  Issued_book_name varchar(100),
  Issue_date date,
  Isbn_book varchar(14),
  foreign key (Issued_cust) references Customer(Customer_Id),
  foreign key (Isbn_book) references Books(ISBN));
  INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 1, 'The Library Book', '2023-01-01', '978-1476740188'),
(2, 1, 'Sapiens: A Brief History of Humankind', '2023-01-01', '978-0062316110'),
(3, 2, 'Dune', '2023-02-01', '978-0441013593'),
(4, 3,'The Hobbit', '2023-03-01', '978-3608987492'),
(5, 4, 'All the Light We Cannot See', '2023-04-01', '978-1501173219'),
(6, 4, 'The Diary of a Young Girl', '2023-05-01', '978-0553296983'),
(7, 6, 'The Immortal Life of Henrietta Lacks', '2023-06-01', '978-1400052189'),
(8, 7, 'Atomic habits', '2023-07-01', '978-0735211292');
select * from issuestatus;
create table ReturnStatus (
  Return_Id int primary key,
  Return_cust int,
  Return_book_name varchar(100),
  Return_date date,
  Isbn_book2 varchar(25),foreign key (isbn_book2)references books (isbn));
  insert into ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 1, 'The Library Book', '2023-02-01', '978-1476740188'),
(2, 1, 'Sapiens: A Brief History of Humankind', '2023-02-25', '978-0062316110'),
(3, 2, 'Dune', '2023-02-25', '978-0441013593'),
(4, 3, 'The Hobbit', '2023-04-10', '978-3608987492'),
(5, 4, 'All the Light We Cannot See', '2023-06-05', '978-1501173219'),
(6, 4, 'The Diary of a Young Girl', '2023-06-05', '978-0553296983'),
(7, 6, 'The Immortal Life of Henrietta Lacks', '2023-07-31', '978-1400052189'),
(8, 7, 'Atomic habits', '2023-08-07', '978-0735211292');
select * from returnstatus;
 select Book_title, Category, Rental_Price from Books
  where Status = 'yes';
select Emp_name, Salary from Employee
 order by Salary desc;
select Book_title, Customer_name
from Books
join IssueStatus on ISBN = Isbn_book
join Customer on Issued_cust = Customer_Id;
select Category, count(*) as Total_Books
from Books
group by Category;
select Emp_name, Position
from Employee
where Salary > 50000;
select Customer_name
from Customer
where Reg_date < '2022-01-01'
and Customer_Id not in (select Issued_cust from IssueStatus);
select Branch_no, count(*) as Total_Employees
from Employee
group by Branch_no;
select Customer_name
from Customer 
join IssueStatus on Customer_Id = Issued_cust
where month(Issue_date) = 6 and year(Issue_date) = 2023;
select Book_title
from Books
where Book_title like '%history%';
select Branch_no, count(*) as Employee_Count
from Employee
group by Branch_no
having count(*) > 5;
select Emp_name, Branch_address
from Employee 
join Branch on Emp_Id = 'Branch_no';
select Customer_name
from Customer
join IssueStatus on Customer_Id = Issued_cust
join Books on Isbn_book = ISBN
where Rental_Price > 25;