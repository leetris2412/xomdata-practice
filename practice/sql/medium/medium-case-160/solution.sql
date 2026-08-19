-- Xom Data · Delivery performance by size class
-- Problem: https://xomdata.com/practice/medium-case-160
-- Solved: 2026-08-19

WITH
  CTE_success AS (
    SELECT
      vehicle_type,
      capacity_tons,
      COUNT(s.id) AS shipment_count,
      CASE
        WHEN capacity_tons >= 10 THEN 'Large Truck'
        WHEN capacity_tons >= 5 THEN 'Medium Truck'
        ELSE 'Small Truck'
      END AS size_class,
      sum(
        CASE
          WHEN d.results = 'success' THEN 1
          ELSE 0
        END
      ) AS delivered
    FROM
      trucks tr
      JOIN shipments s ON tr.id = s.truck_id
      LEFT JOIN deliveries d ON s.id = d.shipment_id
    GROUP BY
      vehicle_type,
      capacity_tons
  )
SELECT
  vehicle_type,
  capacity_tons,
  shipment_count,
  size_class,
  delivered,
  ROUND(delivered * 100.0 / shipment_count, 2) AS delivery_rate,
  RANK() OVER (
    PARTITION BY
      size_class
    ORDER BY
      ROUND(delivered * 100.0 / shipment_count, 2) DESC
  ) AS rank_in_size
FROM
  CTE_success
ORDER BY
  size_class,
  rank_in_size,
  vehicle_type
