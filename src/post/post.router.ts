import express from 'express';
import * as postController from './post.controller';
import { authGuard, accessControl } from '../auth/auth.middleware';
import { sort, filter, paginate } from './post.middleware';
import { POSTS_PER_PAGE } from '../app/app.config';

const router = express.Router();

/**
 * 内容列表
 *
 * @route GET /posts
 * @group posts - Operations about post
 * @param {string} sort.query - 请输入用户名
 * @param {string} tag.query - 请输入用户名
 * @param {number} filter.query - 请输入密码
 * @param {number} page.query - 请输入合法邮箱
 * @param {number} size.query - 请输入合法邮箱
 * @param {number} user.query - 请输入合法邮箱
 * @param {number} action.query - 请输入合法邮箱
 * @returns {object} 200 - An array of user info
 * @returns {Error}  default - Unexpected error
 */
router.get(
  '/posts',
  sort,
  filter,
  paginate(POSTS_PER_PAGE),
  postController.index,
);

/**
 * 创建内容
 */
router.post('/posts', authGuard, postController.store);

/**
 * 更新内容
 */
router.patch(
  '/posts/:postId',
  authGuard,
  accessControl({ possession: true }),
  postController.update,
);

/**
 * 删除内容
 */
router.delete(
  '/posts/:postId',
  authGuard,
  accessControl({ possession: true }),
  postController.destory,
);

/**
 * 添加内容标签
 */
router.post(
  '/posts/:postId/tag',
  authGuard,
  accessControl({ possession: true }),
  postController.storePostTag,
);

/**
 * 移除内容表情去
 */
router.delete(
  '/posts/:postId/tag',
  authGuard,
  accessControl({ possession: true }),
  postController.destroyPostTag,
);

/**
 * 单个内容
 */
router.get('/post/:postId', postController.show);

/**
 * 导出路由
 */
export default router;
