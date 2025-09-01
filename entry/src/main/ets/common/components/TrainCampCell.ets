import CampBean from '../bean/CampBean';

@Component
export default struct TrainCampCell {
  @Prop campItem: CampBean; // 使用 @Prop 装饰器
  build() {
    Column({ space: 5 }) {
      Image(this.campItem.img)
        .width(150)
        .height(95)
        .borderRadius(8)
        .margin(2)

      Text(this.campItem.title)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .maxLines(2)

      Row({ space: 2 }) {
        Text(`${this.campItem.days}天营`)
          .fontSize(12)
          .backgroundColor(Color.Orange)
          .fontColor(Color.White)
          .borderRadius(5)
          .padding(4)

        Text(`${this.campItem.startDate}开始`)
          .fontSize(12)
          .backgroundColor(Color.Pink)
          .borderRadius(5)
          .padding(4)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')

      Row() {
        Text(`¥${this.campItem.price}元`)
          .fontSize(14)
          .fontColor(Color.Red)

        Text(this.campItem.orgName)
          .fontSize(12)
          .fontColor(Color.Gray)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
    }
    .padding(8)
    .width(170)
    .backgroundColor(Color.White)
    .borderRadius(8)
  }
}