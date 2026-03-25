
CREATE TABLE IF NOT EXISTS dim_customer (
    cust_id INTEGER PRIMARY KEY,
    customer_type TEXT,
    gender TEXT
);

CREATE TABLE IF NOT EXISTS dim_product (
    cat_id INTEGER PRIMARY KEY,
    product_line TEXT
);


CREATE TABLE IF NOT EXISTS dim_store (
    store_id INTEGER PRIMARY KEY,
    branch TEXT,
    city TEXT
);


CREATE TABLE IF NOT EXISTS fact_sales (
    invoice_id TEXT PRIMARY KEY,
    customer_type TEXT,
    gender TEXT,
    unit_price REAL,
    product_line TEXT,
    branch TEXT,
    city TEXT,
    quantity INTEGER,
    tax REAL,
    total REAL,
    date TEXT,
    time TEXT,
    payment TEXT,
    cogs REAL,
    gross_margin_percentage REAL,
    gross_income REAL,
    rating REAL
);

CREATE TABLE IF NOT EXIST dim_date (
    date_id INTEGER
    date_id INTEGER
    day INTEGER
    month INTEGER
    year INTEGER
    quarter INTEGER
    day_of_week TEXT
    month_name TEXT
    week_of_year INTEGER
)