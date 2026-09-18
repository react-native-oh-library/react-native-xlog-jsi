import { UITurboModule, UITurboModuleContext } from '@rnoh/react-native-openharmony/ts';
import { TM } from "./generated/ts"
import { Log, Xlog, XLogConfig } from '@ohos/xlog';


export class RNXlogJSIModule extends UITurboModule {
  static NAME = "XlogJsi"
  constructor(ctx: UITurboModuleContext) {
    super(ctx);
  }
}