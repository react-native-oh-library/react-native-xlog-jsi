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

#pragma once

#include "generated/RNOH/generated/BaseRnxlogJsIPackage.h"
#include "RNXlogJSIModule.h"

namespace rnoh {

class RNXlogJSIModuleTurboModuleFactoryDelegate : public TurboModuleFactoryDelegate {
public:
    SharedTurboModule createTurboModule(Context ctx, const std::string &name) const override {
        if (name == "XlogJsi") {
             return std::make_shared<RNXlogJSIModule>(ctx, name);
        }
        return nullptr;
    }
};

class RNXlogJSIPackage : public BaseRnxlogJsIPackage {
    using Super = BaseRnxlogJsIPackage;
    using Super::Super;
    
    std::unique_ptr<TurboModuleFactoryDelegate> createTurboModuleFactoryDelegate() override {
        return std::make_unique<RNXlogJSIModuleTurboModuleFactoryDelegate>();
    }
};
} // namespace rnoh