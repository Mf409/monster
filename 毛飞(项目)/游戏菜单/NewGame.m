//
//  NewGame.m
//  游戏菜单
//
//  Created by admin on 15-5-5.
//
//

#import "NewGame.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
@implementation NewGame
-(id)init{
    if(self==[super  init]){
        CCSprite* bj=[CCSprite  spriteWithFile:@"mn副本.jpg"];
        bj.position=ccp(160, 240);
        
        [self  addChild:bj];
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        CGSize sm=[[CCDirector  sharedDirector]winSize];
        CGPoint o=ccp(200, 200);
        CCSprite*sprite=[CCSprite  spriteWithFile:@"maofei.png"];
         sprite.position=ccp(200, 200);
     
        id action=[sprite  runAction:[CCPlace  actionWithPosition:o]];
        id  action1=[CCMoveTo  actionWithDuration:3 position:ccp(sm.width-40, sm.height-40)];
        id action2=[CCJumpTo  actionWithDuration:2 position:ccp(100, 30) height:30 jumps:4];
        id action3=[CCBlink   actionWithDuration:4 blinks:6];
        id  action4=[CCTintBy   actionWithDuration:0.5 red:0 green:255 blue:255];
        id action5=[CCRotateTo  actionWithDuration:3 angle:60];
      id action6=[CCScaleBy  actionWithDuration:3 scaleX:2 scaleY:2];
        CCMenuItemFont* b=[CCMenuItemFont   itemFromString:@"游戏首页" target:self selector:@selector(back:)];
        [b  setIsEnabled:YES];
        CCMenu *menu=[CCMenu menuWithItems:b, nil];
        menu.position=ccp(250, 80);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:1],nil];
        [self  addChild:menu];
        [sprite  runAction:[CCSequence  actions:action,action1,action4,action3,action2,action6,action5,   nil]];
        [self  addChild:sprite];
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
