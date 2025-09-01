import HomeItemBean from '../common/bean/HomeItemBean';
import CampBean from '../common/bean/CampBean';
import CourseBean from '../common/bean/CourseBean';
import CourseTypeBean from '../common/bean/CourseTypeBean';

export class MainViewModel {
  // 获取课程的二级分类
  static getSubType4Cat(): Array<CourseTypeBean> {
    let courseTypeList: CourseTypeBean[] = [
      new CourseTypeBean(0, '编程开发'),
      new CourseTypeBean(1, '人工智能'),
      new CourseTypeBean(2, '运维'),
      new CourseTypeBean(3, '认证考试'),
      new CourseTypeBean(4, '软件测试'),
      new CourseTypeBean(5, '前沿技术')
    ];
    return courseTypeList;
  }

  // 获取轮播图数据
  getHomeSwiperImage(): Array<Resource> {
    let swiperImages: Resource[] = [
      $r('app.media.swiper1'),
      $r('app.media.swiper2'),
      $r('app.media.swiper3'),
      $r('app.media.swiper4'),
      $r('app.media.swiper5'),
      $r('app.media.swiper6')
    ];
    return swiperImages;
  }

  // 获取常用功能列表数据
  getHomeItemBeanList(): Array<HomeItemBean> {
    let homeItems: HomeItemBean[] = [
      new HomeItemBean('狂飙英语', $r('app.media.itm1')),
      new HomeItemBean('冲刺考研', $r('app.media.itm2')),
      new HomeItemBean('写作宝典', $r('app.media.itm3')),
      new HomeItemBean('职场充电', $r('app.media.itm4')),
      new HomeItemBean('免费课程', $r('app.media.itm5')),
      new HomeItemBean('设计课堂', $r('app.media.itm6')),
      new HomeItemBean('出国留学', $r('app.media.itm7')),
      new HomeItemBean('直播课程', $r('app.media.itm8')),
      new HomeItemBean('IT技术', $r('app.media.itm9')),
      new HomeItemBean('软考课堂', $r('app.media.itm10'))
    ];
    return homeItems;
  }

  // 获取训练营数据
  getCampList(): Array<CampBean> {
    let campList: CampBean[] = [
      new CampBean('7天Java速成', $r('app.media.course01'), 7, '7月26日', 888.00, '张老师', 100),
      new CampBean('2天职场小白变老油条', $r('app.media.course02'), 2, '7月27日', 1888.00, '李老师', 120),
      new CampBean('无师自通Excel', $r('app.media.course03'), 3, '7月28日', 2888.00, '王老师', 130),
      new CampBean('PS不求人', $r('app.media.course04'), 3, '7月29日', 88.00, '宏图教育', 105),
      new CampBean('4天鸿蒙扫盲', $r('app.media.course05'), 4, '7月30日', 8888.00, '大展教育', 1009)
    ];
    return campList;
  }

  // 获取热门课程数据
  getHotCourseList(): Array<CourseBean> {
    let hotCourseList: CourseBean[] = [
      new CourseBean('Java从入门到陌生', $r('app.media.course09'), 'hot course! good good!', 2888.00, 115),
      new CourseBean('职场小白必修课', $r('app.media.course08'), 'hot course! good good!', 1888.00, 511),
      new CourseBean('Spring Boot Quick Start', $r('app.media.course07'), 'hot course! good good!', 888.00, 5555),
      new CourseBean('英语直通车', $r('app.media.course06'), 'hot course! good good!', 288.00, 5666),
      new CourseBean('留学秘籍', $r('app.media.course05'), 'hot course! good good!', 888.00, 7775),
      new CourseBean('好习惯才有好运气', $r('app.media.course04'), 'hot course! good good!', 88.00, 9005)
    ];
    return hotCourseList;
  }

  // 获取IT类训练营数据
  getITCampList(): Array<CampBean> {
    let campList: CampBean[] = [
      new CampBean('7天Python速成', $r('app.media.course06'), 7, '8月26日', 888.00, '张老师', 100),
      new CampBean('2天SpringBoot入门', $r('app.media.course07'), 2, '8月27日', 1888.00, '李老师', 120),
      new CampBean('无师自通C++', $r('app.media.course08'), 3, '9月28日', 2888.00, '王老师', 130),
      new CampBean('Hadoop无所不能', $r('app.media.course09'), 3, '9月29日', 88.00, '宏图教育', 105),
      new CampBean('5天鸿蒙应用开发', $r('app.media.course03'), 4, '10月30日', 8888.00, '大展教育', 1009)
    ];
    return campList;
  }

  // 获取IT互联网课程二级分类
  getCourseType4ITContent(): Array<CourseTypeBean> {
    let courseTypeList: CourseTypeBean[] = [
      new CourseTypeBean(0, '全部'),
      new CourseTypeBean(1, 'Java开发'),
      new CourseTypeBean(2, 'C/C++'),
      new CourseTypeBean(3, '后台开发'),
      new CourseTypeBean(4, '前端开发'),
      new CourseTypeBean(5, '认证考试'),
      new CourseTypeBean(6, '运维'),
      new CourseTypeBean(7, '软件测试')
    ];
    return courseTypeList;
  }

  // 获取IT类课程数据
  getITCourseList(): Array<CourseBean> {
    let courseList: CourseBean[] = [
      new CourseBean('Hadoop从入门到陌生', $r('app.media.course01'), '分布式系统实战', 2888.00, 115),
      new CourseBean('Java必修课', $r('app.media.course03'), 'Java核心技术精讲', 1888.00, 511),
      new CourseBean('Spring Boot Quick Start', $r('app.media.course05'), '快速上手SpringBoot', 888.00, 5555),
      new CourseBean('软考入门', $r('app.media.course07'), '软考认证培训', 288.00, 5666),
      new CourseBean('鸿蒙应用开发指南', $r('app.media.course09'), '鸿蒙应用开发实战', 888.00, 7775),
      new CourseBean('鸿蒙设备开发', $r('app.media.course02'), '鸿蒙设备开发入门', 88.00, 9005)
    ];
    return courseList;
  }
}
export default new MainViewModel();