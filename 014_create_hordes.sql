CREATE TABLE hordes (
    id INT PRIMARY KEY,
    cross1 INT NOT NULL,
    cross2 INT NOT NULL,
    distance DOUBLE NOT NULL,
    is_bridge BOOLEAN NOT NULL DEFAULT FALSE,

    FOREIGN KEY (cross1) REFERENCES `cross`(id),
    FOREIGN KEY (cross2) REFERENCES `cross`(id)
);
