import { APP_PORT } from '../app.config';

/**
 * SwaggerConfigs
 */
export const swaggerConfig = {
  swaggerDefinition: {
    info: {
      title: '小白兔的开发之旅',
      version: '1.0.0',
      description: '小白兔的开发之旅接口.',
    },
    // host: `localhost:${APP_PORT}`,
    basePath: '',
    produces: ['application/json', 'application/xml'],
    schemes: ['http', 'https'],
    securityDefinitions: {
      JWT: {
        type: 'apiKey',
        in: 'header',
        name: 'Authorization',
        description: '',
      },
    },
  },
  route: {
    url: '/swagger',
    docs: '/swagger.json', //swagger文件 api
  },
  basedir: '', //app absolute path
  files: ['./src/**/*.ts'], //Path to the API handle folder
};
