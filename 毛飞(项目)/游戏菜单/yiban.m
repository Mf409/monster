//
//  yiban.m
//  游戏菜单
//
//  Created by admin on 15-6-3.
//
//

#import "yiban.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "Guanka.h"
#import "SimpleAudioEngine.h"
#import "tongguan.h"
#import "beibao.h"
#import "zhanji.h"
#import "fuhuo.h"
#import "PauseLayer.h"
@implementation yiban
@synthesize monstres,smokes,monstersDestroyed,monstres1,smokes1;

-(void)addMonster{
    CGSize size=[[CCDirector  sharedDirector]winSize];
    CCSprite* monster=[CCSprite   spriteWithFile:@"4副本.png"];
    CCSprite* monster1=[CCSprite   spriteWithFile:@"grey.png"];
    [monstres  addObject:monster];
    [monstres1  addObject:monstres1];
    //精灵的位置大小
    int  minx=monster.contentSize.width/2;
    int  maxx=size.width-monster.contentSize.width/2;
    int  rangex=maxx-minx;
    //产生随机数
    int  actualy=(arc4random()%rangex)+minx;
    monster.position=ccp(actualy,size.height+monster.contentSize.height/2);
    [self addChild:monster];
    //经过屏幕怒的时间长短
    int  minduration=2;
    int  maxduration=4;
    int  rangeduarstion=maxduration-minduration;
    int  arcualduration=(arc4random()%rangeduarstion)+minduration;
    //移动精灵(敌机俯冲)
    //CCMoveTo* move=[CCMoveTo actionWithDuration:arcualduration position:ccp(-monster.contentSize.height/2, actualy)];
    id moveBy = [CCMoveBy actionWithDuration:arcualduration
                 
                                    position:ccp(0,-monster.position.y-monster.contentSize.height)];
    
    [monster runAction:moveBy];
    
    //调用函数
    CCCallBlockN* movedone=[CCCallBlockN  actionWithBlock:^(CCNode*node){
        [node removeAllChildrenWithCleanup:YES];}];
    [monster  runAction:[CCSequence  actions:moveBy,movedone, nil]];
    
    
    //从左往右
    
    //精灵的位置大小
    int  miny=monster1.contentSize.width/2;
    int  maxy=size.height-monster1.contentSize.height/2;
    int  rangey=maxy-miny;
    //产生随机数
    int  actualy1=(arc4random()%rangey)+miny;
    monster1.position=ccp(size.height+monster1.contentSize.height/2,actualy1);
    [self addChild:monster1];
    //经过屏幕怒的时间长短
    int  minduration1=2;
    int  maxduration1=5;
    int  rangeduarstion1=maxduration1-minduration1;
    int  arcualduration1=(arc4random()%rangeduarstion1)+minduration1;
    //移动精灵
    CCMoveTo* move=[CCMoveTo actionWithDuration:arcualduration1 position:ccp(-monster1.contentSize.width/2, actualy)];
    
    
    //调用函数
    CCCallBlockN* movedone1=[CCCallBlockN  actionWithBlock:^(CCNode  *node){[monstres1 removeObject:monster1];}];
    
    [monster1  runAction:[CCSequence  actions:move,movedone1, nil]];
    
    
    

}

// on "init" you need to initialize your instance

-(id) init
{
	if( (self=[super init])) {
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];

        CCSprite* bj=[CCSprite  spriteWithFile:@"lklkl.jpg"];
        bj.position=ccp(160, 240);
        
        [self  addChild:bj];
        [[SimpleAudioEngine  sharedEngine]playBackgroundMusic:@"nabc.mp3"];
        //触摸事件
        monstres=[[NSMutableArray  alloc]init];
        smokes=[[NSMutableArray  alloc]init];
        monstres1=[[NSMutableArray  alloc]init];
        smokes1=[[NSMutableArray  alloc]init];
        [self setIsTouchEnabled:YES];
		
        _f=[CCSprite  spriteWithFile:@"01020.png"];
       _f.position=ccp(35, 100);
        [self  addChild:_f];
        
        CCMenuItemFont* b=[CCMenuItemFont   itemFromString:@"退出游戏" target:self selector:@selector(back:)];
        [b  setIsEnabled:YES];
        CCMenuItemFont* a=[CCMenuItemFont   itemFromString:@"暂停" target:self selector:@selector(myButton:)];
        [a  setIsEnabled:YES];

        
        CCMenu *menu=[CCMenu menuWithItems:a,b, nil];
        menu.position=ccp(250, 80);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],nil];
        [self  addChild:menu];
//怪兽出现的速度
        [self  schedule:@selector(gameLogic:)interval:0.25];
        [self schedule:@selector(delete:)];
        _timer= [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(shoot) userInfo:nil repeats:YES];
    }
	return self;
}
-(void)back:(id)sender{
    CCScene*o=[CCScene  node];
    HelloWorldLayer*layer9=[HelloWorldLayer   node];
    [o addChild:layer9];
    [[CCDirector   sharedDirector]replaceScene:o];
    
}

//飞机移动（滑动）
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch* touch = [touches anyObject];
    CGPoint location = [self convertTouchToNodeSpace: touch];
    if (_f) {
        _f.position=ccp(location.x, location.y);
    }

}
-(void)shoot{
    CCSprite  *smoke=[CCSprite  spriteWithFile:@"14副本 2.png"];
    [smoke setOpacity:150];
    ccColor3B smoke1 = ccc3(0,255,0);
    [smoke setColor:smoke1];
    

    smoke.position=ccp(300, 100);
    [smokes  addObject:smoke];
    //子弹声音特效
    [[SimpleAudioEngine sharedEngine]playEffect:@"yinyue.mp3"];
    
    //子弹位置
    if (_f) {
        smoke.position=ccp(_f.position.x,_f.position.y+50);
         [self  addChild:smoke];
    }
    //x坐标
    int realx=smoke.position.x;
    //y坐标
    int  realy=[UIScreen mainScreen].bounds.size.height + smoke.contentSize.height;
    //最终位置
    CGPoint realdest=ccp(realx, realy);
    int m1=realx-smoke.position.x;
    int  m2=realy-smoke.position.y;
    float length=sqrtf(m1*m1+m2*m2);
    int v=320/1;
    float s=length/v;
    //移动
    CCMoveTo* moveto=[CCMoveTo actionWithDuration:s position:realdest];
    CCCallBlockN* movedone=[CCCallBlockN  actionWithBlock:^(CCNode*node){
        [node removeAllChildrenWithCleanup:YES];}];
    [smoke  runAction:[CCSequence  actions:moveto,movedone, nil]];
}
//打中怪兽消失
-(void)delete:(id)de{
    //存放消失的怪兽
    NSMutableArray *smokesToDelete=[[NSMutableArray  alloc]init];
    for(CCSprite *smoke in smokes){
        //怪兽消失
        NSMutableArray *monsterToDelete=[[NSMutableArray  alloc]init];
        for(CCSprite *monster in monstres){
            if (CGRectIntersectsRect(smoke.boundingBox, monster.boundingBox)) {
                [monsterToDelete  addObject:monster];
                }
        }
        //删除掉的怪兽
        for(CCSprite *monster in monsterToDelete){
            //当前图层
            [monstres removeObject:monster];
            [self removeChild:monster cleanup:YES];
            //打够9个怪兽、跳转下一个场景
            monstersDestroyed=monstersDestroyed+1;
            if(monstersDestroyed>30){
                CCScene*mmm=[CCScene  node];
                guoguan*layer=[guoguan node];
                [mmm  addChild:layer];
                [[CCDirector  sharedDirector]replaceScene:mmm];
    }
            
            if(monsterToDelete.count>0){
                [smokesToDelete  addObject:smoke];
            }
        }}
    
    for(CCSprite *smoke in smokesToDelete){
        [smokes removeObject:smoke];
        [self removeChild:smoke cleanup:YES];
    }
    for(CCSprite *monster in monstres){
        if (_f) {
            if (CGRectIntersectsRect(_f.boundingBox, monster.boundingBox)) {
                //[self removeChild:monster cleanup:YES];
                [_timer invalidate];
                _timer = nil;
                [self performSelector:@selector(destroyFly) withObject:nil afterDelay:0.2];
            }
        }
    }

}

-(void)gameLogic:(ccTime)t{
    [self  addMonster];
    
}
- (void)destroyFly {
    [self removeChild:_f cleanup:YES];
    _f = nil;
    CCScene*mm=[CCScene  node];
    fuhuo*yer=[fuhuo node];
    [mm  addChild:yer];
    [[CCDirector  sharedDirector]replaceScene:mm];
}
//暂停游戏的调用
-(void)myButton:(UIButton *)sender{
    [[CCDirector sharedDirector] pause];
    
    UIAlertView*nn=[[UIAlertView alloc]initWithTitle:@"提示" message:@"确定暂停" delegate:self cancelButtonTitle:@"继续游戏" otherButtonTitles:@"退出游戏", nil];
    [nn show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        //继续游戏
        [[CCDirector sharedDirector] resume];
    } else {
        [[CCDirector  sharedDirector]replaceScene:[HelloWorldLayer scene]];
        
        
    }
}

@end
