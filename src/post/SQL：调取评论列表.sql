SELECT 
  *
FROM
  comment
WHERE
  comment.postId = ?
  # comment.userId = ?
AND
  comment.parentId IS NOT NULL