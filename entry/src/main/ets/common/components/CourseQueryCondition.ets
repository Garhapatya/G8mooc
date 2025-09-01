@Component
export default struct CourseQueryCondition {
  @Link selectIndex: number;
  @Link order_desc: boolean; // 价格是否降序排序

  build() {
    Row({ space: 10 }) {
      // 综合
      Text('综合')
        .width(50)
        .fontColor(this.selectIndex === 1 ? Color.Blue : Color.Black)
        .onClick((): void => {
          this.selectIndex = 1;
        })

      // 人气
      Text('人气')
        .width(50)
        .fontColor(this.selectIndex === 2 ? Color.Blue : Color.Black)
        .onClick((): void => {
          this.selectIndex = 2;
        })

      // 好评率
      Text('好评率')
        .width(50)
        .fontColor(this.selectIndex === 3 ? Color.Blue : Color.Black)
        .onClick((): void => {
          this.selectIndex = 3;
        })

      // 价格
      Row() {
        Text('价格')
          .fontColor(this.selectIndex === 4 ? Color.Blue : Color.Black)
          .onClick((): void => {
            this.selectIndex = 4;
            this.order_desc = !this.order_desc;
          })
        Image(this.order_desc ? $r('app.media.sort_down') : $r('app.media.sort_up'))
          .width(15)
          .margin({ right: 4 })
      }

      // 筛选
      Row() {
        Text('筛选')
          .margin({ left: 4 })
          .onClick((): void => {
            this.selectIndex = 5;
          })
        Image($r('app.media.filter'))
          .width(15)
      }
    }
    .height(30)
    .width('90%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}