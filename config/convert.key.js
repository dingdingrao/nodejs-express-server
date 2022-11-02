const fs = require('fs');
const path = require('path');

/**
 * 读取密钥文件
 */
const privtaeKey = fs.readFileSync(path.join('config', 'private.key'));
const publicKey = fs.readFileSync(path.join('config', 'public.key'));

/**
 * 转换成 Base64 格式
 */
const privateKeyBase64 = Buffer.from(privtaeKey).toString('base64');
const publicKeyBase64 = Buffer.from(publicKey).toString('base64');

/**
 * 输出转换后的结果
 */
console.log('\nPrivate Key:');
console.log(privateKeyBase64);

console.log('\nPubilc Key:');
console.log(publicKeyBase64);
