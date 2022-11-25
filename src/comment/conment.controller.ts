import { Request, Response, NextFunction } from 'express';
import { creatComment } from './comment.service';

/**
 * 发表评论
 */
export const store = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  // 准备数据
  const { id: userId } = request.user;
  const { content, posetId } = request.body;

  const comment = {
    content,
    posetId,
    userId,
  };

  try {
    // 保存数据
    const data = await creatComment(comment);

    // 做出响应
    response.status(201).send(data);
  } catch (error) {
    next(error);
  }
};
