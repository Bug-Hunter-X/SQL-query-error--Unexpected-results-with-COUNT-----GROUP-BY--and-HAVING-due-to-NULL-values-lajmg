The solution involves explicitly handling `NULL` categories using a `CASE` expression or similar technique within the `COUNT(*)` aggregate function or by filtering them out before grouping:

**Option 1: Using CASE**

```sql
SELECT
    CASE
        WHEN category IS NULL THEN 'NULL Category'
        ELSE category
    END AS category,
    COUNT(*) AS num_products
FROM products
GROUP BY CASE
    WHEN category IS NULL THEN 'NULL Category'
    ELSE category
    END
HAVING COUNT(*) > 1;
```

**Option 2: Filtering NULLs and then grouping (More efficient in most systems):**

```sql
SELECT category, COUNT(*) AS num_products
FROM products
WHERE category IS NOT NULL
GROUP BY category
HAVING COUNT(*) > 1;
```

The second option is generally more efficient because it reduces the number of rows involved in the aggregation.  The first option is more useful if you need to explicitly show NULL values separately.  Choose the option that best fits your reporting requirements.