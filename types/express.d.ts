import { TokenPayload } from '../src/auth/auth.interface';

// 扩展请求类型
declare global {
  namespace Express {
    export interface Request {
      user: TokenPayload;
    }
  }
}
