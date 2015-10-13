//
//  HelloWorldLayer.m
//  游戏菜单
//
//  Created by admin on 15-4-28.
//  Copyright __MyCompanyName__ 2015年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "setGame.h"
#import "zhanji.h"
#import "NewGame.h"
#import "Quit.h"
#import "beibao.h"
#import "jiangli.h"
#import "Guanka.h"
#import "SimpleAudioEngine.h"
#import "paihangbang.h"
#import "help.h"
#import "shengjibaoku.h"
#import "haoyou.h"
// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        //添加背景
        CCSprite* bj=[CCSprite  spriteWithFile:@"mujkl.jpg"];
        bj.position=ccp(160,330);
        //背景音乐
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@ "yinyue.mp3"];
       //CGSize size = [[CCDirector sharedDirector] winSize];
        [self  addChild:bj];
    
       
        CCLabelTTF*label=[CCLabelTTF labelWithString:@"打怪兽" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:40];
        label.position=ccp(265, 300);
        ccColor3B color = ccc3(250, 0, 250);
        
        [label setColor:color];
        [self  addChild:label];
         
        
         //字体字号
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:30];
        CCMenuItem* a=[CCMenuItemFont   itemFromString:@"新游戏" target:self selector:@selector(xinyou)];//newgame
        
        
        
         CCMenuItem* p=[CCMenuItemFont   itemFromString:@"我的好友" target:self selector:@selector(bang)];
        
         CCMenuItem* eb=[CCMenuItemFont   itemFromString:@"游戏帮助" target:self selector:@selector(help)];
        
        CCMenuItem* b=[CCMenuItemFont   itemFromString:@"游戏设置" target:self selector:@selector(setinggame)];//setgame
       
       
        CCMenuItem* c=[CCMenuItemFont   itemFromString:@"退出游戏" target:self selector:@selector(Quit)];
        
        CCMenuItem* g=[CCMenuItemFont   itemFromString:@"升级宝库" target:self selector:@selector(shengjibaoku)];
        
        
        CCMenuItem* n=[CCMenuItemFont   itemFromString:@"游戏关卡" target:self selector:@selector(Guan)];
        
        CCMenu*  menu=[CCMenu   menuWithItems:a,p, eb, b,g,n, c, nil];
        [menu   alignItemsVertically];
        [self  addChild:menu];
        
        //添加粒子特效
        CCParticleSystemQuad*mao=[CCParticleSystemQuad  particleWithFile:@"debian.plist"];
        [self  addChild:mao];

		
		
	}
	return self;
}
#pragma #replacescene
-(void)setinggame{
    CCScene*sc=[CCScene  node];
    setGame*layer2=[setGame   node];
    [sc addChild:layer2];
    [[CCDirector   sharedDirector]replaceScene:sc];
}
-(void)xinyou{
    CCScene *xy=[CCScene   node];
    zhanji*layer5=[zhanji node];
    [xy  addChild:layer5];
    [[CCDirector   sharedDirector]replaceScene:xy];
}
-(void)Quit{
    CCScene*q=[CCScene  node];
    Quit *layer8=[Quit  node];
    [q  addChild:layer8];
    [[CCDirector  sharedDirector]replaceScene:q];
}
-(void)Guan{
    CCScene*r=[CCScene  node];
    Guanka*layer11=[Guanka  node];
    
    [r addChild:layer11];
    [[CCDirector  sharedDirector]replaceScene:r];
}
-(void)bang{
    CCScene*r=[CCScene  node];
    haoyou*layer11=[haoyou  node];
    
    [r addChild:layer11];
    [[CCDirector  sharedDirector]replaceScene:r];
}
-(void)help{
    CCScene*r=[CCScene  node];
    help*layer11=[help  node];
    
    [r addChild:layer11];
    [[CCDirector  sharedDirector]replaceScene:r];
}
-(void)shengjibaoku{
    CCScene*r=[CCScene  node];
    shengjibaoku*layer11=[shengjibaoku  node];
    
    [r addChild:layer11];
    [[CCDirector  sharedDirector]replaceScene:r];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
