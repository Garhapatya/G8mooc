import  mainViewModel  from '../viewmodel/MainViewModel';
import CommunityTypeBean from '../common/bean/CommunityTypeBean';
import SquareText from '../view/SquareText';
import PublishItemView from './PublishItemView';
import PublishItem from '../common/bean/PublishItem';
@Component
export default struct CommunityView {
  // 状态变量：当前选中的一级分类索引和二级标签索引
  @State selectTypeIndex: number = 0;
  @State selectTagIndex: number = 0;

  // 顶部标题栏 Builder
  @Builder
  headTitle() {
    Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
      Image($r('app.media.remind'))
        .width(28)
        .height(28)
      Text('发现')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
      Image($r('app.media.avatar5'))
        .width(38)
        .height(38)
        .borderRadius(19)
    }
    .padding(8)
    .height(50)
    .width('100%')
    .backgroundColor(Color.White)
  }

  // 自定义TabBar Builder
  @Builder
  customTabBar(title: string, index: number) {
    Column() {
      Text(title)
        .fontSize(16)
        .fontColor(this.selectTypeIndex === index ? '#007AFF' : '#000000') // 选中蓝色，未选中黑色
      if (this.selectTypeIndex === index) {
        Image($r('app.media.minus'))
          .width(20)
          .height(10)
      }
    }
    .height(50)
    .width(60)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      // 1. 顶部标题栏
      this.headTitle()

      // 2. 一级分类 Tabs
      Tabs({ barPosition: BarPosition.Start }) {
        ForEach(mainViewModel.getCommunityTypeList(), (typeItem: CommunityTypeBean) => {
          TabContent() {
            this.BuildTabContent(typeItem)
          }
          .tabBar(this.customTabBar(typeItem.type, typeItem.typeId))
        })
      }
      .barMode(BarMode.Scrollable)
      .onChange((index: number) => {
        // 切换一级分类时，重置二级标签的选中状态为0（"全部"）
        this.selectTypeIndex = index;
        this.selectTagIndex = 0;
      })
      .width('100%')
      .flexGrow(1) // 占据剩余空间

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5') // 设置整个页面的背景色
  }
  @Builder
  BuildTabContent(typeItem: CommunityTypeBean) {
    Column() {
      // 3. 二级标签 Horizontal List
      List() {
        ForEach(typeItem.tags, (tag: string, index: number) => {
          ListItem() {
            SquareText({
              title: tag,
              textColor: this.selectTagIndex === index ? '#007AFF' : '#000000' // 选中蓝色
            })
              .onClick(() => {
                this.selectTagIndex = index;
                // 这里可以添加根据选中标签过滤列表的逻辑
              })
          }
        })
      }
      .listDirection(Axis.Horizontal)
      .height(60)
      .width('100%')
      .padding({ left: 8, right: 8 })

      // 4. 发布内容 Vertical List - 修正类型
      List() {
        ForEach(mainViewModel.getPublishList(), (pubItem: PublishItem) => { // 明确指定pubItem类型
          ListItem() {
            PublishItemView({ publishItem: pubItem })
          }
        }, (pubItem: PublishItem) => JSON.stringify(pubItem.itemId)) // 明确指定key生成函数的参数类型
      }
      .width('100%')
      .layoutWeight(1)
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
    .height('100%')
  }
}