-- 方式一
-- 关联表
SELECT 
  comment.id,
  comment.comnent
  COUNT(
    DISINCT commentReply.id
  ) AS totalReplies
FROM
  comment
LEFT JOIN comment commentReply
  ON commentReply.parentId = comment.id
WHERE
  comment.id = 1

-- 方式二
-- 子查询
SELECT 
  comment.id,
  comment.comnent
  (
    SELECT 
      COUNT(reply.id)
    FROM comment reply
    WHERE 
      reply.parentId = comment.id
  ) AS totalReplies
FROM
  comment
WHERE
  comment.id = 1