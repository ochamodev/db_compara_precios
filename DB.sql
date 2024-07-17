DROP DATABASE IF EXISTS compara_precios_gt;

CREATE DATABASE IF NOT EXISTS compara_precios_gt;

USE compara_precios_gt;

CREATE TABLE IF NOT EXISTS stores(
    id_store INTEGER AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    base_url TEXT NOT NULL,
    PRIMARY KEY (id_store)
);

CREATE TABLE IF NOT EXISTS product_brands(
    id_brand INTEGER AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_brand)
);

CREATE TABLE IF NOT EXISTS product_categories(
    id_category INTEGER AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_category)
);

CREATE TABLE IF NOT EXISTS products(
    id_product INTEGER AUTO_INCREMENT,
    id_category INTEGER NOT NULL,
    model_code VARCHAR(100) NOT NULL,
    id_brand INTEGER,
    last_updated DATETIME NOT NULL,
    PRIMARY KEY (id_product),
    FOREIGN KEY (id_brand) REFERENCES product_brands(id_brand),
    FOREIGN KEY (id_category) REFERENCES product_categories(id_category),
    UNIQUE(model_code)
);

CREATE TABLE IF NOT EXISTS product_store_details(
    id_product_store_info INTEGER AUTO_INCREMENT,
    id_product INTEGER NOT NULL,
    id_store INTEGER NOT NULL,
    product_store_name VARCHAR(255) NOT NULL,
    sku VARCHAR(20) NULL,
    current_price DECIMAL(10, 2) NOT NULL,
    sale_price DECIMAL(10, 2) NULL,
    last_updated DATETIME NOT NULL,
    store_detail_url TEXT NOT NULL,
    store_image_url TEXT NOT NULL,
    PRIMARY KEY (id_product_store_info),
    FOREIGN KEY (id_product) REFERENCES products(id_product),
    FOREIGN KEY (id_store) REFERENCES stores(id_store),
    UNIQUE(sku)
);

CREATE TABLE IF NOT EXISTS product_history_prices(
    id_product_history INTEGER AUTO_INCREMENT,
    id_product INTEGER NOT NULL,
    id_store INTEGER NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    creation_date DATE NOT NULL,
    PRIMARY KEY (id_product_history),
    FOREIGN KEY (id_product) REFERENCES products(id_product),
    FOREIGN KEY (id_store) REFERENCES stores(id_store)
);

