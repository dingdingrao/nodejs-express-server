import { connection } from 'src/app/database/mysql';
import { TagModel } from './tag.model';

/**
 * 创建标签
 */
export const creatTag = async (tag: TagModel) => {
  // 准备查询
  const statement = `
    INSERT INTO tag
    SET ?
  `;

  // 执行查询
  const [data] = await connection.promise().query(statement, tag);

  // 提供数据
  return data as any;
};
