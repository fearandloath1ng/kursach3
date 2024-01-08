INSERT INTO Product (product_name, product_status) 
VALUES ('Струны для электрогитары', 'in stock'),
       ('Струны для бас гитары', 'in stock'),
       ('Струны для акустической гитары', 'out of stock'),
       ('Медиатор тонкий', 'out of stock'),
       ('Медиатор средний', 'in stock'),
       ('Медиатор толстый', 'in stock'),
       ('Батарейка 9 вольт', 'in stock'),
       ('Барабанные палочки', 'in stock') ON CONFLICT DO NOTHING;

INSERT INTO Shop (shop_status)
VALUES ('opened'),
       ('opened'),
       ('opened'),
       ('closed'),
       ('opened'),
       ('opened'),
       ('opened'),
       ('opened'),
       ('closed'),
       ('opened') ON CONFLICT DO NOTHING;

INSERT INTO Product_Range (shop_id, product_id)
VALUES (1, 1),
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
       (10, 5) ON CONFLICT DO NOTHING;

INSERT INTO Human (human_name, human_age, sex, salary, job_state)
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

INSERT INTO Admin (human_id, sold_count, role_duty_id)
VALUES (7, 50, 2),
       (8, 87, 2),
       (11, 91, 2),
       (12, 54, 2),
       (13, 76, 2),
       (14, 63, 2),
       (15, 53, 2),
       (31, 50, 2),
       (32, 81, 2),
       (33, 77, 2) ON CONFLICT DO NOTHING;

INSERT INTO Master (human_id, fixed, not_fixed, role_duty_id)
VALUES (10, 56, 2, 3),
       (16, 37, 3, 3),
       (17, 59, 5, 3),
       (20, 88, 0, 3),
       (27, 67, 1, 3),
       (29, 54, 1, 3),
       (30, 70, 3, 3),
       (34, 73, 2, 3),
       (35, 50, 1, 3),
       (40, 80, 1, 3) ON CONFLICT DO NOTHING;

INSERT INTO Owner (human_id, cruelty, role_duty_id)
VALUES (1, 'happy', 1) ON CONFLICT DO NOTHING;

INSERT INTO Relax_Room (room_state)
VALUES ('opened'),
       ('opened'),
       ('opened'),
       ('opened'),
       ('closed'),
       ('opened'),
       ('opened'),
       ('opened'),
       ('opened'),
       ('opened') ON CONFLICT DO NOTHING;

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

INSERT INTO Event_Time (start, finish, start_date, finish_date)
VALUES  ('12:00', '15:30', '2024-01-08', '2024-01-08'),  
        ('09:00', '12:45', '2024-01-09', '2024-01-09'),
        ('18:30', '21:00', '2024-01-10', '2024-01-10');
        ('15:00','16:00','2024-05-04','2024-05-05'),
        ('10:00','11:15','2024-07-09','2024-07-10') ON CONFLICT DO NOTHING;

INSERT INTO Event (event_time_id, event_name, event_status)
VALUES (1, 'Sale', 'Ongoing'),
       (2, 'Cashback', 'finished'),
       (2, 'Lottery', 'finished'),
       (3, 'Talent Show', 'finished'),
       (4, 'Concert', 'finished'),
       (4, 'Party', 'finished'),
       (5, 'Secret Event', 'finished') ON CONFLICT DO NOTHING;

INSERT INTO Address (address_name)
VALUES (),
       () ON CONFLICT DO NOTHING;

INSERT INTO Equipment (address_id, equipment_name)
VALUES (,),
       (,) ON CONFLICT DO NOTHING;

INSERT INTO Buyer (human_id, place_id, room_id, role_duty_id)
VALUES (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4),
       (,,,4) ON CONFLICT DO NOTHING;

INSERT INTO Place (address_id, room_id, owner_id, admin_id, buyer_id, master_id, place_status, relax_room_id, shop_id)
VALUES (,,,,,,,,),
       (,,,,,,,,),
       (,,,,,,,,),
       (,,,,,,,,),
       (,,,,,,,,),
       (,,,,,,,,),
       (,,,,,,,,),
       (,,,,,,,,),
       (,,,,,,,,),
       (,,,,,,,,) ON CONFLICT DO NOTHING;

INSERT INTO Place_to_Event (place_id, event_id)
VALUES (,),
       (,) ON CONFLICT DO NOTHING;

INSERT INTO Place_to_Buyer (place_id, buyer_id)
VALUES (,),
       (,) ON CONFLICT DO NOTHING;