// common/bean/CourseItem.ts

export interface CourseItem {
  id: number;
  title: string;
  img: Resource;
  desc: string;
  price: number;
  students: number;
  type: string;
  rating: number;
  category?: string; // 添加分类字段
}