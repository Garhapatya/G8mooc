import CourseBean from '../bean/CourseBean';

@Component
export struct CourseCell {
  @Prop course: CourseBean; // 使用 @Prop 装饰器

  build() {
    Row({ space: 8 }) {
      Image(this.course.img)
        .width(80)
        .height(80)
        .borderRadius(8)

      Column({ space: 4 }) {
        Text(this.course.title)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Text(this.course.desc)
          .fontSize(12)
          .width('100%')
          .maxLines(2)

        Text(`¥${this.course.price}元`)
          .fontSize(14)
          .fontColor(Color.Red)

        Row() {
          Text(`最近在学：${this.course.students}`)
            .fontSize(12)
            .fontColor(Color.Blue)
        }
        .width('100%')
      }
      .width('70%')
    }
    .padding(8)
    .width('100%')
    .backgroundColor(Color.White)
  }
}