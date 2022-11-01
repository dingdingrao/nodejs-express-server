import jwt from 'jsonwebtoken';
import { PRIVATE_KEY } from '../app/app.config';

/**
 * 签发信息
 */
interface SignTokenOPtions {
  payload?: any;
}

export const signToken = (options: SignTokenOPtions) => {
  // 准备选项
  const { payload } = options;

  // 签发 JWT
  const token = jwt.sign(payload, PRIVATE_KEY, { algorithm: 'RS256' });

  // 提供 JWT
  return token;
};
