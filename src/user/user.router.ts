import express from 'express';
import { authGuard } from '../auth/auth.middleware';
import * as userController from './user.controller';
import {
  validateUserData,
  hasPassword,
  validateUpdateUserData,
} from './user.middleware';

const router = express.Router();

/**
 * 创建用户
 */
router.post('/users', validateUserData, hasPassword, userController.store);

/**
 * 用户账户
 */
router.get('/users/:userId', userController.show);

/**
 * 更新用户
 */
router.patch(
  '/users',
  authGuard,
  validateUpdateUserData,
  userController.update,
);

/**
 * 导出路由
 */
export default router;
