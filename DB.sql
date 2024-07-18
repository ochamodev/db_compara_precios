DROP DATABASE IF EXISTS compara_precios_gt;

CREATE DATABASE IF NOT EXISTS compara_precios_gt;

USE compara_precios_gt;

CREATE TABLE IF NOT EXISTS stores(
    id INTEGER AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    base_url TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS product_brands(
    id INTEGER AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS product_categories(
    id INTEGER AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS products(
    id INTEGER AUTO_INCREMENT,
    id_category INTEGER NOT NULL,
    model_code VARCHAR(100) NOT NULL,
    id_brand INTEGER,
    last_updated DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_brand) REFERENCES product_brands(id),
    FOREIGN KEY (id_category) REFERENCES product_categories(id),
    UNIQUE(model_code)
);

CREATE TABLE IF NOT EXISTS product_store_details(
    id INTEGER AUTO_INCREMENT,
    id_product INTEGER NOT NULL,
    id_store INTEGER NOT NULL,
    product_store_name VARCHAR(255) NOT NULL,
    sku VARCHAR(20) NULL,
    current_price DECIMAL(10, 2) NOT NULL,
    sale_price DECIMAL(10, 2) NULL,
    last_updated DATETIME NOT NULL,
    store_detail_url TEXT NOT NULL,
    store_image_url TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_product) REFERENCES products(id),
    FOREIGN KEY (id_store) REFERENCES stores(id),
    UNIQUE(sku)
);

CREATE TABLE IF NOT EXISTS product_history_prices(
    id INTEGER AUTO_INCREMENT,
    id_product INTEGER NOT NULL,
    id_store INTEGER NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    creation_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_product) REFERENCES products(id),
    FOREIGN KEY (id_store) REFERENCES stores(id)
);

