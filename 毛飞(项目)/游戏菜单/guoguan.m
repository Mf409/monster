//
//  guoguan.m
//  游戏菜单
//
//  Created by admin on 15-5-28.
//
//

#import "guoguan.h"
#import "HelloWorldLayer.h"
#import "cocos2d.h"
#import "guanka1.h"
#import "guanka2.h"
#import "jiangli.h"
#import "fenshu.h"
@implementation guoguan
-(id) init
{
	if( (self=[super init])) {
             CCSprite* bj=[CCSprite  spriteWithFile:@"memed.jpg"];
              bj.position=ccp(150, 300);
            [self  addChild:bj];
        
        
        CCLabelTTF*label=[CCLabelTTF labelWithString:@"恭喜过关" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:30];
        label.position=ccp(270, 180);
        ccColor3B color = ccc3(0, 250, 0);
        [label setColor:color];
        [self  addChild:label];
        
        
        
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        CCMenuItem* a9=[CCMenuItemFont   itemFromString:@"查看分数" target:self selector:@selector(fenshu)];
        CCMenuItem* a0=[CCMenuItemFont   itemFromString:@"获得奖励，请注意领取" target:self selector:@selector(jiangli)];
        CCMenuItem* a1=[CCMenuItemFont   itemFromString:@"进入下一关卡" target:self selector:@selector(jixu)];
        CCMenuItem* a2=[CCMenuItemFont   itemFromString:@"重新玩次关卡" target:self selector:@selector(tuichu)];
     
        CCMenu*  menu=[CCMenu   menuWithItems:a9, a1,a2,a0, nil];
        [menu   alignItemsVertically];
        [self  addChild:menu];
        CCParticleSystemQuad*mao=[CCParticleSystemQuad  particleWithFile:@"Phoenix.plist"];
        [self  addChild:mao];
    }  
    return self;
}
-(void)jixu{       
    CCScene*sc=[CCScene  node];
    guanka2*layer12=[guanka2  node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}

-(void)tuichu{
    CCScene*sc1=[CCScene  node];
    guanka1*layer21=[guanka1  node];
    
    [sc1  addChild:layer21];
    [[CCDirector  sharedDirector]replaceScene:sc1];
}
-(void)jiangli{
    CCScene *sc102=[CCScene  node];
    jiangli *layer201=[jiangli  node];
    [sc102 addChild:layer201];
    [[CCDirector sharedDirector]replaceScene:sc102];
}
-(void)fenshu{
    CCScene *sc1020=[CCScene  node];
    fenshu *layer2010=[fenshu node];
    [sc1020 addChild:layer2010];
    [[CCDirector sharedDirector]replaceScene:sc1020];
}
@end
