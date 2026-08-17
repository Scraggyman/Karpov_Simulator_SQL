SELECT courier_id,
       order_id,
       action,
       time
FROM   courier_actions
ORDER BY courier_id asc, action asc, time desc limit 1000;