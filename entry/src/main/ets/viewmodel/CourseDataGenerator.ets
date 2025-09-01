// viewmodel/CourseDataGenerator.ets

import { CourseItem } from '../common/bean/CourseItem';

// 定义课程模板接口
interface CourseTemplate {
  title: string;
  desc: string;
  price: number;
  students: number;
  rating: number;
}

// 生成模拟课程数据
export function generateCourseData(): CourseItem[] {
  const categories: string[] = [
    '编程开发', '人工智能', '运维',
    '认证考试', '软件测试', '前沿技术'
  ];

  // 使用明确的类型声明
  const courseTemplates: CourseTemplate[] = [
    {
      title: 'Java大法好',
      desc: 'Java YYDS',
      price: 1888.88,
      students: 39999,
      rating: 4.8
    },
    {
      title: 'Python大法好',
      desc: 'Python YYDS',
      price: 888.88,
      students: 3999,
      rating: 4.5
    },
    {
      title: '算法出神入化',
      desc: '算法 YYDS',
      price: 888.88,
      students: 9999,
      rating: 4.9
    },
    {
      title: '互联网大厂必修课',
      desc: '互联网大厂不求人',
      price: 188.88,
      students: 399,
      rating: 4.2
    },
    {
      title: 'Hadoop实践',
      desc: 'Hadoop YYDS',
      price: 1888.88,
      students: 39999,
      rating: 4.7
    }
  ];

  const result: CourseItem[] = [];
  let id = 1;

  categories.forEach((category: string, categoryIndex: number) => {
    // 每个分类3-5门课程
    const courseCount = 3 + (categoryIndex % 3);

    for (let i = 0; i < courseCount; i++) {
      const templateIndex = (categoryIndex + i) % courseTemplates.length;
      const template: CourseTemplate = courseTemplates[templateIndex];
      const priceMultiplier = 0.8 + (categoryIndex * 0.2);
      const studentMultiplier = 0.7 + (categoryIndex * 0.3);

      // 创建明确的CourseItem对象
      const courseItem: CourseItem = {
        id: id++,
        title: `${category}-${template.title}`,
        img: $r(`app.media.course${(id % 8) + 1}`),
        desc: template.desc,
        price: Math.round(template.price * priceMultiplier),
        students: Math.floor(template.students * studentMultiplier),
        type: category,
        rating: template.rating - (i * 0.1),
        category: category
      };

      result.push(courseItem);
    }
  });

  return result;
}