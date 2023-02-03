import { Request, Response, NextFunction } from 'express';

/**
 * 过滤器
 */
export const filter = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  // 默认过滤
  request.filter = {
    name: 'default',
    sql: 'comment.parentId IS NULL',
  };

  // 下一步
  next();
};
