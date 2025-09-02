

import CommonConstants from '../common/constants/CommonConstants';
import MainViewModel from '../viewmodel/MainViewModel';
import HomeItemBean from '../common/bean/HomeItemBean';
import CampBean from '../common/bean/CampBean';
import CourseBean from '../common/bean/CourseBean';

@Component
export default struct Home {
  private swiperController: SwiperController = new SwiperController();

  // 封装训练营Cell
  @Builder
  trainCampCell(item: CampBean): void {
    Column({ space: 2 }) {
      Image(item.img)
        .width(150)
        .height(95)
        .borderRadius(8)
        .margin(2)

      Text(item.title)
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .width('100%')

      Row({ space: 2 }) {
        Text(`${item.days}天营`)
          .fontSize(12)
          .width('40%')
          .backgroundColor(Color.Orange)
          .fontColor(Color.White)
          .borderRadius(5)
          .padding(4)

        Text(`${item.startDate}开始`)
          .fontSize(12)
          .width('60%')
          .backgroundColor(Color.Pink)
          .borderRadius(5)
          .padding(4)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')

      Row() {
        Text(`¥${item.price}元`)
          .fontSize(14)
          .fontColor(Color.Red)

        Text(item.orgName)
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

  // 封装热门课程Cell
  @Builder
  hotCourseCell(item: CourseBean): void {
    Row({ space: 8 }) {
      Image(item.img)
        .width(80)
        .height(80)
        .borderRadius(8)

      Column({ space: 4 }) {
        Text(item.title)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Text(item.desc)
          .fontSize(12)
          .width('100%')
          .maxLines(2)

        Text(`¥${item.price}元`)
          .fontSize(14)
          .fontColor(Color.Red)

        Row() {
          Text(`最近在学：${item.students}`)
            .fontSize(12)
            .fontColor(Color.Blue)
        }
        .width('100%')
      }
      .width('60%')
    }
    .padding(8)
    .width('100%')
    .backgroundColor(Color.White)
  }

  build() {
    Scroll() {
      Column({ space: 15 }) {
        // 标题
        Text('首页')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .width('90%')

        // 轮播图
        Swiper(this.swiperController) {
          ForEach(MainViewModel.getHomeSwiperImage(), (img: Resource) => {
            Image(img)
              .width('90%')
              .height(150)
              .borderRadius(10)
          }, (img: Resource): string => JSON.stringify(img))
        }
        .autoPlay(true)
        .height(160)

        // 常用功能列表
        Grid() {
          ForEach(MainViewModel.getHomeItemBeanList(), (item: HomeItemBean) => {
            GridItem() {
              Column() {
                Image(item.icon)
                  .width(40)
                  .height(40)
                Text(item.title)
                  .fontSize(12)
                  .margin({ top: 3 })
                  .maxLines(1)
              }
              .width('100%')
              .height(80)
              .justifyContent(FlexAlign.Center)
            }
          }, (item: HomeItemBean): string => JSON.stringify(item))
        }
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap(8)
        .rowsGap(8)
        .height(180)
        .width('90%')
        .backgroundColor(Color.White)
        .borderRadius(15)

        // 速成训练营标题
        Row() {
          Text('速成训练营')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)

          Row() {
            Text('查看更多')
              .fontSize(14)
            Image($r('app.media.right'))
              .width(16)
              .height(16)
          }
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('90%')

        // 训练营列表
        List() {
          ForEach(MainViewModel.getCampList(), (item: CampBean) => {
            ListItem() {
              this.trainCampCell(item)
            }
          }, (item: CampBean): string => JSON.stringify(item))
        }
        .listDirection(Axis.Horizontal)
        .width('90%')
        .height(200)

        // 热门课程标题
        Row() {
          Text('热门课程')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)

          Row() {
            Text('查看更多')
              .fontSize(14)
            Image($r('app.media.right'))
              .width(16)
              .height(16)
          }
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('90%')

        // 热门课程列表
        List() {
          ForEach(MainViewModel.getHotCourseList(), (item: CourseBean) => {
            ListItem() {
              this.hotCourseCell(item)
            }
          }, (item: CourseBean): string => JSON.stringify(item))
        }
        .width('90%')
        .backgroundColor(Color.White)
        .borderRadius(12)
      }
      .width(CommonConstants.FULL_WIDTH)
      .alignItems(HorizontalAlign.Center)
    }
    .backgroundColor('#f1f3f5')
  }
}