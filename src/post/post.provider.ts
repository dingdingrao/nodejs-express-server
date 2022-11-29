/**
 * 查询片段
 */
export const sqlFrament = {
  user: `
    JSON_OBJECT(
      'id', user.id,
      'name', user.name
    ) as user
  `,
  leftJoinUser: `
    ON user.id = post.userId
  `,
};
