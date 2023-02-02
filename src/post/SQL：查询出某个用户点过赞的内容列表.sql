-----------------------------
# LEFT JOIN: 包含为空的数据
# INNER JOIN: 排除为空的数据
-----------------------------
SELECT
  *
FROM
  post
INNER JOIN user_like_post
  ON user_like_post.userId = post.id
WHERE 
  user_like_post.userId = ?