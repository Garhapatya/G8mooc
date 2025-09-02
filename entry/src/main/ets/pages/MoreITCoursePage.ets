// pages/MoreITCoursePage.ets

import router from '@ohos.router'
import  CourseTypeBean  from '../common/bean/CourseTypeBean'
import SubCatCourseList from '../view/SubCatCourseList'

@Entry
@Component
struct MoreITCoursePage {
  @State selectIndex: number = 0
  @State sortType: string = '综合'
  @State priceOrder: string = '降序'

  // 本地定义分类数据
  private subCategories: CourseTypeBean[] = [
    new CourseTypeBean(0, '编程开发'),
    new CourseTypeBean(1, '人工智能'),
    new CourseTypeBean(2, '运维'),
    new CourseTypeBean(3, '认证考试'),
    new CourseTypeBean(4, '软件测试'),
    new CourseTypeBean(5, '前沿技术')
  ];

  // 明确的键生成函数
  private keyGenerator(item: CourseTypeBean): string {
    return `category_${item.typeId}`;
  }

  // 顶部标题栏
  @Builder pageHeader() {
    Row() {
      Image($r('app.media.left'))
        .width(24)
        .height(24)
        .onClick(() => {
          router.back()
        })
      Text('IT互联网')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
      Image($r('app.media.search'))
        .width(24)
        .height(24)
        .onClick(() => {
          // 搜索功能
          console.log('点击搜索');
        })
    }
    .margin({ top: 8, bottom: 8 })
    .justifyContent(FlexAlign.SpaceBetween)
    .width('95%')
  }

  // 筛选工具栏
  @Builder filterToolbar() {
    Row() {
      // 综合/人气/好评率/价格筛选
      ForEach(['综合', '人气', '好评率', '价格'], (item: string) => {
        Text(item + (item === '价格' ? `[${this.priceOrder}]` : ''))
          .fontSize(14)
          .fontColor(this.sortType === item ? Color.Blue : Color.Black)
          .padding({ left: 8, right: 8 })
          .onClick(() => {
            this.onSortTypeChange(item);
          })
      }, (item: string) => `sort_${item}`)

      // 筛选图标
      Image($r('app.media.filter'))
        .width(20)
        .height(20)
        .margin({ left: 12 })
        .onClick(() => {
          console.log('点击筛选图标');
        })
    }
    .padding(12)
    .backgroundColor(Color.White)
    .borderRadius(8)
    .margin({ top: 8, bottom: 8 })
    .width('95%')
  }

  // 排序类型改变处理
  private onSortTypeChange(type: string) {
    if (type === '价格') {
      this.priceOrder = this.priceOrder === '升序' ? '降序' : '升序';
    }
    this.sortType = type;

    // 通知子组件重新排序
    this.notifySortChange();
  }

  // 显示筛选对话框
  private showFilterDialog() {
    // 这里应该显示一个筛选对话框
    console.log('显示筛选对话框');
    // 实际项目中应该使用自定义弹窗组件
  }

  // 通知排序变化（需要子组件实现）
  private notifySortChange() {
    // 这里需要通过某种方式通知SubCatCourseList重新排序
    // 可以使用@Provide/@Consume或者回调函数
  }

  // 定制TabBar
  @Builder customTabBar(title: string, index: number) {
    Column() {
      Text(title)
        .fontSize(16)
        .fontColor(this.selectIndex === index ? Color.Blue : Color.Black)
      if (this.selectIndex === index) {
        Image($r('app.media.minus'))
          .width(20)
          .height(4)
          .margin({ top: 4 })
      }
    }
    .height(60)
    .width(80)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      // 页面标题栏
      this.pageHeader()

      // 筛选工具栏
      this.filterToolbar()

      // 在Tabs的ForEach循环中使用@Prop方式
      Tabs() {
        ForEach(this.subCategories, (item: CourseTypeBean) => {
          TabContent() {
            // 使用@Prop方式传递subCatId
            SubCatCourseList({ subCatId: item.typeId })
          }
          .tabBar(this.customTabBar(item.type, item.typeId))
        }, (item: CourseTypeBean) => this.keyGenerator(item))
      }
      .barMode(BarMode.Scrollable)
      .onChange((index: number) => {
        this.selectIndex = index
      })
      .width('100%')
      .height('100%')
    }
    .backgroundColor('#f1f3f5')
    .width('100%')
    .height('100%')
  }
}