// 封装社区发现下面的一级和二级分类
export default class CommunityTypeBean {
  typeId: number = 0; // 分类id
  type: string = ''; // 分类名
  tags: Array<string> = []; // 二级分类（标签列表）
}