import PublishItem from '../common/bean/PublishItem';

@Component
export default struct PublishItemView {
  @Prop publishItem: PublishItem; // 使用 @Prop 装饰器

  build() {
    Column({ space: 4 }) {
      // 顶部用户信息栏
      Row() {
        Image(this.publishItem.userImage)
          .width(50)
          .height(50)
          .borderRadius(25)
        Column() {
          Row() {
            Text(this.publishItem.nickName)
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
            Text(this.publishItem.roleName)
              .fontSize(12)
              .backgroundColor('#c83182')
              .fontColor(Color.White)
              .padding({ left: 5, right: 5, top: 2, bottom: 2 })
              .borderRadius(5)
              .margin({ left: 6 })
          }
          Text(this.publishItem.publishDate)
            .fontSize(12)
            .fontColor('#999999')
            .margin({ top: 2 })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .margin({ left: 8 })
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)

      // 发布文本内容
      Text(this.publishItem.publishContent)
        .fontSize(14)
        .margin({ top: 5, bottom: 8 })
        .width('100%')

      // 视频区域
      Video({
        src: this.publishItem.videoResource,
        previewUri: this.publishItem.previewImage, // 设置海报
      })
        .controls(true) // 显示控制栏
        .autoPlay(false)
        .loop(false)
        .objectFit(ImageFit.Contain) // 或 ImageFit.Cover
        .width('100%')
        .height(200)

      // 标签
      Text(this.publishItem.tags)
        .fontSize(12)
        .fontColor('#666666')
        .margin({ top: 8 })

      // 底部互动栏 (收藏、评论、点赞)
      Row() {
        Row() {
          Image($r('app.media.star'))
            .width(22)
            .height(22)
            .margin({ right: 4 })
          Text(this.publishItem.favoriteCount.toString())
        }
        Row() {
          Image($r('app.media.comment_one'))
            .width(22)
            .height(22)
            .margin({ right: 4 })
          Text(this.publishItem.commentCount.toString())
        }
        .margin({ left: 20 })
        Row() {
          Image($r('app.media.like'))
            .width(22)
            .height(22)
            .margin({ right: 4 })
          Text(this.publishItem.loveCount.toString())
        }
        .margin({ left: 20 })
      }
      .width('100%')
      .margin({ top: 12 })
      .justifyContent(FlexAlign.Start)

    }
    .width('100%')
    .padding(12)
    .backgroundColor(Color.White)
    .margin({ bottom: 8 }) // 给列表项之间添加间隔
  }
}