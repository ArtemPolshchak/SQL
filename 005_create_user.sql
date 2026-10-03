CREATE TABLE `user` (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(255) NOT NULL,
    bio TEXT NULL,
    password_hash VARCHAR(255) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    phone VARCHAR(30) NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    CONSTRAINT uq_user_email
        UNIQUE (email),

    INDEX idx_user_phone (phone)
);
