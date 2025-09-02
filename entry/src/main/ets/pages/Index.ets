/**
 * 登录页
 */

import CommonConstants from '../common/constants/CommonConstants';
import Logger from '../common/utils/Logger';
import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State userName: string = '';
  @State password: string = '';
  @State isSelect: boolean = false;

  private userNameCheckReg = /^[3|4|5|6|7|8|9][0-9]{9}$/; // 手机号校验规则

  build() {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.SpaceAround,
      alignItems: ItemAlign.Center
    }) {
      // 标题
      Text($r('app.string.App_title'))
        .fontSize($r('app.float.login_title_font_size'))
        .fontWeight(FontWeight.Bold)

      // 输入区域
      Column() {
        // 用户名输入框
        TextInput({ placeholder: $r('app.string.Login_UserName') })
          .height($r('app.float.login_input_height'))
          .margin({ top: $r('app.float.login_input_margin_top') })
          .onChange((value: string) => {
            this.userName = value;
          })

        // 用户名校验提示
        if (!this.userNameCheckReg.test(this.userName) && this.userName !== '') {
          Text($r('app.string.user_name_error_message'))
            .fontSize($r('app.float.login_error_message_font_size'))
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Red)
            .width(CommonConstants.CONTENT_SIZE)
        }

        // 密码输入框
        TextInput({ placeholder: $r('app.string.Login_Password') })
          .type(InputType.Password)
          .height($r('app.float.login_input_height'))
          .margin({ top: $r('app.float.login_input_margin_top') })
          .onChange((value: string) => {
            this.password = value;
          })
      }
      .width(CommonConstants.CONTENT_SIZE)

      // 登录按钮
      Button($r('app.string.Login'))
        .width(CommonConstants.HALF_SIZE)
        .opacity($r('app.float.login_button_opacity'))
        .onClick(() => {
          if (!this.isSelect) {
            AlertDialog.show({
              title: '提示:',
              message: '请先同意隐私协议！',
              confirm: {
                value: '关闭',
                action: () => {
                  console.info('confirm!!!');
                }
              }
            });
          } else if (this.password === '88888888') {
            Logger.info('Login:', `${this.userName}登录成功>>>>>`);
            // 登录跳转 - API 17 方式
            router.pushUrl({
              url: 'pages/Loading',
              params: {
                userNameParam: this.userName
              }
            }).then(() => {
              console.info('跳转到Loading页面成功');
            }).catch((err: Error) => {
              Logger.error('路由跳转失败:', err.message);
            });
          } else {
            Logger.error('Login:', `${this.userName}登录失败<<<<<`);
            AlertDialog.show({
              title: '提示:',
              message: '用户名或密码错误！',
              confirm: {
                value: '关闭',
                action: () => {
                  console.info('confirm!!!');
                }
              }
            });
          }
        })

      // 隐私协议复选框
      Row() {
        Checkbox()
          .select(this.isSelect)
          .onChange((value: boolean) => {
            this.isSelect = value;
          })
        Text($r('app.string.Login_check_License'))
          .fontColor(Color.White)
      }
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundColor('#f0f0f0') // 使用纯色背景代替图片
  }
}