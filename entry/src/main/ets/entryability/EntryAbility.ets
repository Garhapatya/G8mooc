import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.info('EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // 设置主窗口
    windowStage.loadContent('pages/Index', (err: Error) => {
      if (err) {
        console.error('Failed to load the content:', err.message);
      } else {
        console.info('Content loaded successfully');
      }
    });
  }
}