//
//  Guanka.m
//  游戏菜单
//
//  Created by admin on 15-5-20.
//
//

#import "Guanka.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "guanka1.h"
#import "guanka2.h"
#import "yiban.h"
@implementation Guanka
-(id) init
{
	if( (self=[super init])) {
        CCSprite* bj=[CCSprite  spriteWithFile:@"fffg.jpg"];
        bj.position=ccp(160, 240);
        [self  addChild:bj];
        CCLabelTTF*label=[CCLabelTTF labelWithString:@"关卡类型" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:35];
        label.position=ccp(250, 230);
        ccColor3B color = ccc3(0, 250, 0);
        [label setColor:color];
        [self  addChild:label];
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:25];
        CCMenuItem* a=[CCMenuItemFont   itemFromString:@"简单" target:self selector:@selector(guanka1)];
        a.position=ccp(-100, 60);
        CCMenuItem* b=[CCMenuItemFont   itemFromString:@"一般" target:self selector:@selector(mao)];
        b.position=ccp(-20, 10);
        CCMenuItem* b1=[CCMenuItemFont   itemFromString:@"困难" target:self selector:@selector(nan)];
        b1.position=ccp(80, -40);
        CCMenuItemFont* b2=[CCMenuItemFont   itemFromString:@"游戏首页" target:self selector:@selector(back:)];
        [b2  setIsEnabled:YES];
        b2.position=ccp(10, -120);
      CCMenu*  menu=[CCMenu   menuWithItems:a,b,b1,b2,nil];
       // [menu   alignItemsVertically];
        [self  addChild:menu];
       
    }
    return self;
}
-(void)guanka1{
    CCScene*sc=[CCScene  node];
    guanka1*layer12=[guanka1  node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}
-(void)mao{
    CCScene*fei=[CCScene  node];
  guanka2*   layer88=[guanka2  node];
    [fei addChild:layer88];
    [[CCDirector  sharedDirector]replaceScene:fei];
}
-(void)nan{
    CCScene*n=[CCScene  node];
    yiban*layer99=[yiban  node];
    [n addChild:layer99];
    [[CCDirector   sharedDirector]replaceScene:n];
}
-(void)back:(id)sender{
    CCScene*o=[CCScene  node];
    HelloWorldLayer*layer9=[HelloWorldLayer   node];
    [o addChild:layer9];
    [[CCDirector   sharedDirector]replaceScene:o];
    
}

@end
