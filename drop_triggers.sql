DROP TRIGGER IF EXISTS ban_buyer_trigger ON Buyer;
DROP TRIGGER IF EXISTS stop_work_admin_trigger ON Admin;
DROP TRIGGER IF EXISTS stop_work_master_trigger ON Master;
DROP TRIGGER IF EXISTS sale_trigger ON Event;
DROP TRIGGER IF EXISTS sale_equipment_trigger ON Equipment;
DROP TRIGGER IF EXISTS owner_mentality_trigger ON Admin;
DROP TRIGGER IF EXISTS update_place_status_on_master_update_trigger ON Master;


DROP FUNCTION IF EXISTS ban_buyer;
DROP FUNCTION IF EXISTS warning;
DROP FUNCTION IF EXISTS change_state_admin;
DROP FUNCTION IF EXISTS stop_work_admin;
DROP FUNCTION IF EXISTS change_state_master;
DROP FUNCTION IF EXISTS stop_work_master;
DROP FUNCTION IF EXISTS change_event;
DROP FUNCTION IF EXISTS sale;
DROP FUNCTION IF EXISTS sale_equipment;
DROP FUNCTION IF EXISTS owner_mentality;
DROP FUNCTION IF EXISTS update_place_status_on_master_update;
DROP FUNCTION IF EXISTS open_close_relaxroom;
DROP FUNCTION IF EXISTS open_close_shop;
DROP FUNCTION IF EXISTS open_close_place;
