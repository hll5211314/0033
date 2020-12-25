const express = require('express');
const { request } = require('http');

//引入连接池模块
const pool = require('../pool.js');
//console.log(pool);
//创建路由器对象
const r = express.Router();



module.exports = r;
