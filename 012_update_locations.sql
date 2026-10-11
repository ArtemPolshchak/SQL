-- 1. Add new column
ALTER TABLE location
    ADD COLUMN coordinates POINT NULL AFTER house_id;

-- 2. Migrate existing coordinates
UPDATE location
SET coordinates = POINT(longitude, latitude);

-- 3. Remove old columns and constraints
--    Add new constraints and spatial index
ALTER TABLE location
    DROP CONSTRAINT chk_location_latitude,
    DROP CONSTRAINT chk_location_longitude,

    MODIFY COLUMN coordinates POINT NOT NULL,

    DROP COLUMN latitude,
    DROP COLUMN longitude,

    ADD CONSTRAINT chk_location_coordinates
        CHECK (
            ST_X(coordinates) BETWEEN -180 AND 180
            AND ST_Y(coordinates) BETWEEN -90 AND 90
        ),

    ADD SPATIAL INDEX idx_location_coordinates (coordinates);
