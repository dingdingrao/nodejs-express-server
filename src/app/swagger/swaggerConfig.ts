import { Options } from 'swagger-jsdoc';

export const swaggerConfig: Options = {
  failOnErrors: true,
  definition: {
    openapi: '3.0.0',
    info: {
      title: '小白兔的开发之旅',
      version: '1.0.0',
      // description: `小白兔的开发之旅接口 API。`,
    },
  },
  apis: ['./src/**/*.ts'],
};
