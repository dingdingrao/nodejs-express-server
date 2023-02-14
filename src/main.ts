import app from './app';
import { APP_PORT } from './app/app.config';
import { connection } from './app/database/mysql';
import { swaggerInstall } from './app/swagger/index2';

/**
 * Swagger UI
 */
swaggerInstall;

/**
 * 启动程序
 */
app.listen(APP_PORT, () => {
  console.log(`🚀 服务已启动 ~`);
  console.log(`
  App running at:
  - Local:   http://localhost:${APP_PORT}
  - Network: http://192.168.10.109:${APP_PORT}
  `);
});

/**
 * 测试使用数据服务连接
 */
connection.connect(error => {
  if (error) {
    console.log(`👻 连接数据服务失败`, error.message);
    return;
  }

  console.log(`😸 成功连接数据服务 ~`);
});
