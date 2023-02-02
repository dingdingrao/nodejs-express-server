import { Request, Response, NextFunction } from 'express';
import _ from 'lodash';
import {
  creatPost,
  creatPostTag,
  deletePost,
  deletePostTag,
  getPosts,
  postHasTags,
  updatePost,
  getPostsTotalCount,
  getPostById,
} from './post.service';
import { TagModel } from 'src/tag/tag.model';
import { creatTag, getTagByName } from '../tag/tag.service';
/**
 * 内容列表
 */
export const index = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  try {
    // 统计内容数据
    const totalCount = await getPostsTotalCount({ filter: request.filter });

    // 设置响应头
    response.header('X-Total-Count', totalCount);
  } catch (error) {
    next(error);
  }

  try {
    const posts = await getPosts({
      sort: request.sort,
      filter: request.filter,
      pagination: request.pagination,
    });

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
  const { id: userId } = request.user;

  // 创建内容
  try {
    const data = await creatPost({ title, content, userId });

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

/**
 * 删除内容
 */
export const destory = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  // 获取内容 ID
  const { postId } = request.params;

  // 删除内容
  try {
    const data = await deletePost(parseInt(postId, 10));

    // 响应
    response.send(data);
  } catch (error) {
    next(error);
  }
};

/**
 * 添加内容表情去
 */
export const storePostTag = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  // 准备数据
  const { postId } = request.params;
  const { name } = request.body;

  let tag: TagModel;

  // 查找标签
  try {
    tag = await getTagByName(name);
  } catch (error) {
    return next(error);
  }

  // 找到标签，验证标签
  if (tag) {
    try {
      const postTag = await postHasTags(parseInt(postId!, 10), tag.id!);

      if (postTag) return next(new Error('POST_ALREADY_HAS_THIS_TAG'));
    } catch (error) {
      return next(error);
    }
  }

  // 没有找到标签，创建这个标签
  if (!tag) {
    try {
      const data = await creatTag({ name });

      tag = { id: data.insertId };
    } catch (error) {
      return next(error);
    }
  }

  // 给内容搭上标签
  try {
    await creatPostTag(parseInt(postId!, 10), tag.id!);

    response.sendStatus(201);
  } catch (error) {
    return next(error);
  }
};

/**
 * 移除内容标签
 */
export const destroyPostTag = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  // 准备数据
  const { postId } = request.params;
  const { tagId } = request.body;

  // 移除内容标签
  try {
    await deletePostTag(parseInt(postId, 10), tagId);

    response.sendStatus(200);
  } catch (error) {
    next(error);
  }
};

/**
 * 单个内容
 */
export const show = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  // 准备数据
  const { postId } = request.params;

  // 调取内容
  try {
    // 执行查询
    const data = await getPostById(Number(postId));

    // 响应
    response.send(data);
  } catch (error) {
    next(error);
  }
};
