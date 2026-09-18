/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { TurboModulesFactory } from '@rnoh/react-native-openharmony/ts';
import type {
  TurboModule, TurboModuleContext
} from '@rnoh/react-native-openharmony/ts';
import { ComponentBuilderContext, RNOHPackage } from '@rnoh/react-native-openharmony'
import {RNXlogJSIModule} from "./RNXlogJSIModule"
import { TM } from "./generated/ts";

class XlogJSITurboModulesFactory extends TurboModulesFactory {
  createTurboModule(name: string): TurboModule | null {
    if (name === TM.XlogJsi.NAME) {
      return new RNXlogJSIModule(this.ctx);
    }
    return null;
  }

  hasTurboModule(name: string): boolean {
    return name === TM.XlogJsi.NAME;
  }
}

export class RNXlogJSIPackage extends RNOHPackage {
  createTurboModulesFactory(ctx: TurboModuleContext): TurboModulesFactory {
    return new XlogJSITurboModulesFactory(ctx);
  }
}