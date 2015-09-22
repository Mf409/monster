//
//  Quit.m
//  游戏菜单
//
//  Created by admin on 15-5-8.
//
//

#import "Quit.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "NewGame.h"
#import "guanka1.h"
@implementation Quit
-(id)init{
    if(self==[super  init]){
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        CCSprite*v=[CCSprite  spriteWithFile:@"soc.jpg"];
        v.position=ccp(160,280);
        [self  addChild:v];
        
        CCMenuItemFont* m1=[CCMenuItemFont   itemFromString:@"退出游戏" target:self selector:@selector(myButton:)];
        [m1  setIsEnabled:YES];

        CCMenuItemFont* b=[CCMenuItemFont   itemFromString:@"继续游戏" target:self selector:@selector(continue)];
        [b  setIsEnabled:YES];
        CCMenu *menu=[CCMenu menuWithItems:m1,b,nil];
        menu.position=ccp(150, 80);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],nil];
        
      [self  addChild:menu];
        CCParticleSystemQuad*mao=[CCParticleSystemQuad  particleWithFile:@"BurstPipe.plist"];
        [self  addChild:mao];

    }
    return  self;
}
-(void)continue{
    CCScene*o=[CCScene  node];
    guanka1*layer19=[guanka1  node];
    [o addChild:layer19];
    [[CCDirector   sharedDirector]replaceScene:o];
    

}
-(void)myButton:(UIButton *)sender{
    
    UIAlertView*nn=[[UIAlertView  alloc]initWithTitle:@"提示" message:@"确定退出" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [nn show];
}

@end
