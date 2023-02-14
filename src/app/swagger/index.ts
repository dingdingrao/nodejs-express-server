import app from '../';
import swaggerUI from 'swagger-ui-express';
import swaggerJSDoc, { Options } from 'swagger-jsdoc';
import { swaggerConfig } from './swaggerConfig';

/**
 * expressSwaggerUI
 */
const swaggerSpec = swaggerJSDoc(swaggerConfig);

export const swaggerInstall = function(app: any) {
  // 开放 swagger 相关接口，
  app.get('/swagger.json', function(req: any, res: any) {
    res.setHeader('Content-Type', 'application/json');
    res.send(swaggerSpec);
  });

  // 使用 swaggerSpec 生成 swagger 文档页面，并开放在指定路由
  app.use('/swagger', swaggerUI.serve, swaggerUI.setup(swaggerSpec));
};
