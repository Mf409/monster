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

#import "NewGame.h"
#import "Quit.h"
#import "beibao.h"
#import "jiangli.h"
#import "Guanka.h"
#import "SimpleAudioEngine.h"

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
        CCSprite* bj=[CCSprite  spriteWithFile:@"kil.jpg"];
        bj.position=ccp(160,240);
        //背景音乐
        [[SimpleAudioEngine  sharedEngine]playBackgroundMusic:@ "yinyue.mp3"];
       //CGSize size = [[CCDirector sharedDirector] winSize];
        [self  addChild:bj];
        //字体字号
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:40];
        //[CCMenuItemFont   setVersion:40];
         CCMenuItem* a3=[CCMenuItemFont   itemFromString:@"打怪兽" target:self selector:nil];
        [a3  setIsEnabled:NO];
        a3.position=ccp(100, 80);
        
        CCMenuItem* a=[CCMenuItemFont   itemFromString:@"新游戏" target:self selector:@selector(xinyou)];//newgame
        
        CCMenuItem* b=[CCMenuItemFont   itemFromString:@"游戏设置" target:self selector:@selector(setinggame)];//setgame
       
       
        CCMenuItem* c=[CCMenuItemFont   itemFromString:@"退出游戏" target:self selector:@selector(Quit)];
        CCMenuItem* n=[CCMenuItemFont   itemFromString:@"游戏关卡" target:self selector:@selector(Guan)];
        
        CCMenu*  menu=[CCMenu   menuWithItems:a3, a,b,n,c, nil];
        [menu   alignItemsVertically];
        [self  addChild:menu];
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
    NewGame *layer5=[NewGame  node];
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
