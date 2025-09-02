// entry/src/main/ets/bean/CourseItem.ets
export default class CourseItem {
  courseId: number = 0; // 课程ID
  title: string = ''; // 课程标题
  description: string = ''; // 课程描述
  price: number = 0; // 课程价格
  originalPrice: number = 0; // 原价
  studentsCount: number = 0; // 在学人数
  image: Resource = $r('app.media.default_course'); // 课程图片
  category: string = ''; // 课程分类
  teacher: string = ''; // 讲师名称
  teacherAvatar: Resource = $r('app.media.avatar1'); // 讲师头像
  rating: number = 0; // 评分
  isHot: boolean = false; // 是否热门
  isRecommended: boolean = false; // 是否推荐
}