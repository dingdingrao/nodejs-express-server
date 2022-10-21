import { Request, Response, NextFunction } from 'express';
import _ from 'lodash';
import { creatPost, getPosts, updatePost } from './post.service';

/**
 * 内容列表
 */
export const index = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  try {
    const posts = await getPosts();

    // 返回数据
    response.send(posts);
  } catch (error) {
    next(error);
  }
};

/**
 * 创建内容
 */
export const store = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  // 准备数据
  const { title, content } = request.body;

  // 创建内容
  try {
    const data = await creatPost({ title, content });

    // 响应
    response.status(201).send(data);
  } catch (error) {
    next(error);
  }
};

/**
 * 更新内容
 */
export const update = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  // 获取内容 ID
  const { postId } = request.params;

  // 准备数据
  const post = _.pick(request.body, ['title', 'content']);

  // 更新内容
  try {
    const data = await updatePost(parseInt(postId, 10), post);

    // 响应
    response.send(data);
  } catch (error) {
    next(error);
  }
};
