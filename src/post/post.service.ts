import exp from 'constants';
import { connection } from '../app/database/mysql';
import { PostModel } from './post.model';
import { sqlFragment } from './post.provider';

/**
 * 获取内容列表
 */
interface GetPostsOptions {
  sort?: string;
}

export const getPosts = async (options: GetPostsOptions) => {
  const { sort } = options;

  const statement = `
    SELECT
      post.id,
      post.title,
      post.content,
      ${sqlFragment.user},
      ${sqlFragment.totalComments},
      ${sqlFragment.file},
      ${sqlFragment.tags}
    FROM post
    LEFT JOIN user
      ${sqlFragment.leftJoinUser}
      ${sqlFragment.leftJoinOneFile}
      ${sqlFragment.leftJoinTag}
      GROUP BY post.id
      ORDER BY ${sort}
  `;

  const [data] = await connection.promise().query(statement);

  return data;
};

/**
 * 创建内容
 */
export const creatPost = async (post: PostModel) => {
  // 准备查询
  const statement = `
    INSERT INTO post 
    SET ?
  `;

  // 执行查询
  // post参数是SQL中 ? 的值
  const [data] = await connection.promise().query(statement, post);

  // 提供数据
  return data;
};

/**
 * 更新内容
 */
export const updatePost = async (postId: number, post: PostModel) => {
  // 准备查询
  const statement = `
    UPDATE post
    SET ?
    WHERE id = ?
  `;

  // 执行查询
  const [data] = await connection.promise().query(statement, [post, postId]);

  // 提供数据
  return data;
};

/**
 * 删除内容
 */
export const deletePost = async (postId: number) => {
  // 准备查询
  const statement = `
    DELETE FROM post
    WHERE id = ?
  `;

  // 执行查询
  const [data] = await connection.promise().query(statement, postId);

  // 提供数据
  return data;
};
