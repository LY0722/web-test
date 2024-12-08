@Component
export  struct TodoItem {
  // 任务是否完成的状态
  @State isComplete: boolean = false;
  // 任务内容
  @Prop taskContent: string = '';

  @Builder labelIcon(url: Resource) {
    Image(url)
      .objectFit(ImageFit.Contain)
      .width(20)
      .height(20)
      .margin(5)
  }

  build() {
    Row() {
      // 根据任务完成状态显示不同图标
      if (this.isComplete) {
        this.labelIcon($r('app.media.ic_ok'))
      } else {
        this.labelIcon($r('app.media.ic_default'))
      }
      // 显示任务内容，并根据完成状态设置样式
      Text(this.taskContent)
        .fontSize(26)
        .opacity(this.isComplete? 0.5 : 1)
        .decoration({
          type: this.isComplete? TextDecorationType.LineThrough : TextDecorationType.None
        })
          // 点击任务项切换完成状态
        .onClick(() => {
          this.isComplete =!this.isComplete;
        })
    }
    .width('100%')
    .height(40)
  }
}