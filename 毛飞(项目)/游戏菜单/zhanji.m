//
//  zhanji.m
//  游戏菜单
//
//  Created by 七夜 on 2015/9/22.
//
//
#import <UIKit/UIKit.h>
#import "zhanji.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "guanka1.h"
#import "guanka2.h"
#import "yiban.h"
@implementation zhanji
-(id)init{
    if(self==[super  init]){
        CCSprite* bj=[CCSprite  spriteWithFile:@"mjk.jpg"];
        bj.position=ccp(160, 240);
        [self  addChild:bj];
        CCLabelTTF*label=[CCLabelTTF labelWithString:@"公元2059年，地球人口的持续增长，可用资源几近枯竭。由此带来的生活压力迫使各国相继开启了太空能源计划。在对潘多拉星球进行能源开发的过程中，本国与外空守护者引发的一场星球大战！" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:25];
        label.position=ccp(168, 306);
        ccColor3B color = ccc3(200, 250, 126);
        [label setColor:color];
        [self  addChild:label];
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        CCMenuItem* a3=[CCMenuItemFont   itemFromString:@"选择战机，开始游戏" target:self selector:nil];
        [a3  setIsEnabled:YES];
        a3.position=ccp(120, 180);
        [self addChild:a3];
        CCMenuItemImage *image=[CCMenuItemImage  itemFromNormalImage:@"2213.jpg" selectedImage:@"2213.jpg" target:self selector:@selector(hui)];
        image.position=ccp(100, 100);
       // [self  addChild:image];
        CCMenuItemImage *image1=[CCMenuItemImage  itemFromNormalImage:@"10副本.png" selectedImage:@"10副本.png" target:self selector:@selector(back)];
        image1.position=ccp(250, 100);
        //[self  addChild:image1];
        CCMenuItemImage *image2=[CCMenuItemImage  itemFromNormalImage:@"01020.png" selectedImage:@"01020.png" target:self selector:@selector(back1)];
        image2.position=ccp(350, 100);
        
        CCMenu*  menu=[CCMenu   menuWithItems:image,image1,image2, nil];
        //以列的方式摆放
        //[menu   alignItemsVertically];
        [menu  alignItemsHorizontally];
        menu.position=ccp(150, 100);
        [self  addChild:menu];
    }
    return self;
}
-(void)back{
    
    CCScene*r=[CCScene  node];
   guanka1*layer11=[guanka1  node];
    
    [r addChild:layer11];
    [[CCDirector  sharedDirector]replaceScene:r];
}
-(void)hui{
    
    CCScene*r=[CCScene  node];
    guanka2*layer11=[guanka2  node];
    
    [r addChild:layer11];
    [[CCDirector  sharedDirector]replaceScene:r];
}
-(void)back1{
    CCScene*r=[CCScene  node];
    yiban*layer11=[yiban  node];
    
    [r addChild:layer11];
    [[CCDirector  sharedDirector]replaceScene:r];
}
@end
