const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//创建路由器对象
const r=express.Router();
//添加路由
//1.登录模块
r.get("/v1/login/:uname&:upwd",(req,res)=>{
	var _uname=req.params.uname;
	var _upwd=req.params.upwd;
	var sql="select * from xz_user where uname=? and upwd=?";
	pool.query(sql,[_uname,_upwd],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send("1");
		}else{
			res.send("0");
		}
	});
});
//2.查询所有用户
r.get("/v1/list",(req,res)=>{
	var sql="select * from xz_user";
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send(result);
	});
});
//3.根据uid删除用户
r.delete("/v1/del/:uid",(req,res)=>{
	var _uid=req.params.uid;
	var sql="delete from xz_user where uid=?";
	pool.query(sql,[_uid],(err,result)=>{
		if(err) throw err;
		if(result.affectedRows>0){
			res.send("1");
		}else{
			res.send("0");
		}
	});
});
r.get("/v1/search/:uid",(req,res)=>{
	var _uid=req.params.uid;
	var sql="select * from xz_user where uid=?";
	pool.query(sql,[_uid],(err,result)=>{
		if(err) throw err;
		res.send(result);
	});
})
//根据uid修改用户信息
r.put("/v1/update",(req,res)=>{
	var obj=req.body;
	var sql="update xz_user set ? where uid=?";
	pool.query(sql,[obj,obj.uid],(err,result)=>{
		if(err) throw err;
		if(result.affectedRows>0){
			res.send("1");
		}else{
			res.send("0");
		}
	});
});
//用户名重复验证
r.get("/v1/getUname/:uname",(req,res)=>{
	var _uname=req.params.uname;
	var sql="select * from xz_user where uname=?";
	pool.query(sql,[_uname],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send("1");
		}else{
			res.send("0");
		}
	});
});
//导出路由器对象
module.exports=r;
//页面两个文本框，用户名和密码
//点击按钮，发送请求
//后台（/get_login）接收请求，把接收到的用户名和密码当做响应传递前台
