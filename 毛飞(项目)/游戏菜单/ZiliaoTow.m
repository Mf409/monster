//
//  ZiliaoTow.m
//  游戏菜单
//
//  Created by admin on 15-5-10.
//
//

#import "ZiliaoTow.h"
#import "cocos2d.h"
#import "paihangbang.h"
#import "setGame.h"
#import "HelloWorldLayer.h"
#import "setGame.h"

@implementation ZiliaoTow
-(id)init{
    if( (self=[super init])) {
        CCSprite* bj=[CCSprite  spriteWithFile:@"mnbv.jpg"];
        bj.position=ccp(160, 280);
        [self  addChild:bj];
        CGPoint o=ccp(50, 410);
        CCSprite* bj1=[CCSprite  spriteWithFile:@"hehe2.jpg"];
        bj1.position=ccp(50, 410);
        //图片效果
        //id action6 = [CCBlink actionWithDuration:1.5 blinks:5];
        //图片淡入
        id action6  =[CCFadeOut actionWithDuration:3 opacity:120];
        id action=[bj1  runAction:[CCPlace  actionWithPosition:o]];
        [bj1 runAction:[CCSequence  actions:action,action6,  nil]];
        [self  addChild:bj1];

        CCLabelTTF*label0=[CCLabelTTF labelWithString:@"姓名" dimensions:CGSizeMake(40, 50) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:20];
        label0.position=ccp(120, 430);
        ccColor3B color0 = ccc3(0,255,0);
        [label0 setColor:color0];
        [self  addChild:label0];
        
        
        CCLabelTTF*label=[CCLabelTTF labelWithString:@"毛飞 " dimensions:CGSizeMake(40, 50) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:20];
        label.position=ccp(170, 430);
        ccColor3B color = ccc3(255, 128, 171);
        [label setColor:color];
        [self  addChild:label];
        
        CCLabelTTF*label1=[CCLabelTTF labelWithString:@"等级" dimensions:CGSizeMake(40, 50) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:20];
        label1.position=ccp(120, 400);
        ccColor3B color1 = ccc3(255,0,0);
        [label1 setColor:color1];
        [self  addChild:label1];
        
        CCLabelTTF*label2=[CCLabelTTF labelWithString:@"司令 " dimensions:CGSizeMake(40, 80) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:20];
        label2.position=ccp(170, 385);
        ccColor3B color2 = ccc3(255, 0, 255);
        [label2 setColor:color2];
        [self  addChild:label2];
        
        CCLabelTTF*label3=[CCLabelTTF labelWithString:@"账号 " dimensions:CGSizeMake(40, 80) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:20];
        label3.position=ccp(120, 350);
        ccColor3B color3 = ccc3(255,127,0);
        [label3 setColor:color3];
        [self  addChild:label3];
        
        CCMenuItem* a1=[CCMenuItemFont   itemFromString:@":024666666" target:self selector:nil];
        a1.position=ccp(195, 380);
        [self  addChild:a1];

        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:25];
        CCMenuItem* a01=[CCMenuItemFont   itemFromString:@"我的战机" target:self selector:nil];
        a01.position=ccp(50, 330);
        [self  addChild:a01];
        
        
        CCSprite* b0j=[CCSprite  spriteWithFile:@"ololk.jpg"];
        b0j.position=ccp(120, 200);
        CGPoint o1=ccp(150, 200);
        
        id action60 = [CCBlink actionWithDuration:3 blinks:5];
        id action20=[bj1  runAction:[CCPlace  actionWithPosition:o1]];
        [b0j runAction:[CCSequence  actions:action20,action60,  nil]];
        [self  addChild:b0j];
        
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:25];
        CCMenuItem* a9=[CCMenuItemFont   itemFromString:@"返回" target:self selector:@selector(pop)];
        
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:25];
        CCMenuItem* a90=[CCMenuItemFont   itemFromString:@"退出" target:self selector:@selector(quit)];
        
//        [CCMenuItemFont  setFontName:@"Marker Felt"];
//        [CCMenuItemFont  setFontSize:25];
//        CCMenuItem* a91=[CCMenuItemFont   itemFromString:@"设置" target:self selector:@selector(set)];
        
        CCMenu*  menu1=[CCMenu   menuWithItems:a9,a90, nil];
        menu1.position=ccp(160, 80);
        [menu1  alignItemsHorizontally];
        [self  addChild:menu1];
        
    }
    return self;
}
-(void)pop{
    CCScene*sc=[CCScene  node];
    paihangbang*layer12=[paihangbang  node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}
-(void)quit{
    CCScene*sc=[CCScene  node];
    HelloWorldLayer*layer12=[HelloWorldLayer  node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}
//-(void)set{
//    CCScene*sc=[CCScene  node];
//    setGame*layer12=[setGame  node];
//    [sc addChild:layer12];
//    [[CCDirector   sharedDirector]replaceScene:sc];
//}

@end
