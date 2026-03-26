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

CREATE TABLE IF NOT EXISTS dim_date (
    date_id INTEGER PRIMARY KEY,
    date TEXT,
    day INTEGER,
    month INTEGER,
    year INTEGER,
    quarter INTEGER,
    day_of_week TEXT,
    month_name TEXT,
    week_of_year INTEGER
);

CREATE TABLE IF NOT EXISTS fact_sales (
    invoice_id TEXT PRIMARY KEY,
    store_id INTEGER,
    cust_id INTEGER,
    date_id INTEGER,
    cat_id INTEGER,
    unit_price REAL,
    quantity INTEGER,
    tax_5 REAL,
    total REAL,
    time TEXT,
    payment TEXT,
    cogs REAL,
    gross_margin_percentage REAL,
    gross_income REAL,
    rating REAL,
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (cust_id) REFERENCES dim_customer(cust_id),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (cat_id) REFERENCES dim_product(cat_id)
);