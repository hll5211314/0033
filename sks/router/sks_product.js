//引入构架
const express=require("express");
//引入连接池模块
const pool=require("../pool.js")
//console.log(pool);
//添加路由器对象
const s=express.Router();
//添加路由

//商品添加
s.post("/register",(req,res)=>{
	//1.获取请求数据
	let obj=req.body;
	//1.2验证各项数据是否为空
  //1.3执行SQL命令
  pool.query('insert into product set ?',[obj],(err,result)=>{
    if(err) throw err;
	console.log(result);
	//成功
	res.send({code:200,msg:'suc'});
  });
});




//搜索商品
s.get("/seek",(req,res)=>{
	 //1获取查询字符串传递的数据
	let obj=req.query;

	//执行mysql命令
  pool.query('select * from product where pid=?',[obj.pid],(err,result)=>{
    if(err) throw err;
	console.log(result);
	//如果结果是空数组表示没有此用户，可以使用；否则此用户存在，不可以使用
	if(result.length===0){
	  res.send({code:400,msg:'没有'});
	}else{
	  res.send({code:200,msg:'商品'});
	}
  });

});



//修改商品
s.post("/update",(req,res)=>{
	let obj=req.body;
	console.log(obj);
//4.3执行SQL命令
  pool.query('update product set ? where pid=?',[obj,obj.pid],(err,result)=>{
    if(err) throw err;
	console.log(result);
	//结果是对象，如果对象下的affectedRows为0表示修改失败，否则表示修改成功
	if(result.affectedRows===0){
	  res.send({code:301,msg:'update err'});
	}else{
	  res.send({code:200,msg:'update suc'});
	}
  });
});



//删除商品
s.delete("/del_user/:pid",(req,res)=>{
	var _pid=req.params.pid;
	var sql="delete from product where pid=?";
	pool.query(sql,[_pid],(err,result)=>{
		if(err) throw err;
		if(result.affectedRows>0){
			res.send("1");
		}else{
			res.send("0");
		}
	});
})

//导出路由器对象
module.exports=s;