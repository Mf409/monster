//
//  shengjibaoku.m
//  游戏菜单
//
//  Created by admin on 15-5-15.
//
//

#import "shengjibaoku.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "guanka1.h"
#import "setGame.h"
#import "shengji.h"
@implementation shengjibaoku
+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    shengjibaoku *layer = [shengjibaoku node];
    
    // add layer as a child to scene
    [scene addChild: layer];
    
    // return the scene
    return scene;
}

-(id)init{
    if( (self=[super init])) {
        CCSprite* bj=[CCSprite  spriteWithFile:@"tttbn.jpeg"];
        bj.position=ccp(160, 240);
        [self  addChild:bj];
        
        CCLabelTTF*label1=[CCLabelTTF labelWithString:@"人物" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:25];
        label1.position=ccp(195, 285);
        ccColor3B color1 = ccc3(200, 250, 126);
        [label1 setColor:color1];
        [self  addChild:label1];
        
        CCLabelTTF*label2=[CCLabelTTF labelWithString:@"战机" dimensions:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) alignment:NSTextAlignmentLeft fontName:@"Marker Felt" fontSize:25];
        label2.position=ccp(380, 285);
        ccColor3B color2 = ccc3(200, 250, 126);
        [label2 setColor:color2];
        [self  addChild:label2];
        
        
        CCSprite* bj1=[CCSprite  spriteWithFile:@"sj1.png"];
        bj1.position=ccp(50, 250);
        //图片效果
        CGPoint o=ccp(75, 330);
        id action6 = [CCBlink actionWithDuration:5 blinks:10];
        id action=[bj1  runAction:[CCPlace  actionWithPosition:o]];
        [bj1 runAction:[CCSequence  actions:action,action6,  nil]];
        [self  addChild:bj1];
        
        CCSprite* bj2=[CCSprite  spriteWithFile:@"sj2.png"];
        bj2.position=ccp(50, 250);
        //图片效果
        CGPoint o1=ccp(245, 330);
        id action61 = [CCBlink actionWithDuration:5 blinks:10];
        id action1=[bj2  runAction:[CCPlace  actionWithPosition:o1]];
        [bj2 runAction:[CCSequence  actions:action1,action61,  nil]];
        [self  addChild:bj2];
        
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        
        CCMenuItemFont* a=[CCMenuItemFont   itemFromString:@"确定升级" target:self selector:@selector(ok:)];
        [a  setIsEnabled:YES];
        a.position=ccp(65, 300);
         CCMenu *menu=[CCMenu menuWithItems:a, nil];
        menu.position=ccp(175, 230);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:1],nil];
        [menu   alignItemsVertically];
        [self  addChild:menu];

        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:25];
        
        CCMenuItem* a90=[CCMenuItemFont   itemFromString:@"退出" target:self selector:@selector(quit)];
        
        CCMenuItem* a91=[CCMenuItemFont   itemFromString:@"设置" target:self selector:@selector(set)];
        
        CCMenu*  menu1=[CCMenu   menuWithItems:a90,a91, nil];
        menu1.position=ccp(175, 160);
        [menu1  alignItemsHorizontally];
        [self  addChild:menu1];

        
        
    }
    return self;
}

-(void)quit{
    CCScene*sc=[CCScene  node];
    HelloWorldLayer*layer12=[HelloWorldLayer  node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}
-(void)set{
    CCScene*sc=[CCScene  node];
    setGame*layer12=[setGame  node];
    [sc addChild:layer12];
    [[CCDirector   sharedDirector]replaceScene:sc];
}

-(void)ok:(UIButton *)sender{
    
    UIAlertView*nn=[[UIAlertView  alloc]initWithTitle:@"提示" message:@"是否愿意花费10000金币" delegate:self cancelButtonTitle:@"不愿意" otherButtonTitles:@"愿意", nil];
    [nn show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        UIAlertView*nn=[[UIAlertView  alloc]initWithTitle:@"提示" message:@"恭喜你升级成功" delegate:self cancelButtonTitle:@"进入游戏" otherButtonTitles:@"留在此页", nil];
        [nn show];
        
    }
    if(buttonIndex==0){
        [[CCDirector  sharedDirector]replaceScene:[shengji    scene]];
        
    }
}

@end
