CREATE TABLE location (
    id BIGINT NOT NULL AUTO_INCREMENT,
    house_id BIGINT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_location_house
        FOREIGN KEY (house_id)
        REFERENCES house(id),

    CONSTRAINT chk_location_latitude
        CHECK (latitude BETWEEN -90 AND 90),

    CONSTRAINT chk_location_longitude
        CHECK (longitude BETWEEN -180 AND 180),

    INDEX idx_location_house_id (house_id)
);
