# SQL Query Bug: Unexpected COUNT(*) Results with NULL Values

This repository demonstrates a subtle bug in an SQL query that involves `COUNT(*)`, `GROUP BY`, and `HAVING`. The bug arises from how `NULL` values are handled in the grouping and aggregation process.

## Description

The original query incorrectly handles categories with `NULL` values, potentially miscounting products and returning unexpected results.

## Solution

The provided solution addresses the issue by explicitly handling `NULL` values in the `category` column using `IS NULL` condition. This ensures that the counting accurately reflects the number of products within each defined category.