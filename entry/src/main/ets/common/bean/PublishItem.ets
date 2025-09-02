// 社区功能中发现列表项封装
export default class PublishItem {
  itemId: number = 0; // 发现列表的列表项id
  userId: string = ''; // 发布者id
  nickName: string = ''; // 发布者昵称
  userImage: Resource = $r("app.media.avatar1"); // 用户头像
  roleName: string = ''; // 角色、学生、讲师
  publishContent: string = ''; // 发布内容
  videoResource: Resource = $rawfile("video1.mp4"); // 发布的视频
  publishDate: string = ''; // 发布时间
  tags: string = ''; // 标签列表，比如：学习比较，打卡等等 #号分隔
  favoriteCount: number = 0; // 收藏数
  commentCount: number = 0; // 评论数
  loveCount: number = 0; // 点赞数
  previewImage: Resource = $r("app.media.videoprivew1"); // 视频海报/预览图
}