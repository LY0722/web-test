import http from '@ohos.net.http';

@Entry
@Component
struct PostRequestExample {
  @State result: string = '';

  build() {
    Column() {
      Button('发送 POST 请求')
        .onClick(() => {
          this.sendPostRequest();
        })
      Text(this.result)
        .fontSize(20)
    }
  }

  sendPostRequest() {
    let httpRequest = http.createHttp();
    let url = "http://jdz.jxpisp.com/api/bs/third_tag?tag=apo";
    let postData = {
      value: "景德镇陶瓷大学",
      count: 30
    };
    // 发起 POST 请求，设置请求体为 JSON 格式的 postData
    httpRequest.request(
      url,
      {
        method: http.RequestMethod.POST,
        header: { 'Content-Type': 'application/json' },
        // body: JSON.stringify(postData)
      },
      (err, data) => {
        if (!err) {
          this.result = JSON.stringify(data.result);
        } else {
          this.result = '请求出错：' + JSON.stringify(err);
        }
      }
    );
  }
}