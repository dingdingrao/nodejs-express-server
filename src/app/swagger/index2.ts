import app from '../index';
import { swaggerConfig } from './swaggerConfig2';
const expressSwagger = require('express-swagger-generator')(app);

export const swaggerInstall = expressSwagger(swaggerConfig);
