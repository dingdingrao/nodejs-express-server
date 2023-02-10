import request from 'supertest';
import request from 'supertest';
import request from 'supertest';
import bcrypt from 'bcrypt';
import app from '@/app';
import { connection } from '@/app/database/mysql';
import { signToken } from '@/auth/auth.service';
import { deleteUser, getUserById } from './user.service';
import { UserModel } from './user.model';

/**
 * 准备测试
 */
const testUser: UserModel = {
  name: 'Aaron',
  password: '123456',
};

const testUserUpdated: UserModel = {
  name: 'Spring',
  password: '123456',
};

let testUserCreated: UserModel;

/**
 * 所有测试结束后
 */
afterAll(async () => {
  // 删除测试用户
  if (testUserCreated) {
    await deleteUser(testUserCreated.id);
  }

  // 断开数据链接
  connection.end();
});
