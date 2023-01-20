/**
 * 查询片段
 */
export const sqlFragment = {
  user: `
    JSON_OBJECT(
      'id', user.id,
      'name', user.name
    ) AS user
  `,
  leftJoinUser: `
    LEFT JOIN user
      ON user.id = post.userId
  `,
  totalComments: `
    (
      SELECT
        COUNT(comment.id)
      FROM
        comment
      WHERE
        comment.postId = post.id
    ) AS totalComments
  `,
  leftJoinOneFile: `
    LEFT JOIN LATERAL (
      SELECT * 
      FROM file
      WHERE file.postId = post.id
      ORDER BY file.id DESC
      LIMIT 1
    ) AS file ON post.id = file.postId
  `,
  file: `
    CAST(
      IF(
        COUNT(file.id),
        GROUP_CONCAT(
          DISTINCT JSON_OBJECT(
            'id', file.id,
            'width', file.width,
            'height', file.height
          )
        ),
        NULL
      ) AS JSON
    ) AS file
  `,
  leftJoinTag: `
    LEFT JOIN 
      post_tag ON post_tag.postId = post.id
    LEFT JOIN 
      tag ON post_tag.tagId = tag.id
  `,
  tags: `
    CAST(
      IF(
        COUNT(tag.id),
        CONCAT(
          '[',
            GROUP_CONCAT(
              DISTINCT JSON_OBJECT(
                'id', tag.id,
                'name', tag.name
              )
            ),
          ']'
        ),
        NULL
      ) AS JSON
    ) AS tags
  `,
};

// DISTINCT: 去重
// JSON_OBJECT: 组织 JSON 对象
// AS: 别名
// ON: 条件
// CAST: 转换数据类型
// ORDER BY: 排序
// LIMIT: 限制
// IF: 判断
// COUNT: 统计
// CONCAT: 将多个字符串连接成一个字符串
// GROUP_CONCAT: 分组
// LEFT JOIN: 左关联
// LATERAL: 横向派生表 （MySQL 8.0.14 +）
