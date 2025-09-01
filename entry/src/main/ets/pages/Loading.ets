import CommonConstants from '../common/constants/CommonConstants';
import router from '@ohos.router';

@Entry
@Component
struct Loading {
  @State userName: string = '用户';
  @State progressValue: number = 0;
  private timerId: number = 0;

  aboutToAppear(): void {
    // 简洁的类型安全方式
    const params = router.getParams() as Record<string, string> | null;
    if (params?.['userNameParam']) {
      this.userName = params['userNameParam'];
    }

    this.timerId = setInterval((): void => {
      if (this.progressValue < 100) {
        this.progressValue += 10;
      } else {
        clearInterval(this.timerId);
      }
    }, 300) as number;

    setTimeout((): void => {
      clearInterval(this.timerId);
      router.pushUrl({ url: 'pages/MainPage' })
        .then((): void => console.info('跳转成功'))
        .catch((err: Error): void => console.error('跳转失败:', err.message));
    }, 3000);
  }

  aboutToDisappear(): void {
    if (this.timerId) {
      clearInterval(this.timerId);
    }
  }

  build() {
    Column() {
      Text(`[${this.userName}]您好，系统正在登录...`)
        .fontSize(20)
        .margin({ bottom: 30 })

      Progress({ value: this.progressValue, total: 100, type: ProgressType.Linear })
        .width('80%')
        .height(10)
        .backgroundColor('#e0e0e0')
        .color(Color.Blue)

      Text(`${this.progressValue}%`)
        .fontSize(16)
        .margin({ top: 10 })
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}