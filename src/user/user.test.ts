import request from 'supertest';
import bcrypt from 'bcrypt';
import app from '../app';
import { connection } from '../app/database/mysql';
import { signToken } from '../auth/auth.service';
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
    await deleteUser(testUserCreated.id!);
  }

  // 断开数据链接
  connection.end();
});

/**
 * 创建用户
 */
describe('测试创建用户接口', () => {
  test('创建用户必须提供用户名', async () => {
    // 请求接口
    const response = await request(app)
      .post('/users')
      .send({
        password: testUser.password,
      });

    // 做出断言
    expect(response.status).toBe(400);
    expect(response.body).toEqual({ message: '请提供用户名' });
  });

  test('创建用户必须提供用户密码', async () => {
    // 请求接口
    const response = await request(app)
      .post('/users')
      .send({
        name: testUser.name,
      });

    // 做出断言
    expect(response.status).toBe(400);
    expect(response.body).toEqual({ message: '请提供用户密码' });
  });

  test('成功创建用户，响应状态码应该是 201', async () => {
    // 请求接口
    const response = await request(app)
      .post('/users')
      .send(testUser);

    // 设置创建的测试用户
    testUserCreated = await getUserById(response.body.insertId, {
      password: true,
    });
    console.log(testUserCreated);

    // 做出断言
    expect(response.status).toBe(201);
  });
});

/**
 * 用户账户
 */
describe('测试用户账户接口', () => {
  test('相应里应该包含指定的属性', async () => {
    // 请求接口
    const response = await request(app).get(`/users/${testUserCreated.id}`);

    // 做出断言
    expect(response.status).toBe(200);
    expect(response.body.name).toBe(testUser.name);
    expect(response.body).toMatchObject({
      id: expect.any(Number),
      name: expect.any(String),
      avatar: null,
    });
  });

  test('当用户不存在时，响应的状态码 是 404', async () => {
    // 请求接口
    const response = await request(app).post(`/users/-1`);

    // 做出断言
    expect(response.status).toBe(404);
  });
});
