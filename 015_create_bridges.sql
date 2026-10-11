CREATE TABLE bridges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    horde_id INT NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,

    CONSTRAINT fk_bridges_hordes
        FOREIGN KEY (horde_id)
        REFERENCES hordes(id)
);
