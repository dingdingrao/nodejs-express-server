import { Request, Response, NextFunction } from 'express';
import { creatUserLikePost, deleteUserLikePost } from './like.service';

/**
 * 点赞内容
 */
export const storeUserLikePost = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  // 准备数据
  const { postId } = request.params;
  const { id: userId } = request.user;

  // 点赞内容
  try {
    // 执行查询
    const data = await creatUserLikePost(Number(userId), Number(postId));

    // 做出响应
    response.status(201).send(data);
  } catch (error) {
    next(error);
  }
};

/**
 * 取消用户点赞内容
 */
export const destroyUserLikePost = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  // 准备数据
  const { postId } = request.params;
  const { id: userId } = request.user;

  // 取消点赞
  try {
    // 执行查询
    const data = await deleteUserLikePost(Number(userId), Number(postId));

    // 做出响应
    response.send(data);
  } catch (error) {
    next(error);
  }
};
