//
//  jnjd.m
//  游戏菜单
//
//  Created by admin on 15-4-29.
//
//

#import "jnjd.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
@implementation jnjd
-(id)init{
   

    if(self==[super  init]){
        CCSprite*l=[CCSprite  spriteWithFile:@"1.jpg"];
        l.position=ccp(160, 300);
        [self addChild:l];
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        CCMenuItemFont* s=[CCMenuItemFont   itemFromString:@"该英雄是一个远程射击者。" target:self selector:nil];
        [s setIsEnabled:NO];
        s.position=ccp(150, 95);
        CCMenuItemFont* s1=[CCMenuItemFont   itemFromString:@"Q技能是眩晕敌人造成一成伤害。" target:self selector:nil];
        [s1 setIsEnabled:NO];
        s1.position=ccp(150, 90);
        CCMenuItemFont* s2=[CCMenuItemFont   itemFromString:@"w技能是诱惑敌人造成三成伤害。" target:self selector:nil];
        [s2 setIsEnabled:NO];
        s2.position=ccp(150,100);
        CCMenuItemFont* s3=[CCMenuItemFont   itemFromString:@"E技能是踢飞敌人造成五成伤害。" target:self selector:nil];
        [s3 setIsEnabled:NO];
        s3.position=ccp(150,110);

        CCMenuItemFont* b=[CCMenuItemFont   itemFromString:@"游戏首页" target:self selector:@selector(back:)];
        [b setIsEnabled:YES];
         CCMenu *menu=[CCMenu menuWithItems:s,s1,s2,s3,b, nil];
         menu.position=ccp(150, 80);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],nil];
        [self  addChild:menu];
     }
    return self;
}
-(void)back:(id)sender{
    CCScene*o=[CCScene  node];
    HelloWorldLayer*layer7=[HelloWorldLayer   node];
    [o addChild:layer7];
    [[CCDirector   sharedDirector]replaceScene:o];
    
}

@end
