//
//  help.m
//  游戏菜单
//  Created by admin on 15-4-28.
//  Copyright __MyCompanyName__ 2015年. All rights reserved.
//
//

#import "help.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "guanka1.h"
@implementation help
-(id)init{
    if(self==[super  init]){
        CCSprite* bj=[CCSprite  spriteWithFile:@"help.jpg"];
        bj.position=ccp(160, 330);
        [self  addChild:bj];
        
        CCLabelTTF*label=[CCLabelTTF labelWithString:@"游戏规则" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:35];
        label.position=ccp(245, 400);
        ccColor3B color = ccc3(255,255,0);
        [label setColor:color];
        [self  addChild:label];
        
        CCLabelTTF*label1=[CCLabelTTF labelWithString:@"移动：手指滑动屏幕移动飞机" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:15];
        label1.position=ccp(168, 360);
        ccColor3B color1 = ccc3(200, 250, 126);
        [label1 setColor:color1];
        [self  addChild:label1];
        
        CCLabelTTF*label2=[CCLabelTTF labelWithString:@"攻击：飞机自动发射子弹，不需要操作" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:15];
        label2.position=ccp(168, 340);
        ccColor3B color2 = ccc3(160, 250,0);
        [label2 setColor:color2];
        [self  addChild:label2];

        CCLabelTTF*label3=[CCLabelTTF labelWithString:@"躲避：若飞机机中间闪烁的亮点被攻击，则会扣除屏幕上方的生命值，当生命值减少为0，飞机就会死亡。" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:15];
        label3.position=ccp(168, 320);
        ccColor3B color3 = ccc3(180, 120, 255);
        [label1 setColor:color3];
        [self  addChild:label3];
        
        CCLabelTTF*label4=[CCLabelTTF labelWithString:@"终极武器：可以点击屏幕左下角的“高能爆弹”按钮，对屏幕内所有敌人造成大量伤害同时消除所有子弹。此时玩家飞机进入短暂的无敌状态。" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:15];
        label4.position=ccp(168, 270);
        ccColor3B color4 = ccc3(100, 210, 126);
        [label4 setColor:color4];
        [self  addChild:label4];
        
        CCLabelTTF*label5=[CCLabelTTF labelWithString:@"复活：死亡时会掉落大量升级道具，此时可以消耗钻石进行复活，复活后生命补满。每局可复活3次（贵族玩家4次，v10贵族5次),依次消耗20钻、40钻、60钻、80钻（贵族玩家)100钻（v10)" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:15];
        label5.position=ccp(168, 215);
        ccColor3B color5 = ccc3(165, 120, 160);
        [label5 setColor:color5];
        [self  addChild:label5];
        
        CCLabelTTF*label6=[CCLabelTTF labelWithString:@"击杀敌机：游戏中击杀敌人可以获得一定的分数，有时也会产生一定数量的水晶。" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:15];
        label6.position=ccp(168, 150);
        ccColor3B color6 = ccc3(166, 166, 126);
        [label6 setColor:color6];
        [self  addChild:label6];
        
        CCLabelTTF*label7=[CCLabelTTF labelWithString:@"拾取水晶：拾取击杀敌人掉落的水晶可以获得分数。" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:15];
        label7.position=ccp(168, 120);
        ccColor3B color7 = ccc3(230, 250, 225);
        [label7 setColor:color7];
        [self  addChild:label7];
        
        CCLabelTTF*label8=[CCLabelTTF labelWithString:@"拾取水晶：拾取击杀敌人掉落的水晶可以获得分数。" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:15];
        label8.position=ccp(168, 90);
        ccColor3B color8 = ccc3(255, 0, 10);
        [label8 setColor:color8];
        [self  addChild:label8];
        
        CCLabelTTF*label9=[CCLabelTTF labelWithString:@"发动暴走：飞机发动暴走，将大大提高攻击力攻击速度等，同时暴走时击杀敌人会得到双倍的得分奖励。" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:15];
        label9.position=ccp(168, 75);
        ccColor3B color9 = ccc3(255, 0, 10);
        [label9 setColor:color9];
        [self  addChild:label9];
        
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:25];
        CCMenuItem* a9=[CCMenuItemFont   itemFromString:@"进入游戏" target:self selector:@selector(pop)];
        
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:25];
        CCMenuItem* a90=[CCMenuItemFont   itemFromString:@"退出" target:self selector:@selector(quit)];
        

        CCMenu*  menu1=[CCMenu   menuWithItems:a9,a90, nil];
        menu1.position=ccp(160, 60);
        [menu1  alignItemsHorizontally];
        [self  addChild:menu1];

        
        
    }
    return self;
}
-(void)pop{
    CCScene*sc=[CCScene  node];
    guanka1*layer12=[guanka1  node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}
-(void)quit{
    CCScene*sc=[CCScene  node];
    HelloWorldLayer*layer12=[HelloWorldLayer  node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}

@end
