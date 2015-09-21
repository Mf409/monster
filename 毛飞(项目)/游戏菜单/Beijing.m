//
//  Beijing.m
//  游戏菜单
//
//  Created by admin on 15-6-10.
//
//

#import "Beijing.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
@implementation Beijing
-(id)init{
    if(self==[super  init]){
        CCSprite* bj=[CCSprite  spriteWithFile:@"obobob.jpg"];
        bj.position=ccp(160,240);
        [self addChild:bj];
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        CCMenuItemFont* s=[CCMenuItemFont   itemFromString:@"该游戏讲的是一个古老的故事，在一个" target:self selector:nil];
        [s setIsEnabled:YES];
 
        CCMenuItemFont* s1=[CCMenuItemFont   itemFromString:@"叫悠闲村里住着三百多人他们过着" target:self selector:nil];
        [s1 setIsEnabled:YES];
       
        CCMenuItemFont* s2=[CCMenuItemFont   itemFromString:@"安逸的生活每天他们就是劳作，唱歌" target:self selector:nil];
        [s2 setIsEnabled:YES];

        CCMenuItemFont* s3=[CCMenuItemFont   itemFromString:@"但是这种日子在一个寂静的夜晚被打破了" target:self selector:nil];
        [s3 setIsEnabled:YES];
    
        CCMenuItemFont* s4=[CCMenuItemFont   itemFromString:@"因为村子里相传百年的怪兽复活了他来" target:self selector:nil];
        [s4 setIsEnabled:YES];
 
        CCMenuItemFont* s5=[CCMenuItemFont   itemFromString:@"到了这个村子他也许是为了报复，无情" target:self selector:nil];
        [s5 setIsEnabled:YES];
        CCMenuItemFont* s6=[CCMenuItemFont   itemFromString:@"的残杀该村子的男女老少,村里的村民" target:self selector:nil];
        [s6 setIsEnabled:YES];
        CCMenuItemFont* s7=[CCMenuItemFont   itemFromString:@"奋起反抗，抵御凶残的怪兽的一个故事。" target:self selector:nil];
        [s7 setIsEnabled:YES];
       
        CCMenuItemFont* b=[CCMenuItemFont   itemFromString:@"游戏首页" target:self selector:@selector(back:)];
        [b setIsEnabled:YES];
        CCMenu *menu=[CCMenu menuWithItems:s,s1,s2,s3,s4,s5,s6,s7,b,nil];
        menu.position=ccp(150, 300);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],nil];
        [self  addChild:menu];
    }
    return self;
}
-(void)back:(id)sender{
    CCScene*o=[CCScene  node];
    HelloWorldLayer*layer7=[HelloWorldLayer   node];
    [o addChild:layer7];
    [[CCDirector   sharedDirector]replaceScene:o];
    
}

@end
