//
//  haoyou.m
//  游戏菜单
//
//  Created by 七夜 on 2015/10/8.
//
//

#import "haoyou.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "paihangbang.h"
@implementation haoyou
-(id) init
{
    if( (self=[super init])) {
        CCSprite* bj=[CCSprite  spriteWithFile:@"nnnng.jpg"];
        bj.position=ccp(150, 300);
        [self  addChild:bj];
        
        CCLabelTTF*label=[CCLabelTTF labelWithString:@"好友列表" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:35];
        label.position=ccp(250, 320);
        ccColor3B color = ccc3(255, 0, 0);
        [label setColor:color];
        [self  addChild:label];
        
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        CCMenuItem* a=[CCMenuItemFont   itemFromString:@"李刚  体力：30点 战斗力：4520" target:self selector:nil];
        CCMenuItem* a1=[CCMenuItemFont  itemFromString:@"张丰  体力：20点 战斗力：4320" target:self selector:nil];
        CCMenuItem* a2=[CCMenuItemFont  itemFromString:@"刘婧  体力：12点 战斗力：4301" target:self selector:nil];
        CCMenuItem* a3=[CCMenuItemFont  itemFromString:@"王刚  体力：22点 战斗力：4298" target:self selector:nil];
        CCMenuItem* a4=[CCMenuItemFont  itemFromString:@"张三  体力：13点 战斗力：4286" target:self selector:nil];
        CCMenuItem* a5=[CCMenuItemFont  itemFromString:@"李斯  体力：18点 战斗力：4279" target:self selector:nil];
        CCMenuItem* a6=[CCMenuItemFont  itemFromString:@"金泉  体力：15点 战斗力：4277" target:self selector:nil];
        CCMenuItem* a7=[CCMenuItemFont  itemFromString:@"妍丽  体力：15点 战斗力：4193" target:self selector:nil];
        CCMenuItem* a8=[CCMenuItemFont  itemFromString:@"严嘶  体力：24点 战斗力：4186" target:self selector:nil];
        CCMenuItem* a9=[CCMenuItemFont  itemFromString:@"嗯哼  体力：19点 战斗力：4100" target:self selector:nil];
        CCMenu*  menu=[CCMenu   menuWithItems:a,a1,a2,a3,a4,a5,a6,a7,a8,a9,  nil];
        menu.position=ccp(160, 290);
        [menu   alignItemsVertically];
        [self  addChild:menu];
        CCMenuItem* go=[CCMenuItemFont   itemFromString:@"排行榜" target:self selector:@selector(back)];
        CCMenuItem* go1=[CCMenuItemFont   itemFromString:@"返回首页" target:self selector:@selector(over)];
        CCMenu*  menu1=[CCMenu   menuWithItems:go1,go, nil];
        menu1.position=ccp(160, 140);
        [menu1  alignItemsHorizontally];
        [self  addChild:menu1];
    }
    return self;
}
-(void)back{
    CCScene*sc=[CCScene  node];
    paihangbang*layer12=[paihangbang  node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}
-(void)over{
    CCScene*sc=[CCScene  node];
    HelloWorldLayer*layer12=[HelloWorldLayer  node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}

@end
