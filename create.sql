CREATE TYPE product_status AS ENUM ('in stock', 'out of stock');
CREATE TYPE shop_status as ENUM('opened', 'closed');
CREATE TYPE sex as ENUM('male', 'female');
CREATE TYPE job_state as ENUM('employed', 'unemployed');
CREATE TYPE cruelty as ENUM('happy', 'modest', 'angry');
CREATE TYPE room_state as ENUM('opened', 'closed');
CREATE TYPE place_status as ENUM('opened', 'closed');

CREATE TABLE IF NOT EXISTS Product
(
    id SERIAL PRIMARY KEY,
    product_name  VARCHAR(255) NOT NULL,
    product_status ENUM ('in stock', 'out of stock'),
    product_price INTEGER
);

CREATE TABLE IF NOT EXISTS Shop
(
    id SERIAL PRIMARY KEY,
    shop_status ENUM ('opened', 'closed')
);

CREATE TABLE IF NOT EXISTS Product_Range
(
    shop_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    CONSTRAINT shop_id_fk FOREIGN KEY (shop_id) REFERENCES Shop (id) ON DELETE CASCADE,
    CONSTRAINT product_id_fk FOREIGN KEY (product_id) REFERENCES Product (id) ON DELETE CASCADE,
    CONSTRAINT shop_product_id PRIMARY KEY (shop_id, product_id)
);

CREATE TABLE IF NOT EXISTS Human
(
    id SERIAL PRIMARY KEY,
    human_name VARCHAR(100),
    human_age INTEGER,
    sex ENUM ('male', 'female'),
    salary INTEGER,
    job_state ENUM ('employed', 'unemployed')
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
    role_duty_id INTEGER REFERENCES Role_Duty (id) ON DELETE CASCADE NOT NULL,
    state_work BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS Master
(
    id SERIAL PRIMARY KEY,
    human_id INTEGER REFERENCES Human (id) ON DELETE CASCADE NOT NULL,
    fixed INTEGER,
    not_fixed INTEGER,
    role_duty_id INTEGER REFERENCES Role_Duty (id) ON DELETE CASCADE NOT NULL,
    state_work BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS Owner
(
    id SERIAL PRIMARY KEY,
    human_id INTEGER REFERENCES Human (id) ON DELETE CASCADE NOT NULL,
    cruelty ENUM ('happy', 'modest', 'angry'),
    role_duty_id INTEGER REFERENCES Role_Duty (id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE IF NOT EXISTS Relax_Room
(
    id SERIAL PRIMARY KEY,
    room_state ENUM ('opened', 'closed')
);

CREATE TABLE IF NOT EXISTS Room
(
    id SERIAL PRIMARY KEY,
    place_id INTEGER REFERENCES Place (id) ON DELETE CASCADE NOT NULL,
    human_id INTEGER REFERENCES Human (id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE IF NOT EXISTS Event_Time
(
    id SERIAL PRIMARY KEY,
    start TIME WITHOUT TIME ZONE,
    finish TIME WITHOUT TIME ZONE
);

CREATE TABLE IF NOT EXISTS Event
(
    id SERIAL PRIMARY KEY,
    event_time_id INTEGER REFERENCES Event_time (id) ON DELETE CASCADE NOT NULL
    event_name VARCHAR(255),
    event_status VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Address
(
    id SERIAL PRIMARY KEY,
    address_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Equipment
(
    id SERIAL PRIMARY KEY,
    address_id INTEGER REFERENCES Address (id) ON DELETE CASCADE NOT NULL,
    equipment_name VARCHAR(255),
    product_price INTEGER
);

CREATE TABLE IF NOT EXISTS Buyer
(
    id SERIAL PRIMARY KEY,
    human_id INTEGER REFERENCES Human (id) ON DELETE CASCADE NOT NULL,
    place_id INTEGER REFERENCES Place (id) ON DELETE CASCADE NOT NULL,
    ban_status BOOLEAN NOT NULL,
    warning_count INTEGER,
    role_duty_id INTEGER REFERENCES Role_duty (id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE IF NOT EXISTS Place
(
    id SERIAL PRIMARY KEY,
    address_id INTEGER REFERENCES Address (id) ON DELETE CASCADE NOT NULL,
    owner_id INTEGER REFERENCES Owner (id) ON DELETE CASCADE NOT NULL,
    admin_id INTEGER REFERENCES Admin (id) ON DELETE CASCADE NOT NULL,
    master_id INTEGER REFERENCES Master (id) ON DELETE CASCADE NOT NULL,
    place_status ENUM ('opened', 'closed'),
    relax_room_id INTEGER REFERENCES Relax_room (id) ON DELETE CASCADE NOT NULL,
    shop_id INTEGER REFERENCES Shop (id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE IF NOT EXISTS Place_to_Event
(
    id SERIAL PRIMARY KEY,
    place_id INTEGER REFERENCES Place (id) ON DELETE CASCADE NOT NULL,
    event_id INTEGER REFERENCES Event (id) ON DELETE CASCADE NOT NULL,
);

CREATE TABLE IF NOT EXISTS Place_to_Buyer
(
    id SERIAL PRIMARY KEY,
    place_id INTEGER REFERENCES Place (id) ON DELETE CASCADE NOT NULL,
    buyer_id INTEGER REFERENCES Buyer (id) ON DELETE CASCADE NOT NULL
);
