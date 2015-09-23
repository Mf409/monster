//
//  paihangbang.m
//  游戏菜单
//
//  Created by 七夜 on 2015/9/23.
//
//

#import "paihangbang.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "fenshu.h"
@implementation paihangbang
-(id) init
{
    if( (self=[super init])) {
        CCSprite* bj=[CCSprite  spriteWithFile:@"mffm.jpg"];
        bj.position=ccp(150, 300);
        [self  addChild:bj];
        CCLabelTTF*label=[CCLabelTTF labelWithString:@"排行榜" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:35];
        label.position=ccp(250, 320);
        ccColor3B color = ccc3(255, 0, 0);
        [label setColor:color];
        [self  addChild:label];
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        CCMenuItem* a=[CCMenuItemFont   itemFromString:@"第一名：小李  分数：9666" target:self selector:nil];
       CCMenuItem* a1=[CCMenuItemFont   itemFromString:@"第二名：小张  分数：9555" target:self selector:nil];
        CCMenuItem* a2=[CCMenuItemFont  itemFromString:@"第三名：我    分数：9444" target:self selector:nil];
         CCMenuItem* a3=[CCMenuItemFont  itemFromString:@"第四名：小王  分数：9333" target:self selector:nil];
        CCMenuItem* a4=[CCMenuItemFont   itemFromString:@"第五名：张三  分数：9222" target:self selector:nil];
        CCMenuItem* a5=[CCMenuItemFont   itemFromString:@"第六名：李斯  分数：9111" target:self selector:nil];
        CCMenuItem* a6=[CCMenuItemFont   itemFromString:@"第七名：金泉  分数：9000" target:self selector:nil];
        CCMenuItem* a7=[CCMenuItemFont   itemFromString:@"第八名：妍丽  分数：8999" target:self selector:nil];
        CCMenuItem* a8=[CCMenuItemFont   itemFromString:@"第九名：严嘶  分数：8777" target:self selector:nil];
        CCMenuItem* a9=[CCMenuItemFont   itemFromString:@"第十名：嗯哼  分数：8666" target:self selector:nil];
        CCMenu*  menu=[CCMenu   menuWithItems:a,a1,a2,a3,a4,a5,a6,a7,a8,a9,  nil];
        menu.position=ccp(160, 290);
        [menu   alignItemsVertically];
        [self  addChild:menu];
        CCMenuItem* go=[CCMenuItemFont   itemFromString:@"下一关" target:self selector:@selector(back)];
        CCMenuItem* go1=[CCMenuItemFont   itemFromString:@"退出游戏" target:self selector:@selector(over)];
        CCMenu*  menu1=[CCMenu   menuWithItems:go1,go, nil];
        menu1.position=ccp(160, 140);
        [menu1  alignItemsHorizontally];
        [self  addChild:menu1];
    }
    return self;
}
-(void)back{
    CCScene*sc=[CCScene  node];
    guanka1*layer12=[guanka2  node];
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
