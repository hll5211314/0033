//引入express模块
const express=require('express');
//引入连接池
const pool=require('../pool.js');
//添加路由
const r=express.Router();

//1添加购物车
r.get('/cart_add',(req,res)=>{
	//1.1获取get请求的数据
	let obj=req.query;
	console.log(obj);
	
	//1.2验证各项数据是否为空 商品名称lid 购买数量buyCount
	if(!obj.ctproductid){
		res.send({code:400,msg:'ctproductid unamerequired'});
		return;
		}
	if(!obj.ctquantity){
		res.send({code:401,msg:'ctquantity unamequired'});
		return;
	}
	
	//1.3添加成功 购物车数据库的id是cart
	pool.query('insert into cart set ?',[obj],(err,result)=>{
		if(err) throw err;
		console.log(result);	
		})
		res.send({code:200,msg:'add suc'});
	})
	
	
//2.删除购物车
r.delete('/cart_del/:ctid',(req,res)=>{
	var _ctid=req.params.ctid;
	var sql="delete from cart where ctid=?";
	pool.query(sql,[_ctid],(err,result)=>{
		if(err) throw err;
		if(result.affectedRows>0){
			res.send("1");
		}else{
			res.send("0");
		}
	})
});

//3.查询购物车内的商品
r.get('/cart_sel/:ctid',(req,res)=>{
	var _ctid=req.params.ctid;
	var sql="select * from cart where ctid=?";
	pool.query(sql,[_ctid],(err,result)=>{
		if(err) throw err;
		res.send(result);
	})
	});
//导出路由
module.exports=r;