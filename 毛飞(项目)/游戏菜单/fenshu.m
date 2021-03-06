//
//  fenshu.m
//  游戏菜单
//
//  Created by admin on 15-5-20.
//
//

#import "fenshu.h"
#import "cocos2d.h"
#import "guoguan.h"
#import "guanka2.h"
#import "guanka1.h"
#import "HelloWorldLayer.h"
#import "paihangbang.h"
@implementation fenshu
-(id) init
{
    if( (self=[super init])) {
        CCSprite* bj=[CCSprite  spriteWithFile:@"def.jpg"];
        bj.position=ccp(160,  330);
        [self  addChild:bj];
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:25];
        CCMenuItemFont *sb=[CCMenuItemFont   itemFromString:@"得分："];
        [sb setIsEnabled:YES];
        CCMenuItemToggle *s=[CCMenuItemToggle  itemWithTarget:self selector:nil items:[CCMenuItemFont itemFromString:@"本局得分：1234"], [CCMenuItemFont itemFromString:@"最高分：9999"],[CCMenuItemFont itemFromString:@"上局得分：2036"],nil];
        CCMenuItem* a0=[CCMenuItemFont   itemFromString:@"排行榜" target:self selector:@selector(pai)];
        CCMenuItem* a=[CCMenuItemFont   itemFromString:@"重玩次关" target:self selector:@selector(chong)];
        CCMenuItem* a1=[CCMenuItemFont   itemFromString:@"进入下一关" target:self selector:@selector(next)];
        CCMenuItem* a2=[CCMenuItemFont   itemFromString:@"返回首页" target:self selector:@selector(back)];
        CCMenu *menu=[CCMenu menuWithItems:sb,s,a0,  a,a1,a2, nil];
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:2],[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],nil];
          [self  addChild:menu];
        CCParticleSystemQuad*mao=[CCParticleSystemQuad  particleWithFile:@"debian.plist"];
        [self  addChild:mao];
    }
    return self;
}
-(void)chong{
    CCScene*sc=[CCScene  node];
    guanka1*layer12=[guanka2  node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}
-(void)next{
    CCScene*sc=[CCScene  node];
    guanka2*layer12=[guanka2  node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}
-(void)back{
    CCScene*sc=[CCScene  node];
    HelloWorldLayer*layer12=[HelloWorldLayer node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}
-(void)pai{
    CCScene*sc=[CCScene  node];
    paihangbang*layer12=[paihangbang node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}
@end
