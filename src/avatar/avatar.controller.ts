import path from 'path';
import fs from 'fs';
import _ from 'lodash';
import { Request, Response, NextFunction } from 'express';
import { createAvatar, findAvatarByUserId } from './avatat.service';

/**
 * 上传头像
 */
export const store = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  // 当前用户 ID
  const { id: userId } = request.user;

  // 头像文件信息
  const fileInfo = _.pick(request.file, ['mimetype', 'filename', 'size']);

  // 准备头像数据
  const avatar = {
    ...fileInfo,
    userId,
  };

  try {
    // 保存头像数据
    const data = await createAvatar(avatar);

    // 做出响应
    response.status(201).send(data);
  } catch (error) {
    next(error);
  }
};

/**
 * 按用户 ID 查找头像
 */
export const findAvatar = async (
  request: Request,
  response: Response,
  next: NextFunction,
) => {
  // 当前登录用户 ID，验证 token
  const { userId } = request.params;

  // 执行查询
  try {
    const file = await findAvatarByUserId(Number(userId!));

    // 判断是否有头像
    if (!file) {
      throw new Error('FILE_NOT_FOUND');
    }

    // 要提供的头像尺寸
    const { size } = request.query;

    // 文件名与目录
    let filename = file.filename;
    let root = path.join('uploads', 'avatar');
    let resized = 'resized';

    if (size) {
      // 可用的头像尺寸
      const imageSizes = ['large', 'medium', 'small'];

      // 测试可用头像尺寸
      if (!imageSizes.some(item => item == size)) {
        throw new Error('FILE_NOT_FOUND');
      }

      // 检查文件是否存在
      const fileExist = fs.existsSync(
        path.join(root, resized, `${filename}-${size}`),
      );

      // 如果文件不存在
      if (!fileExist) {
        throw new Error('FILE_NOT_FOUND');
      }

      // 如果文件存在
      if (fileExist) {
        filename = `${filename}-${size}`;
        root = path.join(root, resized);
      }
    }

    // 做出响应
    response.sendFile(filename, {
      root, // 存储文件的目录
      headers: {
        'Content-Type': file.mimetype,
      },
    });
  } catch (error) {
    next(error);
  }
};
