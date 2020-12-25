const express = require('express');
//const { request } = require('http');

//引入连接池模块
const pool = require('../pool.js');
//console.log(pool);
//创建路由器对象
const r = express.Router();


//orders修改用户  get  /update
r.get('/update', (req, res) => {
	//获取查询字符串传递的数据
	let obj = req.query;
	console.log(obj);
	//使用for-in遍历对象，验证各项是否为空
	//声明变量用于保存状态码
	let i = 400;
	for (let k in obj) {
		//每循环一个属性，i加1
		i++;
		//k代表每个属性名  obj[k]代表对应的属性值
		//console.log(k,obj[k]);
		//如果属性值为空，则提示该项属性不能为空
		if (!obj[k]) {
			res.send({
				code: i,
				msg: k + ' required'
			});
			return;
		}
	}
	//执行SQL命令
	//修改数据，将整个对象修改
	pool.query('UPDATE orders SET ? WHERE odid=?', [obj, obj.odid], (err, result) => {
		if (err) throw err;
		//返回的是对象，如果对象下的affectedRows为0说明修改失败，否则修改成功
		console.log(result);
		if (result.affectedRows === 0) {
			res.send({
				code: 301,
				msg: 'update err'
			});
		} else {
			res.send({
				code: 200,
				msg: 'update suc'
			});
		}
	});
});


//orders删除用户订单
// r.get('/delete', (req, res) => {
// 	//获取查询字符串传递的数据
// 	let obj = req.query;
// 	console.log(obj);
// 	//验证数据是否为空
// 	if (!obj.odid) {
// 		res.send({
// 			code: 401,
// 			msg: 'odid required'
// 		});
// 		return;
// 	}
// 	//执行SQL命令
// 	pool.query('DELETE FROM orders WHERE odid=?', [obj.odid], (err, result) => {
// 		if (err) throw err;
// 		//返回对象，通过affectedRows判断是否删除成功
// 		console.log(result);
// 		if (result.affectedRows === 0) {
// 			res.send({
// 				code: 301,
// 				msg: 'delete err'
// 			});
// 		} else {
// 			res.send({
// 				code: 200,
// 				msg: 'delete suc'
// 			});
// 		}
// 	});
// });


//orders添加用户订单(post /add)
r.post('/add', (req, res) => {
	//1.1获取post请求的数据
	let obj = req.body;
	console.log(obj);
	//1.2验证各项数据是否为空
	if (!obj.odid) { //===''
		res.send({
			code: 401,
			msg: 'odid required'
		});
		return; //阻止函数往后执行，就会跳出函数
	}
	//添加其它项验证
	if (!obj.oduserid) {
		res.send({
			code: 402,
			msg: 'oduserid required'
		});
		return;
	}
	if (!obj.odshoppingid) {
		res.send({
			code: 403,
			msg: 'odshoppingid required'
		});
		return;
	}
	if (!obj.payment) {
		res.send({
			code: 404,
			msg: 'payment required'
		});
		return;
	}
	if (!obj.paymenttype) {
		res.send({
			code: 405,
			msg: 'paymenttype required'
		});
		return;
	}
	if (!obj.postage) {
		res.send({
			code: 406,
			msg: 'postage required'
		});
		return;
	}
	if (!obj.odstatus) {
		res.send({
			code: 407,
			msg: 'odstatus required'
		});
		return;
	}
	if (!obj.paymenttime) {
		res.send({
			code: 408,
			msg: 'paymenttime required'
		});
		return;
	}
	if (!obj.sendtime) {
		res.send({
			code: 409,
			msg: 'sendtime required'
		});
		return;
	}
	if (!obj.endtime) {
		res.send({
			code: 410,
			msg: 'endtime required'
		});
		return;
	}
	if (!obj.closetime) {
		res.send({
			code: 411,
			msg: 'closetime required'
		});
		return;
	}
	if (!obj.odcreatetime) {
		res.send({
			code: 412,
			msg: 'odcreatetime required'
		});
		return;
	}
	if (!obj.odupdatetime) {
		res.send({
			code: 413,
			msg: 'odupdatetime required'
		});
		return;
	}

	//执行SQL命令
	pool.query('insert into orders set ?', [obj], (err, result) => {
		if (err) throw err;
		console.log(result);
		
		
	
		res.send({
			code: 200,
			msg: '添加成功'
		});
	});
});






//orders查询所有订单
// r.get("/get_userinfo", (req, res) => {
// 	var sql = "select * from orders";
// 	pool.query(sql, [], (err, result) => {
// 		if (err) throw err;
// 		//console.log(typeof result);
// 		res.send(result);
// 	})
// })



//orderitem添加用户订单(post /adds)
r.post('/adds', (req, res) => {
	//获取post请求的数据
	let obj = req.body;
	console.log(obj);
	//验证各项数据是否为空
	if (!obj.oiid) { //===''
		res.send({
			code: 401,
			msg: 'oiid required'
		});
		return; //阻止函数往后执行，就会跳出函数
	}
	//添加其它项验证
	if (!obj.oiordersid) {
		res.send({
			code: 402,
			msg: 'oiordersid required'
		});
		return;
	}
	if (!obj.oiuserid) {
		res.send({
			code: 403,
			msg: 'oiuserid required'
		});
		return;
	}
	if (!obj.oiproductid) {
		res.send({
			code: 404,
			msg: 'oiproductid required'
		});
		return;
	}
	if (!obj.oiproductname) {
		res.send({
			code: 405,
			msg: 'oiproductname required'
		});
		return;
	}
	if (!obj.oiproductimage) {
		res.send({
			code: 406,
			msg: 'oiproductimage required'
		});
		return;
	}
	if (!obj.oiprice) {
		res.send({
			code: 407,
			msg: 'oiprice required'
		});
		return;
	}
	if (!obj.oicount) {
		res.send({
			code: 408,
			msg: 'oicount required'
		});
		return;
	}
	if (!obj.oicreatetime) {
		res.send({
			code: 409,
			msg: 'oicreatetime required'
		});
		return;
	}
	if (!obj.oiupdatetime) {
		res.send({
			code: 410,
			msg: 'oiupdatetime required'
		});
		return;
	}
	//执行SQL命令
	pool.query('insert into orderitem set ?', [obj], (err, result) => {
		if (err) throw err;
		console.log(result);
		//成功
		res.send({
			code: 200,
			msg: 'adds suc'
		});
	});
});


//orderitem删除用户订单
r.get('/deletes', (req, res) => {
	//获取查询字符串传递的数据
	let obj = req.query;
	console.log(obj);
	//验证数据是否为空
	if (!obj.oiid) {
		res.send({
			code: 401,
			msg: 'oiid required'
		});
		return;
	}
	//执行SQL命令
	pool.query('DELETE FROM orderitem WHERE oiid=?', [obj.oiid], (err, result) => {
		if (err) throw err;
		//返回对象，通过affectedRows判断是否删除成功
		console.log(result);
		if (result.affectedRows === 0) {
			res.send({
				code: 301,
				msg: 'deletes err'
			});
		} else {
			res.send({
				code: 200,
				msg: 'deletes suc'
			});
		}
	});
});


//orderitem查询所有订单
// r.get("/get_userinfos", (req, res) => {
// 	var sql = "select * from orderitem";
// 	pool.query(sql, [], (err, result) => {
// 		if (err) throw err;
// 		//console.log(typeof result);
// 		res.send(result);
// 	})
// })


//orderitem修改用户  get  /updates
r.get('/updates', (req, res) => {
	//获取查询字符串传递的数据
	let obj = req.query;
	console.log(obj);
	//使用for-in遍历对象，验证各项是否为空
	//声明变量用于保存状态码
	let i = 400;
	for (let k in obj) {
		//每循环一个属性，i加1
		i++;
		//k代表每个属性名  obj[k]代表对应的属性值
		//console.log(k,obj[k]);
		//如果属性值为空，则提示该项属性不能为空
		if (!obj[k]) {
			res.send({
				code: i,
				msg: k + ' required'
			});
			return;
		}
	}
	//执行SQL命令
	//修改数据，将整个对象修改
	pool.query('UPDATE orderitem SET ? WHERE oiid=?', [obj, obj.oiid], (err, result) => {
		if (err) throw err;
		//返回的是对象，如果对象下的affectedRows为0说明修改失败，否则修改成功
		console.log(result);
		if (result.affectedRows === 0) {
			res.send({
				code: 301,
				msg: 'updates err'
			});
		} else {
			res.send({
				code: 200,
				msg: 'updates suc'
			});
		}
	});
});

module.exports = r;
