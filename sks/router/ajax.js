const express = require('express');
const { request } = require('http');

//引入连接池模块
const pool = require('../pool.js');
//console.log(pool);
//创建路由器对象
const r = express.Router();

//orders删除数据
r.delete("/del_user/:odid",(req,res)=>{
	var _odid=req.params.odid;
	var sql="delete from orders where odid=?";
	pool.query(sql,[_odid],(err,result)=>{
		if(err) throw err;
		if(result.affectedRows>0){
			res.send("删除成功")
		}else{
			res.send("删除失败")
		}
	})
})

//orders查询所有订单
r.get("/get_userinfo", (req, res) => {
	var sql = "select * from orders";
	pool.query(sql, [], (err, result) => {
		if (err) throw err;
		//console.log(typeof result);
		res.send(result);
	})
})
//orderitem删除数据
r.delete("/del_users/:oiid",(req,res)=>{
	var _oiid=req.params.oiid;
	var sql="delete from orderitem where oiid=?";
	//console.log(1)
	
	pool.query(sql,[_oiid],(err,result)=>{
		if(err) throw err;
		if(result.affectedRows>0){
			res.send("删除成功")
		}else{
			res.send("删除失败")
		}
	})
})

//orderitem查询所有订单
r.get("/get_userinfoss", (req, res) => {
	var sql = "select * from orderitem";
	pool.query(sql, [], (err, result) => {
		if (err) throw err;
		//console.log(typeof result);
		res.send(result);
	})
})


module.exports = r;
