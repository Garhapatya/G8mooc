/**
 * 社区功能主页
 */

import CommonConstants from '../common/constants/CommonConstants';
import HomeView from '../view/HomeView';
import mainViewModel from '../viewmodel/MainViewModel';
import CommunityView from '../view/CommunityView';
import MineView from '../view/MineView';

import CourseView from '../view/CourseView';

@Entry
@Component
struct MainPage {
  @State index: number = 0;
  private tabsController: TabsController = new TabsController();

  @Builder
  baseTab(title: string, targetIndex: number): void {
    Column() {
      Text(this.index === targetIndex ? '●' : '○')
        .fontSize(16)
        .fontColor(this.index === targetIndex ? '#ff1c1b39' : '#ff8f8484')
      Text(title)
        .margin({ top: 4 })
        .fontSize(12)
        .fontColor(this.index === targetIndex ? '#ff1c1b39' : '#ff8f8484')
    }
    .margin({ top: 8 })
    .height(58)
    .width('100%')
    .onClick((): void => {
      this.index = targetIndex;
      this.tabsController.changeIndex(this.index);
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      // 首页
      TabContent() {
        HomeView()
      }
      .backgroundColor('#f1f3f5')
      .tabBar(this.baseTab('首页', 0))

      // 课程页（占位）
      TabContent() {
        CourseView()
      }
      .backgroundColor('#f1f3f5')
      .tabBar(this.baseTab('课程', 1))

      // 社区页 - 使用CommunityView组件
      //修改测试
      TabContent() {
        CommunityView()
      }
      .backgroundColor('#f1f3f5')
      .tabBar(this.baseTab('社区', 2))

      // 我的页 - 使用 MineView 组件
      TabContent() {
        MineView()
      }
      .backgroundColor('#f1f3f5')
      .tabBar(this.baseTab('我的', 3))
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
    .barHeight(60)
    .onChange((index: number): void => {
      this.index = index;
    })
  }


}