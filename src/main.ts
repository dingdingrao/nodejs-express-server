import app from './app';
import { APP_PORT } from './app/app.config';

app.listen(APP_PORT, () => {
  console.log(`🚀 服务已启动 ~`);
  console.log(`
  App running at:
  - Local:   %c http://localhost:${APP_PORT},'color: #43bb88'/
  - Network: %c http://192.168.10.109:${APP_PORT},'color: #43bb88'/
  `);
});
