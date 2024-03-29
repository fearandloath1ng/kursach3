INSERT INTO Product (product_name, product_state, product_price) 
VALUES 
('Струны для электрогитары', 'in stock', 1500),
('Струны для бас гитары', 'in stock', 2000),
('Струны для акустической гитары', 'out of stock', 600),
('Медиатор тонкий', 'out of stock', 150),
('Медиатор средний', 'in stock', 180),
('Медиатор толстый', 'in stock', 250),
('Батарейка 9 вольт', 'in stock', 20000),
('Барабанные палочки', 'in stock', 8000) 
ON CONFLICT DO NOTHING;

INSERT INTO Shop (shop_state)
VALUES 
('opened'),
('opened'),
('opened'),
('closed'),
('opened'),
('opened'),
('opened'),
('opened'),
('closed'),
('opened') 
ON CONFLICT DO NOTHING;

INSERT INTO Product_Range (shop_id, product_id)
VALUES 
(1, 1),
(1, 2),
(1, 3),
(2, 5),
(2, 6),
(2, 8),
(3, 1),
(3, 7),
(3, 8),
(4, 2),
(4, 4),
(4, 6),
(5, 4),
(5, 5),
(5, 7),
(6, 1),
(6, 2),
(6, 4),
(7, 1),
(7, 7),
(7, 8),
(8, 4),
(8, 5),
(8, 6),
(9, 1),
(9, 2),
(9, 7),
(10, 2),
(10, 3),
(10, 5) 
ON CONFLICT DO NOTHING;

INSERT INTO Human (human_name, human_age, sex_type, salary, job_status)
VALUES ('Daniel Binov', 20, 'male', 1000000, 'employed'),
       ('Ruslan Abulfatov', 20, 'male', 1000000, 'employed'),
       ('Irina Kapustova', 24, 'female', 150000, 'employed'),
       ('Polina Pirozhkova', 25, 'female', 120000, 'employed'),
       ('Ivan Ivanov', 30, 'male', 45000, 'employed'),
       ('Petr Petrov', 19, 'male', 50000, 'employed'),
       ('Andrei Vinokurov', 23, 'male', 25000, 'employed'),
       ('Alexandra Chernina', 45, 'female', 57000, 'employed'),
       ('Viktoria Putina', 32, 'female', 0, 'unemployed'),
       ('Eva Rabinovich', 18, 'female', 90000, 'employed'),
       ('Regina Kovalchuk', 46, 'female', 75000, 'employed'),
       ('Isaak Moskvin', 50, 'male', 40000, 'employed'),
       ('Polina Belokurova', 34, 'female', 60000, 'employed'),
       ('Ivan Benzinov', 23, 'male', 200000, 'employed'),
       ('Maxim Prihodko', 25, 'male', 28000, 'employed'),
       ('Alexander Ivanov', 19, 'male', 45000, 'employed'),
       ('Nikita Orlov', 36, 'male', 65000, 'employed'),
       ('Olga Khutorova', 38, 'female', 90000, 'employed'),
       ('Maria Balabanova', 28, 'female', 40000, 'employed'),
       ('Tatiana Tarantinova', 26, 'female', 20000, 'employed'),
       ('Denis Denverov', 25, 'male', 130000, 'employed'),
       ('Artur Pirozhkov', 19, 'male', 25000, 'employed'),
       ('Eleonora Vishneva', 39, 'female', 55000, 'employed'),
       ('Andrei Golubev', 58, 'male', 67000, 'employed'),
       ('Petr Kozlov', 35, 'male', 0, 'unemployed'),
       ('Daria Troekurova', 46, 'female', 100000, 'employed'),
       ('Gleb Morkovkin', 27, 'male', 50000, 'employed'),
       ('Alexandra Kashina', 38, 'female', 70000, 'employed'),
       ('Artem Blinin', 31, 'male', 39000, 'employed'),
       ('Petr Soloviev', 39, 'male', 190000, 'employed'),
       ('Dmitrii Duhin', 23, 'male', 25000, 'employed'),
       ('Alexei Denisov', 24, 'male', 27000, 'employed'),
       ('Ivan Sizov', 34, 'male', 50000, 'employed'),
       ('Stas Glebushkov', 30, 'male', 100000, 'employed'),
       ('David Belobrysov', 56, 'male', 120000, 'employed'),
       ('Ruslan Rechkin', 33, 'male', 67000, 'employed'),
       ('Tatiana Bikova', 24, 'female', 49000, 'employed'),
       ('Olga Frantsuzova', 55, 'female', 45000, 'employed'),
       ('Elena Knizhkina', 40, 'female', 150000, 'employed'),
       ('Ivan Nomerov', 22, 'male', 73000, 'employed'),
       ('Anastasia Petrova', 26, 'female', 29000, 'employed'),
       ('Daria Suvorova', 44, 'female', 45000, 'employed'),
       ('Petr Savushkin', 27, 'male', 77000, 'employed'),
       ('Danila Danilov', 41, 'male', 35000, 'employed'),
       ('Denis Chizhykov', 25, 'male', 100000, 'employed'),
       ('Ivan Vinogradov', 21, 'male', 180000, 'employed'),
       ('Vladimir Gorbunov', 22, 'male', 78000, 'employed'),
       ('Oleg Ivanov', 27, 'male', 30000, 'employed'),
       ('Sergei Kozlovskiy', 19, 'male', 40500, 'employed'),
       ('Nikita Voznesentsov', 25, 'male', 80000, 'employed'),
       ('Olga Goldberg', 18, 'female', 0, 'unemployed'),
       ('Petr Panin', 21, 'male', 33000, 'employed'),
       ('Daniel Baranov', 20, 'male', 38000, 'employed'),
       ('Mikhail Sapogov', 20, 'male', 76000, 'employed'),
       ('Maria Popova', 33, 'female', 40000, 'employed'),
       ('Ivan Sokolov', 23, 'male', 90000, 'employed') ON CONFLICT DO NOTHING;

INSERT INTO Role_Duty (action_name)
VALUES ('Fire, Hire, Ban, Open event, Close event, Open place, Close place'),
       ('Sell, Clean, Snitch, Open event, Close event'),
       ('Fix, Snitch'),
       ('Buy, Rehearse') ON CONFLICT DO NOTHING;

INSERT INTO Admin (human_id, sold_count, role_duty_id, state_work)
VALUES (7, 50, 2, TRUE),
       (8, 87, 2, TRUE),
       (11, 91, 2, TRUE),
       (12, 54, 2, TRUE),
       (13, 76, 2, TRUE),
       (14, 63, 2, TRUE),
       (15, 53, 2, TRUE),
       (31, 50, 2, TRUE),
       (32, 81, 2, TRUE),
       (33, 77, 2, TRUE) ON CONFLICT DO NOTHING;

INSERT INTO Master (human_id, fixed, not_fixed, role_duty_id, state_work)
VALUES (10, 56, 2, 3, TRUE),
       (16, 37, 3, 3, TRUE),
       (17, 59, 5, 3, TRUE),
       (20, 88, 0, 3, TRUE),
       (27, 67, 1, 3, TRUE),
       (29, 54, 1, 3, TRUE),
       (30, 70, 3, 3, TRUE),
       (34, 73, 2, 3, TRUE),
       (35, 50, 1, 3, TRUE),
       (40, 80, 1, 3, TRUE) ON CONFLICT DO NOTHING;

INSERT INTO Owner (human_id, cruelty_type, role_duty_id)
VALUES (1, 'happy', 1) ON CONFLICT DO NOTHING;

INSERT INTO Relax_Room (room_status)
VALUES ('opened'),
       ('closed'),
       ('opened'),
       ('opened'),
       ('closed'),
       ('opened'),
       ('opened'),
       ('closed'),
       ('opened'),
       ('opened') ON CONFLICT DO NOTHING;


INSERT INTO Place (address_id, owner_id, admin_id, master_id, place_state, relax_room_id, shop_id)
VALUES (1, 1, 1, 1, 'opened', 1, 1),
       (2, 1, 2, 2, 'opened', 2, 2),
       (3, 1, 3, 3, 'opened', 3, 3),
       (4, 1, 4, 4, 'opened', 4, 4),
       (5, 1, 5, 5, 'opened', 5, 5),
       (6, 1, 6, 6, 'opened', 6, 6),
       (7, 1, 7, 7, 'opened', 7, 7),
       (8, 1, 8, 8, 'opened', 8, 8),
       (9, 1, 9, 9, 'opened', 9, 9),
       (10, 1, 10, 10, 'opened', 10, 10) ON CONFLICT DO NOTHING;

INSERT INTO Room (place_id, human_id)
VALUES (1, 37),
       (1, 38),
       (2, 25),
       (2, 32),
       (3, 16),
       (3, 31),
       (4, 30),
       (4, 11),
       (5, 21),
       (5, 10),
       (6, 22),
       (6, 23),
       (7, 17),
       (7, 24),
       (8, 19),
       (8, 20),
       (9, 29),
       (9, 27),
       (10, 28),
       (10, 15) ON CONFLICT DO NOTHING;

INSERT INTO Event_Time (start, finish)
VALUES  
('12:00', '15:30'),  
('09:00', '12:45'),
('18:30', '21:00'),
('15:00','16:00'),
('10:00','11:15') 
ON CONFLICT DO NOTHING;

INSERT INTO Event (event_time_id, event_name, event_status)
VALUES (1, 'Sale', 'Ongoing'),
       (2, 'Cashback', 'finished'),
       (2, 'Lottery', 'finished'),
       (3, 'Talent Show', 'finished'),
       (4, 'Concert', 'finished'),
       (4, 'Party', 'finished'),
       (5, 'Secret Event', 'finished') ON CONFLICT DO NOTHING;

INSERT INTO Address (address_name)
VALUES ('Nevsky 122'),
       ('Sadovaya 49'),
       ('13th line V.O. 30'),
       ('Shamsheva 8'),
       ('Beloostrovskaya 22'),
       ('Mebelnaya 1'),
       ('Borovaya 51'),
       ('Rozenshtein 8'),
       ('Kazanskaya 5'),
       ('Marata 36') ON CONFLICT DO NOTHING;

INSERT INTO Equipment (address_id, equipment_name, product_price)
VALUES (1, 'DW drums', 20000),
       (1, 'Fender Jazz bass', 40000),
       (1, 'Gibson Les Paul guitar', 10000000),
       (2, 'Gretch drums', 45000),
       (2, 'Gretch bass', 76000),
       (2, 'Rickenbacker guitar', 35000),
       (3, 'Tama drums', 67000),
       (3, 'Ibanez bass', 85000),
       (3, 'Ibanez guitar', 65000),
       (4, 'Yamaha drums', 55000),
       (4, 'Fender bass', 53054),
       (4, 'Fender Stratocaster guitar', 23200),
       (5, 'Sonor drums', 54300),
       (5, 'Gibson bass', 70000),
       (5, 'Gibson Flying V guitar', 48000),
       (6, 'Pearl drums', 30000),
       (6, 'Fender Precision bass', 56000),
       (6, 'Fender Telecaster guitar', 78000),
       (7, 'Mapex drums', 54444),
       (7, 'Warwick bass', 35345),
       (7, 'ESP guitar', 45675),
       (8, 'Premier drums', 69943),
       (8, 'Music Man bass', 65444),
       (8, 'PRS guitar', 76436),
       (9, 'Ludwig drums', 68534),
       (9, 'Yamaha piano', 64219),
       (9, 'Rickenbacker bass', 76305),
       (10, 'Tama Starclassic drums', 21465),
       (10, 'Kiesel bass', 68395),
       (10, 'Kiesel guitar', 65324) ON CONFLICT DO NOTHING;

INSERT INTO Buyer (id, human_id, place_id, ban_status, warning_count, role_duty_id)
VALUES (1, 1, 1, FALSE, 2, 1),
       (2, 2, 2, FALSE, 0, 1),
       (3, 3, 3, FALSE, 1, 1),
       (4, 4, 4, FALSE, 0, 1),
       (5, 5, 5, FALSE, 1, 1);


INSERT INTO Place_to_Event (place_id, event_id)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 2),
       (5, 2) ON CONFLICT DO NOTHING;

INSERT INTO Place_to_Buyer (place_id, buyer_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 4),
       (2, 5) ON CONFLICT DO NOTHING;
