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
        CCSprite*v=[CCSprite  spriteWithFile:@"cvvc.jpg"];
        v.position=ccp(160, 330);
        [self  addChild:v];
        
        
        
        CCSprite* b0j=[CCSprite  spriteWithFile:@"mofei.png"];
        b0j.position=ccp(150, 320);
        //旋转到 – CCRotateTo
        //id  action60=[CCRotateTo actionWithDuration:5 angle:180.f];
       id action60 = [CCBlink actionWithDuration:5 blinks:5];
        id action61 = [CCTintBy actionWithDuration:2 red:0 green:255 blue:255];
        //id  action62=[CCRotateTo actionWithDuration:5 angle:180.f];

        [b0j runAction:[CCSequence  actions:action61,action60,  nil]];
        [self  addChild:b0j];

        
        
        
        CCMenuItemFont* m1=[CCMenuItemFont   itemFromString:@"退出游戏" target:self selector:@selector(myButton:)];
        [m1  setIsEnabled:YES];

        CCMenuItemFont* b=[CCMenuItemFont   itemFromString:@"继续游戏" target:self selector:@selector(continue)];
        [b  setIsEnabled:YES];
        CCMenu *menu=[CCMenu menuWithItems:m1,b,nil];
        menu.position=ccp(150, 80);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],nil];
        
      [self  addChild:menu];
        
        
        
        
        
       // CCParticleSystemQuad*mao=[CCParticleSystemQuad  particleWithFile:@"BurstPipe.plist"];
        //[self  addChild:mao];

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
    
    UIAlertView*nn=[[UIAlertView  alloc]initWithTitle:@"提示" message:@"确定退出" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [nn show];
}
//点击确定返回上一页
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [[CCDirector  sharedDirector]replaceScene:[HelloWorldLayer scene]];
        
    }
   

   
}

@end
