// import { TodoItem } from './ToDoItem';

@Entry
@Component
struct TodoList {
  // 明确指定待办任务数组类型为字符串数组
  @State totalTasks: string[] = ['早起晨练', '准备早餐', '阅读名著', '学习 ArkTS', '看剧放松'];

  build() {
    Column() {
      // 页面标题
      Text('待办事项')
        .fontSize(36)
        .fontWeight(FontWeight.Bold)
        .margin(10)
      // 循环渲染每个待办任务，明确指定循环变量 task 的类型为字符串
      ForEach(this.totalTasks, (task: string) => {
        TodoItem({ taskContent: task })
      },
        (task: string) => task
      )
    }
    .width('100%')
    .height('100%')
  }
}
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