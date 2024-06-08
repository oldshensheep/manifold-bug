CREATE TABLE if not exists users
(
    user_id    SERIAL PRIMARY KEY,
    username   VARCHAR(50)  NOT NULL UNIQUE,
    email      VARCHAR(100) NOT NULL UNIQUE,
    password   VARCHAR(50)  NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE if not exists products
(
    product_id   SERIAL PRIMARY KEY,
    product_name VARCHAR(100)   NOT NULL,
    description  TEXT,
    price        DECIMAL(10, 2) NOT NULL,
    stock        INT            NOT NULL,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE if not exists orders
(
    order_id   SERIAL PRIMARY KEY,
    user_id    INT REFERENCES users (user_id),
    total      DECIMAL(10, 2) NOT NULL,
    status     VARCHAR(50)    NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE if not exists order_items
(
    order_item_id SERIAL PRIMARY KEY,
    order_id      INT REFERENCES orders (order_id),
    product_id    INT REFERENCES products (product_id),
    quantity      INT            NOT NULL,
    price         DECIMAL(10, 2) NOT NULL
);
