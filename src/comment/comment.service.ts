import { connection } from '../app/database/mysql';
import { CommentModel } from './comment.model';

/**
 * 创建评论
 */
export const creatComment = async (comment: CommentModel) => {
  // 准备数据
  const statement = `
    INSERT INTO comment
    SET ?
  `;

  // 执行查询
  const [data] = await connection.promise().query(statement, comment);

  // 提供数据
  return data;
};
