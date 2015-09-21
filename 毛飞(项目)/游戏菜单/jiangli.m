//
//  jiangli.m
//  游戏菜单
//
//  Created by maofei on 15/9/14.
//
//

#import "jiangli.h"
#import "cocos2d.h"
#import "guoguan.h"
#import "beibao.h"
@implementation jiangli
-(id) init
{
    if( (self=[super init])) {
        CGSize sm=[[CCDirector  sharedDirector]winSize];
        CGPoint o=ccp(200, 200);

        CCSprite* bj=[CCSprite  spriteWithFile:@"30.jpg"];
        bj.position=ccp(150, 300);
        id action=[bj  runAction:[CCPlace  actionWithPosition:o]];
        id  action1=[CCMoveTo  actionWithDuration:3 position:ccp(sm.width-40, sm.height-40)];
        id action2=[CCJumpTo  actionWithDuration:2 position:ccp(100, 30) height:30 jumps:4];
        id action3=[CCBlink   actionWithDuration:4 blinks:6];
        id  action4=[CCTintBy   actionWithDuration:0.5 red:0 green:255 blue:255];
        id action5=[CCRotateTo  actionWithDuration:3 angle:60];
        id action6=[CCScaleBy  actionWithDuration:3 scaleX:2 scaleY:2];
        [bj runAction:[CCSequence  actions:action,action1,action4,action3,action2,action6,action5,   nil]];
        [self  addChild:bj];
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
       
        CCMenuItemFont* a=[CCMenuItemFont   itemFromString:@"点击领取" target:self selector:@selector(myButton:)];
               [a  setIsEnabled:YES];
        CCMenu *menu=[CCMenu menuWithItems:a, nil];
        menu.position=ccp(250, 80);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:1],nil];
        [menu   alignItemsVertically];
        [self  addChild:menu];
        
    }
    return self;

}
-(void)myButton:(UIButton *)sender{
    
    UIAlertView*nn=[[UIAlertView  alloc]initWithTitle:@"提示" message:@"确定领取" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [nn show];
}
@end
