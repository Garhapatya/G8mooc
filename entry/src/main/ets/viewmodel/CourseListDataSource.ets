// viewmodel/CourseListDataSource.ets

import { CourseItem } from '../common/bean/CourseItem';
import type IDataSource from '@ohos.base';

// 明确定义DataChangeListener接口
interface DataChangeListener {
  onDataReloaded(): void;
  onDataAdd(index: number): void;
  onDataMove(from: number, to: number): void;
  onDataDelete(index: number): void;
  onDataChange(index: number): void;
}

export class CourseListDataSource implements IDataSource {
  public dataArray: CourseItem[] = [];
  private filteredData: CourseItem[] = [];
  private listeners: DataChangeListener[] = [];
  private currentCategory: string = 'all';
  private currentSort: string = 'default';
  private priceOrder: string = 'desc';

  constructor(dataArray: CourseItem[]) {
    this.refreshData(dataArray);
  }

  totalCount(): number {
    return this.filteredData.length;
  }

  getData(index: number): CourseItem {
    if (index < 0 || index >= this.filteredData.length) {
      return this.getDefaultCourseItem();
    }
    return this.filteredData[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach((listener: DataChangeListener) => {
      listener.onDataAdd(index);
    });
  }

  notifyDataReload(): void {
    this.listeners.forEach((listener: DataChangeListener) => {
      listener.onDataReloaded();
    });
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach((listener: DataChangeListener) => {
      listener.onDataDelete(index);
    });
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach((listener: DataChangeListener) => {
      listener.onDataChange(index);
    });
  }

  // 按分类过滤数据
  public filterByCategory(categoryId: number): void {
    const categories: string[] = [
      '编程开发', '人工智能', '运维',
      '认证考试', '软件测试', '前沿技术'
    ];

    if (categoryId === -1 || categoryId >= categories.length) {
      this.currentCategory = 'all';
      this.filteredData = [...this.dataArray];
    } else {
      this.currentCategory = categories[categoryId];
      this.filteredData = this.dataArray.filter((item: CourseItem) =>
      item.category === this.currentCategory || item.type === this.currentCategory
      );
    }
    this.applyCurrentSort();
    this.notifyDataReload();
  }

  // 排序数据
  public sortData(sortType: string, order: string = 'desc'): void {
    this.currentSort = sortType;
    this.priceOrder = order;
    this.applyCurrentSort();
    this.notifyDataReload();
  }

  // 应用当前排序
  private applyCurrentSort(): void {
    switch (this.currentSort) {
      case '人气':
        this.filteredData.sort((a: CourseItem, b: CourseItem) => b.students - a.students);
        break;
      case '好评率':
        this.filteredData.sort((a: CourseItem, b: CourseItem) => b.rating - a.rating);
        break;
      case '价格':
        if (this.priceOrder === 'asc') {
          this.filteredData.sort((a: CourseItem, b: CourseItem) => a.price - b.price);
        } else {
          this.filteredData.sort((a: CourseItem, b: CourseItem) => b.price - a.price);
        }
        break;
      case '综合':
      default:
      // 默认按ID排序
        this.filteredData.sort((a: CourseItem, b: CourseItem) => a.id - b.id);
        break;
    }
  }

  public addMoreData(courseDataArray: CourseItem[]): void {
    const startIndex = this.dataArray.length;

    courseDataArray.forEach((element: CourseItem, index: number) => {
      const newItem: CourseItem = {
        id: startIndex + index + 1,
        title: element.title,
        img: element.img,
        desc: element.desc,
        price: element.price,
        students: element.students,
        type: element.type,
        rating: element.rating,
        category: element.category
      };
      this.dataArray.push(newItem);
    });

    // 重新应用当前过滤和排序
    this.filterByCategory(this.getCurrentCategoryId());
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  public refreshData(courseDataArray: CourseItem[]): void {
    this.dataArray = [];

    courseDataArray.forEach((element: CourseItem, index: number) => {
      const newItem: CourseItem = {
        id: index + 1,
        title: element.title,
        img: element.img,
        desc: element.desc,
        price: element.price,
        students: element.students,
        type: element.type,
        rating: element.rating,
        category: element.category
      };
      this.dataArray.push(newItem);
    });

    // 应用当前过滤
    this.filterByCategory(this.getCurrentCategoryId());
  }

  public deleteItem(id: number): void {
    let delIdx = -1;
    for (let index = 0; index < this.dataArray.length; index++) {
      if (this.dataArray[index].id === id) {
        delIdx = index;
        this.dataArray.splice(delIdx, 1);

        // 重新过滤数据
        this.filterByCategory(this.getCurrentCategoryId());
        break;
      }
    }
  }

  // 获取当前分类ID
  private getCurrentCategoryId(): number {
    const categories: string[] = [
      '编程开发', '人工智能', '运维',
      '认证考试', '软件测试', '前沿技术'
    ];

    if (this.currentCategory === 'all') {
      return -1;
    }

    return categories.indexOf(this.currentCategory);
  }

  // 提供默认的 CourseItem 对象
  private getDefaultCourseItem(): CourseItem {
    return {
      id: -1,
      title: '未知课程',
      img: $r('app.media.default_course'),
      desc: '课程描述不可用',
      price: 0,
      students: 0,
      type: '未知类型',
      rating: 0,
      category: '未知分类'
    };
  }
}