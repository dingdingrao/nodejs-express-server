import request from 'supertest';
import app from '../app';
import { connection } from './database/mysql';
import { greet } from './playground/demo';

/**
 * 单元测试
 */
describe('演示单元测试', () => {
  // 测试
  test('测试 greet 函数', () => {
    // 准备
    const greeting = greet('王皓');

    // 做出断言
    expect(greeting).toBe('你好，王皓');
  });
});

/**
 * 接口测试
 */
describe('演示接口测试', () => {
  // 所有测试结束后执行
  afterAll(async () => {
    // 断开服务链接
    connection.end();
  });

  test('测试 GET / 接口', async () => {
    // 请求接口
    const response = await request(app).get('/');

    // 做出断言
    expect(response.status).toBe(200);
    expect(response.body).toEqual({ title: '小白兔的开发之路' });
  });

  test('测试 POST /echo', async () => {
    // 请求接口
    const response = await request(app)
      .post('/echo')
      .send({ message: 'Hi, Aaron' });

    // 做出断言
    expect(response.status).toBe(201);
    expect(response.body).toEqual({ message: 'Hi, Aaron' });
  });
});
