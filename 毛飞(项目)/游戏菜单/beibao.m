//
//  beibao.m
//  游戏菜单
//
//  Created by maofei on 15/9/17.
//
//

#import "beibao.h"
#import "cocos2d.h"
#import "jiangli.h"
#import "HelloWorldLayer.h"
#import "yiban.h"
@implementation beibao
+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
   beibao *layer = [beibao node];
    
    // add layer as a child to scene
    [scene addChild: layer];
    
    // return the scene
    return scene;
}


-(id) init
{
    
    if( (self=[super init])) {
        CCSprite* bj202=[CCSprite  spriteWithFile:@"022.jpg"];
        bj202.position=ccp(160, 240);
        
        [self  addChild:bj202];
        CCSprite* bj=[CCSprite  spriteWithFile:@"201.jpg"];
        bj.position=ccp(80, 380);
        
        CGPoint o1=ccp(80, 380);
        id action60 = [CCBlink actionWithDuration:4 blinks:5];
        id action20=[bj  runAction:[CCPlace  actionWithPosition:o1]];
        [bj runAction:[CCSequence  actions:action20,action60,  nil]];
        [self  addChild:bj];
        
        CCSprite* bj1=[CCSprite  spriteWithFile:@"202.jpg"];
        bj1.position=ccp(245, 380);
        CGPoint o11=ccp(245, 380);
        id action601 = [CCBlink actionWithDuration:4 blinks:5];
        id action201=[bj  runAction:[CCPlace  actionWithPosition:o11]];
        [bj1 runAction:[CCSequence  actions:action201,action601,  nil]];
        [self  addChild:bj1];
  
        CCMenuItemFont* button=[CCMenuItemFont   itemFromString:@"远程战机" target:self selector:nil];
        button.position=ccp(80, 280);
        [button  setIsEnabled:YES];
        [self  addChild:button];
        CCMenuItemFont* button1=[CCMenuItemFont   itemFromString:@"护盾" target:self selector:nil];
        button1.position=ccp(245, 280);
        [button1  setIsEnabled:YES];
        [self  addChild:button1];
        CCSprite* bj2=[CCSprite  spriteWithFile:@"203.jpg"];
        bj2.position=ccp(80, 175);
        
        CGPoint po1=ccp(80, 175);
       id action600 = [CCBlink actionWithDuration:4 blinks:5];
        id action200=[bj1  runAction:[CCPlace  actionWithPosition:po1]];
        [bj2 runAction:[CCSequence  actions:action200,action600,  nil]];
       
        
        
        [self  addChild:bj2];
        CCSprite* bj3=[CCSprite  spriteWithFile:@"204.jpg"];
        bj3.position=ccp(245, 175);
        CGPoint uo1=ccp(245, 175);
        id action6001 = [CCBlink actionWithDuration:4 blinks:5];
        id action2001=[bj1  runAction:[CCPlace  actionWithPosition:uo1]];
        [bj3 runAction:[CCSequence  actions:action2001,action6001,  nil]];
        
        [self  addChild:bj3];
        CCMenuItemFont* button2=[CCMenuItemFont   itemFromString:@"小型战机" target:self selector:nil];
        button2.position=ccp(80,75);
        [button2  setIsEnabled:YES];
        [self  addChild:button2];
        CCMenuItemFont* button3=[CCMenuItemFont   itemFromString:@"中型战机" target:self selector:nil];
        button3.position=ccp(245, 75);
        [button3  setIsEnabled:YES];
        [self  addChild:button3];
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        CCMenuItemFont* b=[CCMenuItemFont   itemFromString:@"退出游戏" target:self selector:@selector(back:)];
        [b  setIsEnabled:YES];
        CCMenuItemFont* b1=[CCMenuItemFont   itemFromString:@"进入游戏" target:self selector:@selector(to:)];
        [b1  setIsEnabled:YES];
        CCMenu *menu=[CCMenu menuWithItems:b,b1, nil];
        menu.position=ccp(230, 40);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],nil];
        [self  addChild:menu];
        [menu   alignItemsHorizontally];
        CCParticleSystemQuad*mao=[CCParticleSystemQuad  particleWithFile:@"Galaxy.plist"];
        [self  addChild:mao];

}
    return self;
    }
-(void)back:(id)sender{
    CCScene*o=[CCScene  node];
    HelloWorldLayer*layer9=[HelloWorldLayer   node];
    [o addChild:layer9];
    [[CCDirector   sharedDirector]replaceScene:o];
    
}
-(void)to:(id)sender{
    CCScene*o=[CCScene  node];
   yiban*layer9=[yiban   node];
    [o addChild:layer9];
    [[CCDirector   sharedDirector]replaceScene:o];
    
}

@end
