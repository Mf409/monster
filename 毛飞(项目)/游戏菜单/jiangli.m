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
#import "guanka1.h"
#import "HelloWorldLayer.h"
@implementation jiangli
-(id) init
{
    if( (self=[super init])) {
        CCSprite* bj1=[CCSprite  spriteWithFile:@"l.jpg"];
        bj1.position=ccp(160, 240);
        
        [self  addChild:bj1];
        CGPoint o=ccp(120, 320);
   CCSprite* bj=[CCSprite  spriteWithFile:@"30.jpg"];
        bj.position=ccp(100, 300);
        id action=[bj  runAction:[CCPlace  actionWithPosition:o]];

        id action6=[CCScaleBy  actionWithDuration:3 scaleX:2 scaleY:2];
        [bj runAction:[CCSequence  actions:action,action6,  nil]];
        [self  addChild:bj];
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        CCMenuItemFont* a1=[CCMenuItemFont   itemFromString:@"进入背包" target:self selector:@selector(beibao)];
        [a1  setIsEnabled:YES];
        CCMenuItemFont* a2=[CCMenuItemFont   itemFromString:@"进入游戏" target:self selector:@selector(guanka1)];
        [a2  setIsEnabled:YES];
        CCMenuItemFont* a3=[CCMenuItemFont   itemFromString:@"返回首页" target:self selector:@selector(shouye)];
        [a3  setIsEnabled:YES];
        CCMenuItemFont* a=[CCMenuItemFont   itemFromString:@"点击领取" target:self selector:@selector(myButton:)];
               [a  setIsEnabled:YES];
        CCMenu *menu=[CCMenu menuWithItems:a,a1,a2,a3, nil];
        menu.position=ccp(250, 80);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],nil];
        [menu   alignItemsVertically];
        [self  addChild:menu];
        CCParticleSystemQuad*mao=[CCParticleSystemQuad  particleWithFile:@"Galaxy.plist"];
        [self  addChild:mao];

        
    }
    return self;

}
-(void)myButton:(UIButton *)sender{
    
    UIAlertView*nn=[[UIAlertView  alloc]initWithTitle:@"提示" message:@"确定领取" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [nn show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        UIAlertView*nn=[[UIAlertView  alloc]initWithTitle:@"提示" message:@"领取成功" delegate:self cancelButtonTitle:@"进入背包" otherButtonTitles:@"留在此页", nil];
        [nn show];
        
    }
    if(buttonIndex==0){
        [[CCDirector  sharedDirector]replaceScene:[beibao scene]];

    }
    
    
}




-(void)beibao{
    CCScene*fei=[CCScene  node];
    beibao*   layer880=[beibao  node];
    [fei addChild:layer880];
    [[CCDirector  sharedDirector]replaceScene:fei];
}
-(void)guanka1{
    CCScene*fei=[CCScene  node];
    guanka1*   layer88=[guanka1  node];
    [fei addChild:layer88];
    [[CCDirector  sharedDirector]replaceScene:fei];
}
-(void)shouye{
    CCScene*fei=[CCScene  node];
    HelloWorldLayer*   layer88=[HelloWorldLayer  node];
    [fei addChild:layer88];
    [[CCDirector  sharedDirector]replaceScene:fei];
}

@end
