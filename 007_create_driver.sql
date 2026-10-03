CREATE TABLE driver (
    id BIGINT NOT NULL,
    licence_number VARCHAR(100) NOT NULL,
    licence_expiry DATE NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    average_rating DECIMAL(3,2) NOT NULL DEFAULT 0.00,
    rating_count INT NOT NULL DEFAULT 0,

    PRIMARY KEY (id),

    CONSTRAINT fk_driver_user
        FOREIGN KEY (id)
        REFERENCES `user`(id),

    CONSTRAINT uq_driver_licence_number
        UNIQUE (licence_number),

    CONSTRAINT chk_driver_average_rating
        CHECK (average_rating BETWEEN 0 AND 5),

    CONSTRAINT chk_driver_rating_count
        CHECK (rating_count >= 0),

    INDEX idx_driver_is_active (is_active)
);
