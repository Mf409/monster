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
        CCSprite*v=[CCSprite  spriteWithFile:@"mn.jpg"];
        v.position=ccp(160,280);
        [self  addChild:v];
        
        CCMenuItemFont *m1=[CCMenuItemFont  itemFromString:@"退出游戏"];
        [m1  setIsEnabled:NO];
        CCMenuItemToggle* m=[CCMenuItemToggle  itemWithTarget:self selector:nil items:[CCMenuItemFont  itemFromString:@"确定"],
                             [CCMenuItemFont  itemFromString:@"取消"],nil];
        CCMenuItemFont* b=[CCMenuItemFont   itemFromString:@"继续游戏" target:self selector:@selector(continue)];
        [b  setIsEnabled:YES];
        CCMenu *menu=[CCMenu menuWithItems:m1,m,b,nil];
        menu.position=ccp(150, 80);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:2],[NSNumber  numberWithUnsignedInt:1],nil];
        
      [self  addChild:menu];
    }
    return  self;
}
-(void)continue{
    CCScene*o=[CCScene  node];
    guanka1*layer19=[guanka1  node];
    [o addChild:layer19];
    [[CCDirector   sharedDirector]replaceScene:o];
    

}
@end
