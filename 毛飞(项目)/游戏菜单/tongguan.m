//
//  tongguan.m
//  游戏菜单
//
//  Created by admin on 15-5-26.
//
//

#import "tongguan.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "yiban.h"
@implementation tongguan
-(id) init
{
	if( (self=[super init])) {
        CCSprite* bj=[CCSprite  spriteWithFile:@"cv.jpg"];
        bj.position=ccp(150,  330);
        [self  addChild:bj];
        
        
        CCLabelTTF*label=[CCLabelTTF labelWithString:@"恭喜你通关！" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:25];
        label.position=ccp(250, 180);
        ccColor3B color = ccc3(200, 250, 126);
        [label setColor:color];
        [self  addChild:label];
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        
        
        CCMenuItem* a3=[CCMenuItemFont   itemFromString:@"退出游戏" target:self selector:@selector(over)];
        [a3  setIsEnabled:YES];
        a3.position=ccp(160, 280);
        CCMenu*  menu=[CCMenu   menuWithItems:a3, nil];
        //以列的方式摆放
        //[menu   alignItemsVertically];
        [menu  alignItemsHorizontally];
        menu.position=ccp(160, 280);
        [self  addChild:menu];

  
        CCParticleSystemQuad*mao=[CCParticleSystemQuad  particleWithFile:@"LavaFlow.plist"];
        [self  addChild:mao];
        
    }
    return self;
}
-(void)over{
    CCScene*fei=[CCScene  node];
   HelloWorldLayer*   layer88=[HelloWorldLayer  node];
    [fei addChild:layer88];
    [[CCDirector  sharedDirector]replaceScene:fei];
}

@end
