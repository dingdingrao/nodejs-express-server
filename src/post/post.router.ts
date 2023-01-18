import express from 'express';
import * as postController from './post.controller';
import { authGuard, accessControl } from '../auth/auth.middleware';
import { sort } from './post.middleware';

const router = express.Router();

/**
 * 内容列表
 */
router.get('/posts', sort, postController.index);

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
 * 导出路由
 */
export default router;
