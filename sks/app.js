//引入express模块
const express=require('express');
//引入用户路由器
const userRouter=require('./router/user.js');
const category=require("./router/sks_category.js");
const product=require("./router/sks_product.js");
const cartRouter=require('./router/cart.js');
const usersRouter=require('./router/users.js');
const ajaxRouter=require('./router/ajax.js');
//引入body-parser中间件
const bodyParser=require('body-parser');
//创建web服务器
const app=express();
//设置端口
app.listen(8080);
//托管静态资源到public目录
app.use(express.static('./public'));
//应用body-parser中间件，将post请求数据解析为对象
app.use( bodyParser.urlencoded({
  extended: false
}) );
//挂载路由器(放最后)
//路由URL添加/user    /user/reg
app.use('/user',userRouter);
app.use("/cmmodity",category);
app.use("/product",product);
app.use('/cart',cartRouter);
app.use( '/users',usersRouter );
app.use( '/ajax',ajaxRouter );