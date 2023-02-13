import app from '.';
import { APP_PORT } from '../app/app.config';
const expressSwagger = require('express-swagger-generator')(app);

let options = {
  swaggerDefinition: {
    info: {
      description: 'This is a sample server',
      title: 'Swagger',
      version: '1.0.0',
    },
    host: `localhost:${APP_PORT}`,
    basePath: '/v1',
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
  basedir: __dirname, //app absolute path
  files: ['../src/**/*.ts'], //Path to the API handle folder
};

export const startSwagger = expressSwagger(options);
