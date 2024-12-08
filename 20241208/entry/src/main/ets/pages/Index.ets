import router from '@ohos.router';
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      Button('跳转到 get页面')
        .onClick(() => {
          // 使用路由进行页面跳转，跳转到名为 getRequest.ets 的页面
          router.pushUrl({
            url: 'pages/getRequest',
          });
        })
      Button('跳转到 ToDo')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/ToDoList',
          });
        })
    }
    .height('100%')
    .width('100%')
  }
}