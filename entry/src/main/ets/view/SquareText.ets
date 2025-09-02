// 带圆角方形文本组件
@Component
export default struct SquareText {
  @Prop title: string;
  @Prop textColor: ResourceColor;
  build() {
    Text(this.title)
      .backgroundColor('#ffa2afbc')
      .fontColor(this.textColor)
      .borderRadius(5)
      .margin(4)
      .padding(6)
      .textAlign(TextAlign.Center)
      .textOverflow({ overflow: TextOverflow.Ellipsis })
      .maxLines(1) // 通常标签只显示一行
  }
}