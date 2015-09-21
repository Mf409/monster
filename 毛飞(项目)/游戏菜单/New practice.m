//
//  New practice.m
//  游戏菜单
//
//  Created by admin on 15-5-13.
//
//

#import "New practice.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
@implementation New_practice
-(id)init{
    if(self==[super  init]){
        CGSize sm=[[CCDirector  sharedDirector]winSize];
        CGPoint o=ccp(200, 200);
        CGSize sm1=[[CCDirector  sharedDirector]winSize];
        CGPoint o1=ccp(100, 100);
       [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        CCSprite*v=[CCSprite  spriteWithFile:@"111.jpg"];
        v.position=ccp(160,280);
        [self  addChild:v];
        CCSprite*w=[CCSprite  spriteWithFile:@"333.jpg"];
        w.position=ccp(100, 200);
        //第二个
        CCSprite*m=[CCSprite  spriteWithFile:@"444.jpg"];
        m.position=ccp(100, 100);
        id action9=[CCRotateTo  actionWithDuration:4 angle:90];
        id action6=[CCScaleBy  actionWithDuration:3 scaleX:2 scaleY:2];
        id action3=[m runAction:[CCPlace  actionWithPosition:o1]];
        id  action2=[CCMoveTo  actionWithDuration:3 position:ccp(sm1.width-40, sm.height-40)];
         id action4=[CCJumpTo  actionWithDuration:2 position:ccp(100, 30) height:30 jumps:4];
        [m runAction:[CCSequence  actions:action6,action3,action2,action4,action9,   nil]];
        [self  addChild:m];
        //第一个动画
         id action99=[CCRotateTo  actionWithDuration:4 angle:180];
        id action88=[CCScaleBy  actionWithDuration:3 scaleX:2 scaleY:2];
        id action=[w  runAction:[CCPlace  actionWithPosition:o]];
          id  action1=[CCMoveTo  actionWithDuration:3 position:ccp(sm.width-40, sm.height-40)];
                 id action7=[CCBlink   actionWithDuration:4 blinks:6];
        [w runAction:[CCSequence  actions:action88,action,action1,action7,action99,   nil]];

        [self addChild:w];
        
        CCMenuItemFont* b=[CCMenuItemFont   itemFromString:@"游戏首页" target:self selector:@selector(back:)];
        [b  setIsEnabled:YES];
        CCMenu *menu=[CCMenu menuWithItems:b, nil];
        menu.position=ccp(250, 80);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:1],nil];
        [self  addChild:menu];
           }
    return self;
}
-(void)back:(id)sender{
    CCScene*o=[CCScene  node];
    HelloWorldLayer*layer9=[HelloWorldLayer   node];
    [o addChild:layer9];
    [[CCDirector   sharedDirector]replaceScene:o];
    
}
@end
