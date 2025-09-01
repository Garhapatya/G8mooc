// view/SubCatCourseList.ets

import CourseListByType from './CourseListByType'
import { CourseListDataSource } from '../viewmodel/CourseListDataSource'
import { generateCourseData } from '../viewmodel/CourseDataGenerator'

@Component
export default struct SubCatCourseList {
  // 使用@Prop装饰器接收参数
  @Prop subCatId: number;
  private sortType: string = '综合';
  private priceOrder: string = '降序';
  private dataSource: CourseListDataSource = new CourseListDataSource(generateCourseData());

  aboutToAppear() {
    // 根据分类ID过滤数据
    this.dataSource.filterByCategory(this.subCatId);
  }

  onChanges() {
    // 当排序参数变化时重新排序
    this.dataSource.sortData(this.sortType, this.priceOrder === '降序' ? 'desc' : 'asc');
  }

  build() {
    Column() {
      CourseListByType({
        dataSource: this.dataSource
      })
      Text('--我是有底线的--')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ top: 20, bottom: 30 })
    }
    .width('100%')
  }
}