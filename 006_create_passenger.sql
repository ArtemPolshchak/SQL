CREATE TABLE passenger (
    id BIGINT NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    average_rating DECIMAL(3,2) NOT NULL DEFAULT 0.00,
    rating_count INT NOT NULL DEFAULT 0,

    PRIMARY KEY (id),

    CONSTRAINT fk_passenger_user
        FOREIGN KEY (id)
        REFERENCES `user`(id),

    CONSTRAINT chk_passenger_average_rating
        CHECK (average_rating BETWEEN 0 AND 5),

    CONSTRAINT chk_passenger_rating_count
        CHECK (rating_count >= 0)
);
