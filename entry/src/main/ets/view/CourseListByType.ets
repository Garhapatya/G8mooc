// view/CourseListByType.ets

import { CourseCell } from '../common/components/CourseCell'
import { CourseListDataSource } from '../viewmodel/CourseListDataSource'
import { CourseItem } from '../common/bean/CourseItem'
// 在CourseListByType.ets顶部添加导入
import { generateCourseData } from '../viewmodel/CourseDataGenerator';
@Component
export default struct CourseListByType {
  // 使用@Prop装饰器接收数据源
  @Prop dataSource: CourseListDataSource;

  // 触摸相关变量
  private startTouchOffsetY: number = 0;
  private endTouchOffsetY: number = 0;

  // 明确的键生成函数
  private keyGenerator(item: CourseItem, index: number): string {
    return `course_${item.title}_${index}`;
  }

  build() {
    Row() {
      List() {
        LazyForEach(this.dataSource, (item: CourseItem, index: number) => {
          ListItem() {
            CourseCell({
              course: item
            })
          }
          .onTouch((event: TouchEvent) => {
            switch (event.type) {
              case TouchType.Down:
                this.startTouchOffsetY = event.touches[0].y;
                break;
              case TouchType.Up:
                this.endTouchOffsetY = event.touches[0].y;
                // 检查是否向上滑动足够距离
                if (this.startTouchOffsetY - this.endTouchOffsetY > 100) {
                  this.dataSource.addMoreData(generateCourseData()); // 使用正确的方法名
                }
                break;
            }
          })
        }, (item: CourseItem, index: number) => this.keyGenerator(item, index))
      }
      .width('100%')
      .divider({ strokeWidth: 1, color: '#f1f3f5' })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .padding(10)
  }
}