import { Request, Response, NextFunction } from 'express';
import { UserModel } from './user.model';
import * as userService from './user.service';

/**
 * 创建用户
 */
export const store = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  // 准备数据
  const { name, password } = request.body;

  // 创建用户
  try {
    const data = await userService.creatUser({ name, password });

    // 响应
    response.status(201).send(data);
  } catch (error) {
    next(error);
  }
};

/**
 * 用户账户
 */
export const show = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  // 准备数据
  const { userId } = request.params;

  // 调取用户
  try {
    const user = await userService.getUserById(Number(userId));

    if (!user) {
      return next(new Error('USER_NOT_FOUND'));
    }

    // 做出响应
    response.send(user);
  } catch (error) {
    next(error);
  }
};
