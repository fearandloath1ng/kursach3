-- забанить покупателя если много предупреждений
CREATE OR REPLACE FUNCTION warning(buyer_id INT, number INTEGER)
    RETURNS VOID AS $$
BEGIN
    UPDATE Buyer 
    SET warning_count = warning_count + number
    WHERE id = buyer_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ban_buyer(buyer_id INT)
    RETURNS TRIGGER AS $$
BEGIN
    DECLARE current_value INT;

    SELECT warning_count INTO current_value
    FROM Buyer
    WHERE id = buyer_id;

    IF current_value > 5 THEN
        UPDATE Buyer
        SET ban_status = TRUE
        WHERE id = buyer_id;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER ban_buyer_trigger
    AFTER UPDATE ON Buyer
    FOR EACH ROW
EXECUTE FUNCTION ban_buyer();


-- прекращение работы сотрудников
CREATE OR REPLACE FUNCTION change_state_admin(admin_id INT)
    RETURNS VOID AS $$
BEGIN
    UPDATE Admin
    SET state_work = FALSE
    WHERE id = admin_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION stop_work_admin(admin_id INT)
    RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT state_work FROM Admin WHERE id = admin_id) = FALSE THEN
        DELETE FROM Admin WHERE id = admin_id;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER stop_work_admin_trigger
    AFTER UPDATE ON Admin 
    FOR EACH ROW
EXECUTE FUNCTION stop_work_admin();



CREATE OR REPLACE FUNCTION change_state_master(master_id INT)
    RETURNS VOID AS $$
BEGIN
    UPDATE Master
    SET state_work = FALSE
    WHERE id = master_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION stop_work_master(master_id INT)
    RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT state_work FROM Master WHERE id = master_id) = FALSE THEN
        DELETE FROM Master WHERE id = master_id;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER stop_work_master_trigger
    AFTER UPDATE ON Master 
    FOR EACH ROW
EXECUTE FUNCTION stop_work_master();


-- распродажа
CREATE OR REPLACE FUNCTION change_event()
    RETURNS VOID AS $$
BEGIN
    IF (SELECT event_status FROM Event WHERE event_name = 'Sale') = 'finished' THEN
        UPDATE Event
        SET event_status = 'Ongoing'
    ELSE
        UPDATE Event 
        SET event_status = 'finished'
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION sale()
    RETURNS TRIGGER AS $$
BEGIN
    IF NEW.event_status = 'Ongoing' AND OLD.event_status != 'Ongoing' AND NEW.event_name = 'Sale' THEN
    UPDATE Product
    SET product_price = product_price * (9/10) 
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER sale_trigger
    AFTER UPDATE ON Event
    FOR EACH ROW
EXECUTE FUNCTION sale();

CREATE OR REPLACE FUNCTION sale_equipment()
    RETURNS TRIGGER AS $$
BEGIN
    IF NEW.event_status = 'Ongoing' AND OLD.event_status != 'Ongoing' AND NEW.event_name = 'Sale' THEN
    UPDATE Equipment
    SET product_price = product_price * (8/10) 
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER sale_trigger
    AFTER UPDATE ON Event
    FOR EACH ROW
EXECUTE FUNCTION sale_equipment();


-- настроение владельца
CREATE OR REPLACE FUNCTION owner_mentality()
    RETURNS TRIGGER AS $$
BEGIN
    IF NEW.sold_count <= 51 THEN
    UPDATE Owner
    SET cruelty = 'angry'
    ELSE 
        IF NEW.sold_count > 51 AND NEW.sold_count < 65 THEN
        UPDATE Owner
        SET cruelty = 'modest'
        ELSE
            UPDATE Owner
            SET cruelty = 'happy'
        END IF; 
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER owner_mentality_trigger
    AFTER UPDATE ON Admin
EXECUTE FUNCTION owner_mentality();


-- починка оборудования
CREATE OR REPLACE FUNCTION update_place_status_on_master_update()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.not_fixed > NEW.fixed THEN
        UPDATE Place
        SET place_status = 'closed'
        WHERE id IN (SELECT id FROM Place WHERE master_id = NEW.id);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER pdate_place_status_on_master_update_trigger
AFTER UPDATE ON Master
FOR EACH ROW
EXECUTE FUNCTION update_place_status_on_master_update();



CREATE OR REPLACE FUNCTION open_close_place(place_id)
RETURNS VOID AS $$
BEGIN
    SELECT place_status INTO current_state
    FROM Place
    WHERE id = place_id;

    IF current_state = 'closed' THEN
        UPDATE Place
        SET place_status = 'opened'
        WHERE id = place_id;
    ELSE
        UPDATE Place
        SET place_status = 'closed'
        WHERE id = place_id;
    END IF;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION open_close_shop(shop_id)
RETURNS VOID AS $$
BEGIN
    SELECT shop_status INTO current_state
    FROM Shop
    WHERE id = shop_id;

    IF current_state = 'closed' THEN
        UPDATE Shop
        SET shop_status = 'opened'
        WHERE id = shop_id;
    ELSE
        UPDATE Shop
        SET shop_status = 'closed'
        WHERE id = shop_id;
    END IF;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION open_close_relaxroom(relax_room_id)
RETURNS VOID AS $$
BEGIN
    SELECT room_state INTO current_state
    FROM Relax_Room
    WHERE id = relax_room_id;

    IF current_state = 'closed' THEN
        UPDATE Relax_Room
        SET room_state = 'opened'
        WHERE id = relax_room_id;
    ELSE
        UPDATE Relax_Room
        SET room_state = 'closed'
        WHERE id = relax_room_id;
    END IF;
END;
$$ LANGUAGE plpgsql;
