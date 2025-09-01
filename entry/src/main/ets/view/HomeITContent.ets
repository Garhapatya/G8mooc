import CommonConstants from '../common/constants/CommonConstants';
import MainViewModel from '../viewmodel/MainViewModel';
import CampBean from '../common/bean/CampBean';
import CourseTypeBean from '../common/bean/CourseTypeBean';
import CourseBean from '../common/bean/CourseBean';
import TrainCampCell from '../common/components/TrainCampCell';
import CourseQueryCondition from '../common/components/CourseQueryCondition';
import { CourseCell } from '../common/components/CourseCell';

@Component
export default struct HomeITContent {
  @State conditionSelect: number = 1;    // 默认综合查询
  @State priceOrderDesc: boolean = false;    // 价格降序
  @State courseTypeSelect: number = 0; // 当前选择的课程分类id

  build() {
    Scroll() {
      Column({ space: 15 }) {
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
          ForEach(MainViewModel.getITCampList(), (item: CampBean) => {
            ListItem() {
              TrainCampCell({ campItem: item })
            }
          }, (item: CampBean): string => JSON.stringify(item))
        }
        .listDirection(Axis.Horizontal)
        .width('90%')
        .height(200)

        // 推荐课程标题
        Row() {
          Text('推荐课程')
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

        // 课程查询条件控制栏
        CourseQueryCondition({
          selectIndex: $conditionSelect,
          order_desc: $priceOrderDesc
        })

        // 二级分类列表
        List() {
          ForEach(MainViewModel.getCourseType4ITContent(), (item: CourseTypeBean) => {
            ListItem() {
              Text(item.type)
                .width(80)
                .backgroundColor('#ffa2afbc')
                .fontColor(this.courseTypeSelect === item.typeId ? Color.Blue : Color.Black)
                .borderRadius(5)
                .margin(4)
                .padding(4)
                .textAlign(TextAlign.Center)
                .onClick((): void => {
                  this.courseTypeSelect = item.typeId;
                })
            }
          }, (item: CourseTypeBean): string => JSON.stringify(item))
        }
        .listDirection(Axis.Horizontal)
        .width('90%')
        .height(40)

        // 课程列表
        List() {
          ForEach(MainViewModel.getITCourseList(), (item: CourseBean) => {
            ListItem() {
              CourseCell({ course: item })
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