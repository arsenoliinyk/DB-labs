USE Oliinyk_7_63;

DROP TRIGGER IF EXISTS provide_format;
DELIMITER //
CREATE TRIGGER provide_format
    before INSERT
    on family_value
    for EACH ROW
BEGIN
    if (new.code_in_catalog_of_value not rlike '[A,M,Z][0-9]{5}[A-Za-z]{2}') then
        signal sqlstate '45000'
            set message_text = 'Сode in catalog doesn\'t match regex';
    end if;
end //
DELIMITER ;