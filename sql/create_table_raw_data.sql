-- Creating table for our raw data
CREATE TABLE public.products (
    product_id VARCHAR(20),
    product VARCHAR(100),
    category VARCHAR(100),
    subcategory VARCHAR(100)
);

-- Data were loaded manually - right click on public.products and import data