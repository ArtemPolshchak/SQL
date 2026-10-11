CREATE PROCEDURE find_routes(
    IN p_start INT,
    IN p_finish INT
)
WITH edges AS (

    -- Roads in both directions
    SELECT
        id,
        cross1 AS from_node,
        cross2 AS next_node,
        distance,
        is_bridge
    FROM hordes

    UNION ALL

    SELECT
        id,
        cross2 AS from_node,
        cross1 AS next_node,
        distance,
        is_bridge
    FROM hordes
)

SELECT DISTINCT
    p_start AS start_cross,
    p_finish AS finish_cross,

    CONCAT_WS(' -> ',
        p_start,
        h1.next_node,
        h2.next_node,
        h3.next_node,
        h4.next_node,
        h5.next_node
    ) AS route,

    b.name AS bridge_name,

    COALESCE(h1.distance, 0) +
    COALESCE(h2.distance, 0) +
    COALESCE(h3.distance, 0) +
    COALESCE(h4.distance, 0) +
    COALESCE(h5.distance, 0) AS distance_m

FROM edges h1

LEFT JOIN edges h2
    ON h2.from_node = h1.next_node
    AND h2.id <> h1.id
    AND h1.next_node <> p_finish
    AND h2.next_node <> p_start

LEFT JOIN edges h3
    ON h3.from_node = h2.next_node
    AND h3.id NOT IN (h1.id, h2.id)
    AND h2.next_node <> p_finish
    AND h3.next_node NOT IN (p_start, h1.next_node)

LEFT JOIN edges h4
    ON h4.from_node = h3.next_node
    AND h4.id NOT IN (h1.id, h2.id, h3.id)
    AND h3.next_node <> p_finish
    AND h4.next_node NOT IN (
        p_start, h1.next_node, h2.next_node
    )

LEFT JOIN edges h5
    ON h5.from_node = h4.next_node
    AND h5.id NOT IN (h1.id, h2.id, h3.id, h4.id)
    AND h4.next_node <> p_finish
    AND h5.next_node NOT IN (
        p_start, h1.next_node, h2.next_node, h3.next_node
    )

JOIN bridges b
    ON b.horde_id = CASE
        WHEN h1.is_bridge = 1 THEN h1.id
        WHEN h2.is_bridge = 1 THEN h2.id
        WHEN h3.is_bridge = 1 THEN h3.id
        WHEN h4.is_bridge = 1 THEN h4.id
        WHEN h5.is_bridge = 1 THEN h5.id
    END

WHERE
    h1.from_node = p_start
    AND p_start <> p_finish

    -- Destination must be the last intersection
    AND p_finish = COALESCE(
        h5.next_node,
        h4.next_node,
        h3.next_node,
        h2.next_node,
        h1.next_node
    )

    -- Exactly one bridge in the route
    AND (
        COALESCE(h1.is_bridge, 0) +
        COALESCE(h2.is_bridge, 0) +
        COALESCE(h3.is_bridge, 0) +
        COALESCE(h4.is_bridge, 0) +
        COALESCE(h5.is_bridge, 0)
    ) = 1

ORDER BY distance_m ASC, route ASC

LIMIT 5;

--call function example
--CALL find_routes(1, 11);
