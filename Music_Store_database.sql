select * from books
select * from orders
select * from customers

SELECT * FROM Books 
WHERE Genre='Fiction';

SELECT * FROM Books 
WHERE Published_year>1950;

SELECT * FROM Customers 
WHERE country='Canada';

SELECT * FROM Orders 
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

SELECT SUM(stock) AS Total_Stock
From Books;

SELECT * FROM Books 
ORDER BY Price DESC 
LIMIT 1;

SELECT * FROM Orders 
WHERE quantity>1;

SELECT * FROM Orders 
WHERE total_amount>20;

SELECT DISTINCT genre FROM Books;

SELECT * FROM Books 
ORDER BY stock 
LIMIT 1;

SELECT SUM(total_amount) As Revenue 
FROM Orders;



select b.genre, sum(o.quantity) from books as b
join orders as o on
b.book_id=o.book_id
group by b.genre


select avg(price) as  Average_Price from books
where genre='Fantasy';


select o.customer_id, c.name, count(order_id) as Order_count
from orders as o
join customers as c on
c.customer_id=o.customer_id
group by o.customer_id,c.name
having count(order_id)>=2


select b.title,o.order_date from orders as o
join books as b on
b.book_id=o.book_id
order by o.order_date desc limit 10


select title, price from books where genre='Fantasy' order by price desc limit 3;


select b.author, sum(o.quantity) from books as b join orders as o
on b.book_id=o.book_id 
group by b.author


select distinct c.city, o.total_amount
from customers as c
join orders as o
on c.customer_id=o.customer_id
where o.total_amount >= 30;


SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent Desc LIMIT 1;


SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id 
ORDER BY b.book_id;