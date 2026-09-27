CREATE TABLE street (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT 'Unique street identifier',
    name VARCHAR(100) NOT NULL COMMENT 'Street name',
    drivable BOOLEAN NOT NULL COMMENT 'Whether vehicles can drive on this street',
    PRIMARY KEY (id)
);
