//
//  tongguan.m
//  游戏菜单
//
//  Created by admin on 15-6-24.
//
//

#import "tongguan.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "yiban.h"
@implementation tongguan
-(id) init
{
	if( (self=[super init])) {
        CCSprite* bj=[CCSprite  spriteWithFile:@"cv.jpg"];
        bj.position=ccp(150, 300);
        
        [self  addChild:bj];
        
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        CCMenuItem* a=[CCMenuItemFont   itemFromString:@"恭喜你通关" target:self selector:nil];
        a.position=ccp(100, 300);
        CCMenuItem* a1=[CCMenuItemFont   itemFromString:@"退出游戏" target:self selector:@selector(over)];
        a.position=ccp(100, 250);
        CCMenu*  menu=[CCMenu   menuWithItems:a,a1, nil];
        [menu   alignItemsVertically];
        [self  addChild:menu];
        CCParticleSystemQuad*mao=[CCParticleSystemQuad  particleWithFile:@"LavaFlow.plist"];
        [self  addChild:mao];
        
    }
    return self;
}
-(void)over{
    CCScene*fei=[CCScene  node];
   HelloWorldLayer*   layer88=[HelloWorldLayer  node];
    [fei addChild:layer88];
    [[CCDirector  sharedDirector]replaceScene:fei];
}

@end
