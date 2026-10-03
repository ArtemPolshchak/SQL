CREATE TABLE trips (
    id BIGINT NOT NULL AUTO_INCREMENT,
    passenger_id BIGINT NOT NULL,
    driver_id BIGINT NOT NULL,
    start_location_id BIGINT NOT NULL,
    end_location_id BIGINT NOT NULL,
    status VARCHAR(30) NOT NULL,
    start_time DATETIME NULL,
    end_time DATETIME NULL,
    price DECIMAL(10,2) NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_trips_passenger
        FOREIGN KEY (passenger_id)
        REFERENCES passenger(id),

    CONSTRAINT fk_trips_driver
        FOREIGN KEY (driver_id)
        REFERENCES driver(id),

    CONSTRAINT fk_trips_start_location
        FOREIGN KEY (start_location_id)
        REFERENCES location(id),

    CONSTRAINT fk_trips_end_location
        FOREIGN KEY (end_location_id)
        REFERENCES location(id),

    CONSTRAINT chk_trips_price
        CHECK (price IS NULL OR price >= 0),

    INDEX idx_trips_passenger_start_time
        (passenger_id, start_time),

    INDEX idx_trips_driver_start_time
        (driver_id, start_time),

    INDEX idx_trips_status
        (status)
);
