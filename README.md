# email-campaign-performance-optimization

> Redesigned a slow, nested-subquery email funnel report into a materialized view + CTE architecture, cutting query execution time by 50% and bytes shuffled by ~30%.

## Tools & Technologies

- **SQL (BigQuery)**
- **Google BigQuery**

## Key Findings

- **Execution time reduced by 50%** after the refactor
- **Bytes shuffled dropped from 57.57 MB to 40.4 MB** - a ~30% reduction in data processed
- Root cause confirmed: original query pulled 12+ columns via `SELECT *` in three subqueries before any filtering, forcing full scans on every run
- Moving the stable three-table email join into a materialized view eliminated repeated computation across all downstream queries
- Applying `is_unsubscribed = 0` inside the `session_stats` CTE (before the final join) reduced the row count entering aggregation

## Before & After
### Before
<img width="546" height="234" alt="Screenshot 2026-06-08 at 12 33 13" src="https://github.com/user-attachments/assets/b6381d78-11d0-4d7b-82a9-343428efbc95" />

### After
<img width="477" height="100" alt="Screenshot 2026-06-08 at 12 33 48" src="https://github.com/user-attachments/assets/bf7bf159-2afa-4920-aec6-79360ee76df4" />

