// 封装课程类型信息
export default class CourseTypeBean {
  typeId: number;
  type: string;

  constructor(typeId: number, type: string) {
    this.typeId = typeId;
    this.type = type;
  }
}