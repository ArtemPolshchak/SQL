CREATE TABLE house (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT 'Unique house identifier',
    street_id BIGINT NOT NULL COMMENT 'Identifier of the street where the house is located',
    house_number VARCHAR(20) NOT NULL COMMENT 'House number, for example 18 or 18A',
    PRIMARY KEY (id),
    CONSTRAINT fk_house_street
        FOREIGN KEY (street_id) REFERENCES street(id)
);
