// entry/src/main/ets/view/component/CourseCard.ets
import CourseItem from '../bean/CourseItem1';

@Component
export default struct CourseCard {
  @Prop courseItem: CourseItem; // 使用 @Prop 装饰器

  build() {
    Column() {
      // 课程图片
      Image(this.courseItem.image)
        .width('100%')
        .height(120)
        .objectFit(ImageFit.Cover)
        .borderRadius(8)

      // 课程标题
      Text(this.courseItem.title)
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 8 })
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .width('100%')

      // 课程描述
      Text(this.courseItem.description)
        .fontSize(12)
        .fontColor('#666666')
        .margin({ top: 4 })
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .width('100%')

      // 价格和在学人数
      Row() {
        Text(`￥${this.courseItem.price}`)
          .fontSize(16)
          .fontColor('#ff1c1b39')
          .fontWeight(FontWeight.Bold)

        Text(`最近在学：${this.courseItem.studentsCount}`)
          .fontSize(12)
          .fontColor('#999999')
          .margin({ left: 8 })
      }
      .width('100%')
      .margin({ top: 8 })
      .justifyContent(FlexAlign.SpaceBetween)

      // 热门标签
      if (this.courseItem.isHot) {
        Text('热门')
          .fontSize(10)
          .fontColor(Color.White)
          .backgroundColor(Color.Red)
          .padding({ left: 4, right: 4, top: 2, bottom: 2 })
          .borderRadius(4)
          .margin({ top: 4 })
          .alignSelf(ItemAlign.Start)
      }
    }
    .width(160)
    .padding(8)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1c000000', offsetX: 0, offsetY: 2 })
  }
}