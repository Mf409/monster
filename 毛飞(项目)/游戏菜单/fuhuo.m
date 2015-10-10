//
//  fuhuo.m
//  游戏菜单
//
//  Created by admin on 15-5-13.
//
//

#import "fuhuo.h"
#import"cocos2d.h"
#import "HelloWorldLayer.h"
#import "guanka1.h"
#import "shengji.h"
@implementation fuhuo
-(id)init{
    if( (self=[super init])) {
        CCSprite* bj=[CCSprite  spriteWithFile:@"vfddd.jpg"];
        bj.position=ccp(160, 240);
        [self  addChild:bj];
        
        CCLabelTTF*label=[CCLabelTTF labelWithString:@"你已被小怪咬死,请选择！" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:25];
        label.position=ccp(195, 180);
        ccColor3B color = ccc3(255,0,0);
        [label setColor:color];
        [self  addChild:label];
        
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        
        CCMenuItemFont* a=[CCMenuItemFont   itemFromString:@"复活" target:self selector:@selector(ok:)];
        [a  setIsEnabled:YES];
      
        
        CCMenuItemFont* a1=[CCMenuItemFont   itemFromString:@"退出游戏" target:self selector:@selector(back)];
        [a1  setIsEnabled:YES];
        
        CCMenu *menu=[CCMenu menuWithItems:a,a1, nil];
        menu.position=ccp(155,250);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],nil];
        [menu   alignItemsVertically];
        [self  addChild:menu];
        
        
}
    return self;
}
-(void)ok:(UIButton *)sender{
    
    UIAlertView*nn=[[UIAlertView  alloc]initWithTitle:@"提示" message:@"确定花费20钻石复活" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [nn show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [[CCDirector  sharedDirector]replaceScene:[guanka1 scene]];
        
    }
    }

-(void)back{
    CCScene*sc=[CCScene  node];
    HelloWorldLayer*layer12=[HelloWorldLayer  node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}
@end
