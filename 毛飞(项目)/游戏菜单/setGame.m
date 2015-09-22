//
//  setGame.m
//  游戏菜单
//
//  Created by admin on 15-4-29.
//
//

#import "setGame.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "Quit.h"
#import "guanka1.h"
@implementation setGame
-(id)init{
    if(self==[super  init]){
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:25];
        CCSprite*v=[CCSprite  spriteWithFile:@"lpl.jpg"];
        v.position=ccp(160, 240);
        [self  addChild:v];
        CCMenuItemFont *m1=[CCMenuItemFont  itemFromString:@"飞机类型"];
        [m1  setIsEnabled:NO];
        CCMenuItemToggle* m=[CCMenuItemToggle  itemWithTarget:self selector:nil items:[CCMenuItemFont  itemFromString:@"大型机"],
                             [CCMenuItemFont  itemFromString:@"小型机"],[CCMenuItemFont  itemFromString:@"中型机"],nil];
        CCMenuItemFont *f1=[CCMenuItemFont  itemFromString:@"属性"];
        [f1  setIsEnabled:NO];
        CCMenuItemToggle* f=[CCMenuItemToggle  itemWithTarget:self selector:nil items:[CCMenuItemFont  itemFromString:@"攻击机"],
                             [CCMenuItemFont  itemFromString:@"轰炸机"],[CCMenuItemFont  itemFromString:@"运输机"],[CCMenuItemFont  itemFromString:@"隐形机"],nil];
        CCMenuItemFont *e1=[CCMenuItemFont   itemFromString:@"关卡"];
        [e1  setIsEnabled:NO];
        CCMenuItemToggle *e=[CCMenuItemToggle  itemWithTarget:self selector:nil items:[CCMenuItemFont itemFromString:@"容易"], [CCMenuItemFont itemFromString:@"简单"],[CCMenuItemFont itemFromString:@"一般"],nil];
        CCMenuItemFont *i1=[CCMenuItemFont   itemFromString:@"种类"];
        [i1  setIsEnabled:NO];
        CCMenuItemToggle *i=[CCMenuItemToggle  itemWithTarget:self selector:nil items:[CCMenuItemFont itemFromString:@"单击型"], [CCMenuItemFont itemFromString:@"双发型"],[CCMenuItemFont itemFromString:@"多发型"],nil];
        CCMenuItemFont *sb=[CCMenuItemFont   itemFromString:@"射程"];
         [sb setIsEnabled:NO];
         CCMenuItemToggle *s=[CCMenuItemToggle  itemWithTarget:self selector:nil items:[CCMenuItemFont itemFromString:@"近程"], [CCMenuItemFont itemFromString:@"远程"],[CCMenuItemFont itemFromString:@"中程"],nil];
        CCMenuItemFont* b=[CCMenuItemFont   itemFromString:@"首页" target:self selector:@selector(back:)];
        CCMenuItemFont* r=[CCMenuItemFont itemFromString:@"进入游戏" target:self  selector:@selector(go)];
        
        CCMenu *menu=[CCMenu menuWithItems:m1,m,f1,f,sb,s,i1,i,e1,e,b,r, nil];
        
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:2],[NSNumber  numberWithUnsignedInt:2],[NSNumber  numberWithUnsignedInt:2],[NSNumber  numberWithUnsignedInt:2],[NSNumber  numberWithUnsignedInt:2],[NSNumber  numberWithUnsignedInt:1], [NSNumber  numberWithUnsignedInt:1], nil];
        [self  addChild:menu];
        CCParticleSystemQuad*mao=[CCParticleSystemQuad  particleWithFile:@"OneParticle.plist"];
        [self  addChild:mao];

        
       }
    return self;
}
-(void)back:(id)sender{
    CCScene*o=[CCScene  node];
    HelloWorldLayer*layer3=[HelloWorldLayer   node];
    [o addChild:layer3];
    [[CCDirector   sharedDirector]replaceScene:o];

}
-(void)go{
    CCScene*v=[CCScene  node];
    guanka1*layer0=[guanka1  node];
    [v addChild:layer0];
    [[CCDirector  sharedDirector]replaceScene:v];
}
@end
