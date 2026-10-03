CREATE TABLE `operator` (
    id BIGINT NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    employee_number VARCHAR(100) NOT NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_operator_user
        FOREIGN KEY (id)
        REFERENCES `user`(id),

    CONSTRAINT uq_operator_employee_number
        UNIQUE (employee_number)
);
