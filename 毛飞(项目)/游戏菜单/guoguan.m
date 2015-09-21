//
//  guoguan.m
//  游戏菜单
//
//  Created by admin on 15-6-2.
//
//

#import "guoguan.h"
#import "HelloWorldLayer.h"
#import "cocos2d.h"
#import "guanka1.h"
#import "guanka2.h"
#import "jiangli.h"
@implementation guoguan
-(id) init
{
	if( (self=[super init])) {
             CCSprite* bj=[CCSprite  spriteWithFile:@"cv.jpg"];
              bj.position=ccp(150, 300);
      
               [self  addChild:bj];
        
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        CCMenuItem* a=[CCMenuItemFont   itemFromString:@"恭喜过关!" target:self selector:nil];
        CCMenuItem* a0=[CCMenuItemFont   itemFromString:@"获得奖励，请注意领取！" target:self selector:@selector(jiangli)];
        CCMenuItem* a1=[CCMenuItemFont   itemFromString:@"进入下一关卡！" target:self selector:@selector(jixu)];
        CCMenuItem* a2=[CCMenuItemFont   itemFromString:@"重新玩次关卡!" target:self selector:@selector(tuichu)];
     
        CCMenu*  menu=[CCMenu   menuWithItems:a,a0,a1,a2, nil];
        [menu   alignItemsVertically];
        [self  addChild:menu];
        CCParticleSystemQuad*mao=[CCParticleSystemQuad  particleWithFile:@"Upsidedown.plist"];
        [self  addChild:mao];
    }  
    return self;
}
-(void)jixu{       
    CCScene*sc=[CCScene  node];
    guanka2*layer12=[guanka2  node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}

-(void)tuichu{
    CCScene*sc1=[CCScene  node];
    guanka1*layer21=[guanka1  node];
    
    [sc1  addChild:layer21];
    [[CCDirector  sharedDirector]replaceScene:sc1];
}
-(void)jiangli{
    CCScene *sc102=[CCScene  node];
    jiangli *layer201=[jiangli  node];
    [sc102 addChild:layer201];
    [[CCDirector sharedDirector]replaceScene:sc102];
}
@end
