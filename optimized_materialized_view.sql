SELECT
   es.id_account AS id_account_sent,
   es.id_message AS id_message_sent,
   eo.id_message AS id_message_open,
   ev.id_message AS id_message_visit
 FROM
   `DA.email_sent` es
 LEFT JOIN
   `DA.email_open` eo
 ON
   es.id_message = eo.id_message
 LEFT JOIN
   `DA.email_visit` ev
 ON
   es.id_message = ev.id_message
