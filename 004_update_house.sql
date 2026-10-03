ALTER TABLE house
    ADD CONSTRAINT uq_house_street_number
        UNIQUE (street_id, house_number);
