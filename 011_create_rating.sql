CREATE TABLE rating (
    id BIGINT NOT NULL AUTO_INCREMENT,
    trip_id BIGINT NOT NULL,
    from_user_id BIGINT NOT NULL,
    to_user_id BIGINT NOT NULL,
    rating TINYINT NOT NULL,
    feedback_text TEXT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    CONSTRAINT fk_rating_trip
        FOREIGN KEY (trip_id)
        REFERENCES trips(id),

    CONSTRAINT fk_rating_from_user
        FOREIGN KEY (from_user_id)
        REFERENCES `user`(id),

    CONSTRAINT fk_rating_to_user
        FOREIGN KEY (to_user_id)
        REFERENCES `user`(id),

    CONSTRAINT chk_rating_value
        CHECK (rating BETWEEN 1 AND 5),

    CONSTRAINT uq_rating_trip_from_user
        UNIQUE (trip_id, from_user_id),

    INDEX idx_rating_to_user_created_at
        (to_user_id, created_at)
);
