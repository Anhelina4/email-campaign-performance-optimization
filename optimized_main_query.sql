WITH
 --
 session_stats AS (
 SELECT
   acs.account_id,
   sp.operating_system
 FROM
   `DA.account_session` acs
 JOIN
   `DA.session_params` sp
 ON
   acs.ga_session_id = sp.ga_session_id
 JOIN
   `DA.account` a
 ON
   acs.account_id = a.id
 WHERE
   a.is_unsubscribed = 0)
SELECT
 session_stats.operating_system,
 COUNT(DISTINCT id_message_sent) AS sent_msg,
 COUNT(DISTINCT id_message_open) AS open_msg,
 COUNT(DISTINCT id_message_visit) AS vist_msg,
 COUNT(DISTINCT id_message_open) / COUNT(DISTINCT id_message_sent) * 100 AS open_rate,
 COUNT(DISTINCT id_message_visit) / COUNT(DISTINCT id_message_sent) * 100 AS click_rate,
 COUNT(DISTINCT id_message_visit) / COUNT(DISTINCT id_message_open) * 100 AS ctor,
FROM
 `Students.v_Bohdanova_email_stats_materialized_view` emails_stats
