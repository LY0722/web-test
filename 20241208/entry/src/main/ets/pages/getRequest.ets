import http from '@ohos.net.http';
// 记忆HTTP请求码
@Entry
@Component
export struct GetRequestExample{
  // 定义用来存储请求结果的变量
  @State result:string='';
  build() {
    Column(){
      Button('发送GET请求')
        .onClick(()=>{
          this.sendGetRequest();
        })
      Text(this.result)
        .fontSize(20)
    }
  }
  sendGetRequest(){
    //   创建HTTP请求实例
    let httpRequest=http.createHttp();
    //   定义请求的URL
    let url="http://jdz.jxpisp.com/api/bs/third_tag?tag=apo";
    //   发送GET请求
    httpRequest.request(
      url,
      {
        method:http.RequestMethod.GET
      },
      (err,data)=>{
        if(!err){
          //   将响应数据转换为字符串并存储在result变量中
          this.result=JSON.stringify(data.result);
        }else {
          this.result="请求错误："+JSON.stringify(err);
        }
      }
    )
  }
}