import express from 'express';
import * as commentController from './conment.controller';
import { authGuard } from 'src/auth/auth.middleware';

const router = express.Router();

/**
 * 发表评论
 */
router.post('/comments', authGuard, commentController.store);

/**
 * 导出路由
 */
export default router;
