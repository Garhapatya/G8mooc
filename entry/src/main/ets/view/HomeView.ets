import Home from './Home';
import HomeITContent from './HomeITContent';

@Component
export default struct HomeView {
  build() {
    Tabs() {
      // 推荐页
      TabContent() {
        Home()
      }
      .tabBar('推荐')

      // IT·互联网页
      TabContent() {
        HomeITContent()
      }
      .tabBar('IT·互联网')

      // 设计·创造页
      TabContent() {
        Text('设计·创造页面内容')
          .fontSize(20)
      }
      .tabBar('设计·创造')

      // 考试·考证页
      TabContent() {
        Text('考试·考证页面内容')
          .fontSize(20)
      }
      .tabBar('考试·考证')
    }
    .barMode(BarMode.Fixed)
    .barWidth('100%')
    .barHeight(50)
  }
}