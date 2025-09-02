// entry/src/main/ets/view/CourseView.ets
import  mainViewModel  from '../viewmodel/MainViewModel';
import CourseCard from '../common/components/CourseCard';
import CourseItem from '../common/bean/CourseItem1';

@Component
export default struct CourseView {
  @State currentCategoryIndex: number = 0;
  @State courseList: CourseItem[] = [];

  aboutToAppear() {
    this.loadCourses();
  }

  // 加载课程数据
  loadCourses() {
    const categories = mainViewModel.getCourseCategories();
    const currentCategory = categories[this.currentCategoryIndex];
    this.courseList = mainViewModel.getCourseList(currentCategory);
  }

  // 分类标签Builder
  @Builder
  categoryTab(title: string, index: number) {
    Column() {
      Text(title)
        .fontSize(14)
        .fontColor(this.currentCategoryIndex === index ? '#ff1c1b39' : '#666666')
        .fontWeight(this.currentCategoryIndex === index ? FontWeight.Bold : FontWeight.Normal)

      if (this.currentCategoryIndex === index) {
        Divider()
          .color('#ff1c1b39')
          .strokeWidth(2)
          .margin({ top: 4 })
      }
    }
    .padding({ left: 12, right: 12, top: 8, bottom: 8 })
    .onClick(() => {
      this.currentCategoryIndex = index;
      this.loadCourses();
    })
  }

  build() {
    Column() {
      // 分类导航
      Scroll() {
        Row() {
          ForEach(mainViewModel.getCourseCategories(), (category: string, index: number) => {
            this.categoryTab(category, index)
          })
        }
        .padding({ left: 12, right: 12 })
      }
      .scrollable(ScrollDirection.Horizontal)
      .height(50)
      .backgroundColor(Color.White)

      // 课程列表
      Scroll() {
        Grid() {
          ForEach(this.courseList, (course: CourseItem) => {
            GridItem() {
              CourseCard({ courseItem: course })
                .onClick(() => {
                  // 跳转到课程详情页
                  // router.pushUrl({ url: 'pages/CourseDetailPage' })
                })
            }
          })
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap(12)
        .rowsGap(12)
        .padding(12)
      }
      .scrollable(ScrollDirection.Vertical)
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f1f3f5')
  }
}