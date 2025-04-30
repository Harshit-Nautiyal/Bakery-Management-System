CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id),
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);

-- Insert some sample products
INSERT INTO products (name, description, price, image_url) VALUES
('Cake', 'Rich chocolate layer cake with ganache', 29.99, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80'),
('Bread', 'Artisanal sourdough bread', 8.99, 'https://media.istockphoto.com/id/183039480/photo/sourdough-bread.jpg?s=612x612&w=0&k=20&c=IaZxtZ3l2OXptZXYBZPr_JP-msoyzzZZ78WnRzavlZQ='),
('Muffin', 'Moist muffin loaded with blueberries', 3.99, 'https://media.istockphoto.com/id/157614033/photo/blueberry-muffin-and-fresh-blueberries-isolated-on-white.jpg?s=612x612&w=0&k=20&c=_gaV8iupDeinNFlEI_1dz-_zYApvtLGVlw24XQGbzeg='),
('Croissant', 'Buttery, flaky French pastry', 4.50, 'https://media.istockphoto.com/id/178462137/photo/croissant-isolated-on-white.jpg?s=612x612&w=0&k=20&c=jDNGlWLbufaPJuAxs5FH0-yyOC8SoPSwSE9FQKjGwJQ=');