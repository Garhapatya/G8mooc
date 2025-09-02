import CommonConstants from '../common/constants/CommonConstants';
import MainViewModel from '../viewmodel/MainViewModel';
import CourseBean from '../common/bean/CourseBean';

@Component
export default struct MineView {
  // 头像及横向菜单构建器
  @Builder
  myAvatar(): void {
    Column() {




      Row() {
        Image($r('app.media.avatar5'))
          .width(50)
          .height(50)
          .borderRadius(25)
          .margin({ left: 8 })

        Column() {
          Text('G8MOOC')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
          Text('但有绿杨树系马，处处有路透长安！')
            .fontSize(12)
            .maxLines(1)
        }
        .alignItems(HorizontalAlign.Start)
        .width('70%')

        Image($r('app.media.right'))
          .width(24)
          .height(24)
      }
      .width('100%')
      .margin({ top: 8, bottom: 8 })
      .justifyContent(FlexAlign.SpaceBetween)

      // 功能菜单行
      Row() {
        Column() {
          Image($r('app.media.order'))
            .width(30)
            .height(30)
            .margin({ bottom: 4 })
          Text('我的订单')
            .fontSize(12)
        }

        Column() {
          Image($r('app.media.love'))
            .width(30)
            .height(30)
            .margin({ bottom: 4 })
          Text('我的收藏')
            .fontSize(12)
        }

        Column() {
          Image($r('app.media.money'))
            .width(30)
            .height(30)
            .margin({ bottom: 4 })
          Text('我的学币')
            .fontSize(12)
        }

        Column() {
          Image($r('app.media.myshequ'))
            .width(30)
            .height(30)
            .margin({ bottom: 4 })
          Text('我的社区')
            .fontSize(12)
        }
      }
      .width('100%')
      .margin({ bottom: 10 })
      .justifyContent(FlexAlign.SpaceAround)
    }
    .width('95%')
    .backgroundColor(Color.White)
    .borderRadius(10)
    .padding(10)
  }

  // 最近看过课程构建器
  @Builder
  recentCourses(): void {
    Column() {
      // 标题行
      Row() {
        Text('最近看过')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
        Image($r('app.media.right'))
          .width(16)
          .height(16)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: 10 })

      // 课程列表
      List() {
        ForEach(MainViewModel.getMyRecentCourse(), (courseItem: CourseBean) => {
          ListItem() {
            Column() {
              Image(courseItem.img)
                .width(120)
                .height(80)
                .borderRadius(4)
                .margin({ bottom: 5 })
              Text(courseItem.title)
                .fontSize(12)
                .fontWeight(FontWeight.Bold)
                .maxLines(1)
                .width(120)
            }
            .padding(5)
          }
        }, (courseItem: CourseBean): string => JSON.stringify(courseItem))
      }
      .listDirection(Axis.Horizontal)
      .height(120)
    }
    .width('95%')
    .backgroundColor(Color.White)
    .borderRadius(10)
    .padding(10)
    .margin({ top: 10 })
  }

  // 菜单列表构建器
  @Builder
  myMenuList(): void {
    Column() {
      // 我的点赞
      Row() {
        Row() {
          Image($r('app.media.dianzhan'))
            .width(20)
            .height(20)
        }
        .borderColor(Color.Orange)
        .borderWidth(1)
        .borderRadius(12)
        .backgroundColor(Color.Orange)
        .padding(2)

        Text('我的点赞')
          .fontSize(14)
          .margin({ left: 8 })
          .width('80%')

        Image($r('app.media.right'))
          .width(16)
          .height(16)
      }
      .width('100%')
      .margin({ top: 8, bottom: 8 })
      .justifyContent(FlexAlign.SpaceBetween)

      // 我的兴趣
      Row() {
        Row() {
          Image($r('app.media.xingqu'))
            .width(20)
            .height(20)
        }
        .borderColor(Color.Orange)
        .borderWidth(1)
        .borderRadius(12)
        .backgroundColor(Color.Orange)
        .padding(2)

        Text('我的兴趣')
          .fontSize(14)
          .margin({ left: 8 })
          .width('80%')

        Image($r('app.media.right'))
          .width(16)
          .height(16)
      }
      .width('100%')
      .margin({ top: 8, bottom: 8 })
      .justifyContent(FlexAlign.SpaceBetween)

      // 我的评论
      Row() {
        Row() {
          Image($r('app.media.pinglun'))
            .width(20)
            .height(20)
        }
        .borderColor(Color.Orange)
        .borderWidth(1)
        .borderRadius(12)
        .backgroundColor(Color.Orange)
        .padding(2)

        Text('我的评论')
          .fontSize(14)
          .margin({ left: 8 })
          .width('80%')

        Image($r('app.media.right'))
          .width(16)
          .height(16)
      }
      .width('100%')
      .margin({ top: 8, bottom: 8 })
      .justifyContent(FlexAlign.SpaceBetween)

      // 我的打卡
      Row() {
        Row() {
          Image($r('app.media.daka'))
            .width(20)
            .height(20)
        }
        .borderColor(Color.Orange)
        .borderWidth(1)
        .borderRadius(12)
        .backgroundColor(Color.Orange)
        .padding(2)

        Text('我的打卡')
          .fontSize(14)
          .margin({ left: 8 })
          .width('80%')

        Image($r('app.media.right'))
          .width(16)
          .height(16)
      }
      .width('100%')
      .margin({ top: 8, bottom: 8 })
      .justifyContent(FlexAlign.SpaceBetween)

      // 联系客服
      Row() {
        Row() {
          Image($r('app.media.kefu'))
            .width(20)
            .height(20)
        }
        .borderColor(Color.Orange)
        .borderWidth(1)
        .borderRadius(12)
        .backgroundColor(Color.Orange)
        .padding(2)

        Text('联系客服')
          .fontSize(14)
          .margin({ left: 8 })
          .width('80%')

        Image($r('app.media.right'))
          .width(16)
          .height(16)
      }
      .width('100%')
      .margin({ top: 8, bottom: 8 })
      .justifyContent(FlexAlign.SpaceBetween)

      // 隐私
      Row() {
        Row() {
          Image($r('app.media.yinsi'))
            .width(20)
            .height(20)
        }
        .borderColor(Color.Orange)
        .borderWidth(1)
        .borderRadius(12)
        .backgroundColor(Color.Orange)
        .padding(2)

        Text('隐私')
          .fontSize(14)
          .margin({ left: 8 })
          .width('80%')

        Image($r('app.media.right'))
          .width(16)
          .height(16)
      }
      .width('100%')
      .margin({ top: 8, bottom: 8 })
      .justifyContent(FlexAlign.SpaceBetween)

      // 设置
      Row() {
        Row() {
          Image($r('app.media.shezhi'))
            .width(20)
            .height(20)
        }
        .borderColor(Color.Orange)
        .borderWidth(1)
        .borderRadius(12)
        .backgroundColor(Color.Orange)
        .padding(2)

        Text('设置')
          .fontSize(14)
          .margin({ left: 8 })
          .width('80%')

        Image($r('app.media.right'))
          .width(16)
          .height(16)
      }
      .width('100%')
      .margin({ top: 8, bottom: 8 })
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('95%')
    .backgroundColor(Color.White)
    .borderRadius(10)
    .padding(10)
    .margin({ top: 10 })
  }

  build() {
    Scroll() {
      Column({ space: 10 }) {
        // 消息及二维码扫码
        Row() {
          Badge({
            count: 1,
            style: { badgeSize: 6, badgeColor: '#FA2A2D' }
          })
          Image($r('app.media.message_one'))
            .width(24)
            .height(24)
            .margin({ right: 12 })

          Image($r('app.media.scan_code'))
            .width(24)
            .height(24)
        }
        .margin({ top: 8, bottom: 8 })
        .width('95%')
        .justifyContent(FlexAlign.End)

        // 头像及横向菜单
        this.myAvatar()

        // 最近看过
        this.recentCourses()

        // 菜单列表
        this.myMenuList()
      }
      .width(CommonConstants.FULL_WIDTH)
      .alignItems(HorizontalAlign.Center)
    }
    .backgroundColor('#f1f3f5')
  }
}