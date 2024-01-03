CREATE TYPE product_state AS ENUM ('in stock', 'out of stock');

CREATE TABLE IF NOT EXISTS Product
(
    id SERIAL PRIMARY KEY,
    product_name  VARCHAR(255) NOT NULL,
    product_status product_state
);

CREATE TYPE shop_state AS ENUM ('opened', 'closed');

CREATE TABLE IF NOT EXISTS Shop
(
    id SERIAL PRIMARY KEY,
    shop_status shop_state
);

CREATE TABLE IF NOT EXISTS Product_Range
(
    shop_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    CONSTRAINT shop_id_fk FOREIGN KEY (shop_id) REFERENCES Shop (id) ON DELETE CASCADE,
    CONSTRAINT product_id_fk FOREIGN KEY (product_id) REFERENCES Product (id) ON DELETE CASCADE,
    CONSTRAINT shop_product_id PRIMARY KEY (shop_id, product_id)
);

CREATE TYPE human_sex AS ENUM ('male', 'female');

CREATE TYPE employment AS ENUM ('employed', 'unemployed');

CREATE TABLE IF NOT EXISTS Human
(
    id SERIAL PRIMARY KEY,
    human_name VARCHAR(100),
    human_age INTEGER,
    sex human_sex,
    salary INTEGER,
    job_state employment
);

CREATE TABLE IF NOT EXISTS Role_Duty
(
    id SERIAL PRIMARY KEY,
    action_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Admin
(
    id SERIAL PRIMARY KEY,
    human_id INTEGER REFERENCES Human (id) ON DELETE CASCADE NOT NULL,
    sold_count INTEGER,
    role_duty_id INTEGER REFERENCES Role_Duty (id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE IF NOT EXISTS Master
(
    id SERIAL PRIMARY KEY,
    human_id INTEGER REFERENCES Human (id) ON DELETE CASCADE NOT NULL,
    fixed INTEGER,
    not_fixed INTEGER,
    role_duty_id INTEGER REFERENCES Role_Duty (id) ON DELETE CASCADE NOT NULL
);

CREATE TYPE mentality AS ENUM ('happy', 'modest', 'angry');

CREATE TABLE IF NOT EXISTS Owner
(
    id SERIAL PRIMARY KEY,
    human_id INTEGER REFERENCES Human (id) ON DELETE CASCADE NOT NULL,
    cruelty mentality,
    role_duty_id INTEGER REFERENCES Role_Duty (id) ON DELETE CASCADE NOT NULL
);

CREATE TYPE relax_room_state AS ENUM ('opened', 'closed');

CREATE TABLE IF NOT EXISTS Relax_Room
(
    id SERIAL PRIMARY KEY,
    room_state relax_room_state
);

CREATE TABLE IF NOT EXISTS Room
(
    id SERIAL PRIMARY KEY,
    place_id INTEGER REFERENCES place(id) ON DELETE CASCADE NOT NULL,
    human_id INTEGER REFERENCES human(id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE IF NOT EXISTS Event_Time
(
    id SERIAL PRIMARY KEY,
    start TIME WITHOUT TIME ZONE,
    finish TIME WITHOUT TIME ZONE,
    start_date date,
    finish_date date
);

CREATE TABLE IF NOT EXISTS Event
(
    id SERIAL PRIMARY KEY,
    event_time_id INTEGER REFERENCES event_time(id) ON DELETE CASCADE NOT NULL
    event_name VARCHAR(255),
    status VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Address
(
    id SERIAL PRIMARY KEY,
    address_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Equipment
(
    id SERIAL PRIMARY KEY,
    address_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Buyer
(
    id SERIAL PRIMARY KEY,
    human_id INTEGER REFERENCES human(id) ON DELETE CASCADE NOT NULL,
    place_id INTEGER REFERENCES place(id) ON DELETE CASCADE NOT NULL,
    room_id INTEGER REFERENCES room(id) ON DELETE CASCADE NOT NULL,
    role_duty_id INTEGER REFERENCES role_duty(id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE IF NOT EXISTS Place
(
    id SERIAL PRIMARY KEY,
    address_id INTEGER REFERENCES address(id) ON DELETE CASCADE NOT NULL,
    room_id INTEGER REFERENCES room(id) ON DELETE CASCADE NOT NULL,
    owner_id INTEGER REFERENCES owner(id) ON DELETE CASCADE NOT NULL,
    admin_id INTEGER REFERENCES admin(id) ON DELETE CASCADE NOT NULL,
    buyer_id INTEGER REFERENCES buyer(id) ON DELETE CASCADE NOT NULL,
    master_id INTEGER REFERENCES master(id) ON DELETE CASCADE NOT NULL,
    status VARCHAR(20),
    relax_room_id INTEGER REFERENCES relax_room(id) ON DELETE CASCADE NOT NULL,
    shop_id INTEGER REFERENCES shop(id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE IF NOT EXISTS Place_to_Event
(
    id SERIAL PRIMARY KEY,
    place_id INTEGER REFERENCES place(id) ON DELETE CASCADE NOT NULL,
    event_id INTEGER REFERENCES event(id) ON DELETE CASCADE NOT NULL,
);

CREATE TABLE IF NOT EXISTS Place_to_Buyer
(
    id SERIAL PRIMARY KEY,
    place_id INTEGER REFERENCES place(id) ON DELETE CASCADE NOT NULL,
    buyer_id INTEGER REFERENCES buyer(id) ON DELETE CASCADE NOT NULL
);

