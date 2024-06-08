INSERT INTO users (username, email, password)
VALUES ('johndoe', 'john@example.com', 'password123'),
       ('janedoe', 'jane@example.com', 'securepass');

INSERT INTO products (product_name, description, price, stock)
VALUES ('Laptop', 'A high performance laptop', 999.99, 10),
       ('Smartphone', 'A latest model smartphone', 499.99, 20),
       ('Headphones', 'Noise cancelling headphones', 199.99, 15);

INSERT INTO orders (user_id, total, status)
VALUES (1, 1499.98, 'Pending'),
       (2, 199.99, 'Shipped');

INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (1, 1, 1, 999.99),
       (1, 2, 1, 499.99),
       (2, 3, 1, 199.99);
