-- забанить покупателя если много предупреждений
CREATE OR REPLACE FUNCTION warning(buyer_id INT, number INTEGER)
    RETURNS VOID AS $$
BEGIN
    UPDATE Buyer 
    SET warning_count = warning_count + number
    WHERE id = buyer_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ban_buyer()
    RETURNS TRIGGER AS $$
BEGIN
    IF OLD.warning_count > 5 THEN
        NEW.ban_status := TRUE;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER ban_buyer_trigger
BEFORE UPDATE ON Buyer
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

CREATE OR REPLACE FUNCTION stop_work_admin()
    RETURNS TRIGGER AS $$
BEGIN
    IF NEW.state_work = FALSE THEN
        DELETE FROM Admin WHERE id = NEW.id;
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

CREATE OR REPLACE FUNCTION stop_work_master()
    RETURNS TRIGGER AS $$
BEGIN
    IF NEW.state_work = FALSE THEN
        DELETE FROM Master WHERE id = NEW.id;
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
        SET event_status = 'Ongoing';
    ELSE
        UPDATE Event 
        SET event_status = 'finished';
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION sale()
    RETURNS TRIGGER AS $$
BEGIN
    IF NEW.event_status = 'Ongoing' AND OLD.event_status != 'Ongoing' AND NEW.event_name = 'Sale' THEN
        UPDATE Product
        SET product_price = product_price * (9/10);
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
        SET product_price = product_price * (8/10);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER sale_equpipment_trigger
    AFTER UPDATE ON Event
    FOR EACH ROW
EXECUTE FUNCTION sale_equipment();


-- настроение владельца
CREATE OR REPLACE FUNCTION owner_mentality()
    RETURNS TRIGGER AS $$
BEGIN
    IF NEW.sold_count <= 51 THEN
        UPDATE Owner
        SET cruelty = 'angry';
    ELSE 
        IF NEW.sold_count > 51 AND NEW.sold_count < 65 THEN
            UPDATE Owner
            SET cruelty = 'modest';
        ELSE
            UPDATE Owner
            SET cruelty = 'happy';
        END IF; 
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER owner_mentality_trigger
    AFTER UPDATE ON Admin
EXECUTE FUNCTION owner_mentality();


-- починка оборудования
CREATE OR REPLACE FUNCTION update_place_state_on_master_update()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.not_fixed > NEW.fixed THEN
        UPDATE Place
        SET place_state = 'closed'
        WHERE id IN (SELECT id FROM Place WHERE master_id = NEW.id);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_place_state_on_master_update_trigger
AFTER UPDATE ON Master
FOR EACH ROW
EXECUTE FUNCTION update_place_state_on_master_update();



CREATE OR REPLACE FUNCTION open_close_place(place_id INTEGER)
RETURNS VOID AS $$
DECLARE
    current_state VARCHAR(255); 
BEGIN
    SELECT place_state INTO current_state
    FROM Place
    WHERE id = place_id;

    IF current_state = 'closed' THEN
        UPDATE Place
        SET place_state = 'opened'
        WHERE id = place_id;
    ELSE
        UPDATE Place
        SET place_state = 'closed'
        WHERE id = place_id;
    END IF;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION open_close_shop(shop_id INTEGER)
RETURNS VOID AS $$
DECLARE
    current_state VARCHAR(255); 
BEGIN
    SELECT shop_state INTO current_state
    FROM Shop
    WHERE id = shop_id;

    IF current_state = 'closed' THEN
        UPDATE Shop
        SET shop_state = 'opened'
        WHERE id = shop_id;
    ELSE
        UPDATE Shop
        SET shop_state = 'closed'
        WHERE id = shop_id;
    END IF;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION open_close_relaxroom(relax_room_id INTEGER)
RETURNS VOID AS $$
DECLARE
    current_state VARCHAR(255); 
BEGIN
    SELECT room_status INTO current_state
    FROM Relax_Room
    WHERE id = relax_room_id;

    IF current_state = 'closed' THEN
        UPDATE Relax_Room
        SET room_status = 'opened'
        WHERE id = relax_room_id;
    ELSE
        UPDATE Relax_Room
        SET room_status = 'closed'
        WHERE id = relax_room_id;
    END IF;
END;
$$ LANGUAGE plpgsql;
