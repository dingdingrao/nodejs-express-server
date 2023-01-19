import { TokenPayload } from '../src/auth/auth.interface';
import { GetPostsOptionsFilter } from '../src/post/post.service';

// 扩展请求类型
declare global {
  namespace Express {
    export interface Request {
      user: TokenPayload;
      fileMetaData: { width?: number; height?: number; metadata?: {} };
      sort: string;
      filter: GetPostsOptionsFilter;
    }
  }
}
