/**
 * @swagger
 * /task/count:
 *  get:
 *   summary: Return the total of tasks
 *   responses:
 *    200:
 *     description: The number of tasks
 *     content:
 *      text/plain:
 *       schema:
 *         type: integer
 *         example: 15
 */
export const test = () => {
  return 123;
};

/**
 * This function comment is parsed by doctrine
 * @route GET /foo
 * @group foo - 这是个例子，使用 jsdoc 方式书写注释
 * @param {string} email.query.required - username or email - eg: user@domain
 * @param {string} password.query.required - user's password.
 * @returns {object} 200 - An array of user info
 * @returns {Error}  default - Unexpected error
 */
export const foo = () => {
  return 666;
};
