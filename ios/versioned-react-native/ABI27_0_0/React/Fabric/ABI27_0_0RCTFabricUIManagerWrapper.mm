/**
 * Copyright (c) 2015-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "ABI27_0_0RCTFabricUIManagerWrapper.h"

#include <ABI27_0_0fabric/ABI27_0_0FabricUIManager.h>

#import "ABI27_0_0RCTFabricPlatformUIOperationManager.h"

// This file contains experimental placeholders, nothing is finalized.
@implementation ABI27_0_0RCTFabricUIManagerWrapper
{
  std::shared_ptr<FabricUIManager> _manager;
  std::shared_ptr<IFabricPlatformUIOperationManager> _platformUIOperationManager;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    _platformUIOperationManager = std::make_shared<ABI27_0_0RCTFabricPlatformUIOperationManagerConnector>();
    _manager = std::make_shared<FabricUIManager>(_platformUIOperationManager);
  }
  return self;
}

- (std::shared_ptr<FabricUIManager>)manager
{
  return _manager;
}

- (void)invalidate
{
}

@end

@implementation ABI27_0_0RCTBridge (ABI27_0_0RCTFabricUIManagerWrapper)

- (std::shared_ptr<FabricUIManager>)fabricUIManager
{
  ABI27_0_0RCTFabricUIManagerWrapper *wrapper = [self jsBoundExtraModuleForClass:[ABI27_0_0RCTFabricUIManagerWrapper class]];
  if (wrapper) {
    return [wrapper manager];
  }
  return nullptr;
}

@end
