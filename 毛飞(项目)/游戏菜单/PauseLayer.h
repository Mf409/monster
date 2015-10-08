//
//  PauseLayer.h
//  游戏菜单
//
//  Created by 七夜 on 2015/10/8.
//
//

#import "cocos2d.h"

@interface PauseLayerProtocol: CCNode

-(void)pauseLayerDidPause;

-(void)pauseLayerDidUnpause;

@end

@interface PauseLayer : CCLayerColor {
    
    PauseLayerProtocol * delegate;
    
}

@property (nonatomic,assign)PauseLayerProtocol * delegate;

+ (id) layerWithColor:(ccColor4B)color delegate:(PauseLayerProtocol *)_delegate;

- (id) initWithColor:(ccColor4B)c delegate:(PauseLayerProtocol *)_delegate;

-(void)pauseDelegate;

@end

