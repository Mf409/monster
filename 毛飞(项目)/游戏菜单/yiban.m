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
@implementation yiban
@synthesize monstres,smokes,monstersDestroyed,monstres1,smokes1;

-(void)addMonster{
    CGSize size=[[CCDirector  sharedDirector]winSize];
    CCSprite* monster=[CCSprite   spriteWithFile:@"3副本 2.png"];
    CCSprite* monster1=[CCSprite   spriteWithFile:@"4副本 2.png"];
    [monstres  addObject:monster];
    [monstres1  addObject:monstres1];
    //精灵的位置大小
    int  miny=monster.contentSize.width/2;
    int  maxy=size.height-monster.contentSize.height/2;
    int  rangey=maxy-miny;
    //产生随机数
    int  actualy=(arc4random()%rangey)+miny;
    monster.position=ccp(size.height+monster.contentSize.height/2,actualy);
    [self addChild:monster];
    //经过屏幕怒的时间长短
    int  minduration=2;
    int  maxduration=5;
    int  rangeduarstion=maxduration-minduration;
    int  arcualduration=(arc4random()%rangeduarstion)+minduration;
    //移动精灵
    CCMoveTo* move=[CCMoveTo actionWithDuration:arcualduration position:ccp(-monster.contentSize.width/2, actualy)];
    //调用函数
    CCCallBlockN* movedone=[CCCallBlockN  actionWithBlock:^(CCNode  *node){[monstres removeObject:monster];}];
    
    [monster  runAction:[CCSequence  actions:move,movedone, nil]];
    //怪兽从上向下
    //精灵的位置大小
    int  minx=monster1.contentSize.width/2;
    int  maxx=size.width-monster1.contentSize.width/2;
    int  rangex=maxx-minx;
    //产生随机数
    int  actualy1=(arc4random()%rangex)+minx;
    monster1.position=ccp(actualy1,size.height+monster1.contentSize.height/2);
    [self addChild:monster1];
    //经过屏幕怒的时间长短
    int  minduration1=2;
    int  maxduration1=5;
    int  rangeduarstion1=maxduration1-minduration1;
    int  arcualduration1=(arc4random()%rangeduarstion1)+minduration1;
    //移动精灵
    CCMoveTo* move1=[CCMoveTo actionWithDuration:arcualduration1 position:ccp(-monster1.contentSize.height/2, actualy1)];
    //调用函数
    CCCallBlockN* movedone1=[CCCallBlockN  actionWithBlock:^(CCNode*node){
        [node removeAllChildrenWithCleanup:YES];}];
    
    
    
    [monster1  runAction:[CCSequence  actions:move1,movedone1, nil]];
}

// on "init" you need to initialize your instance

-(id) init
{
	if( (self=[super init])) {
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];

        CCSprite* bj=[CCSprite  spriteWithFile:@"6副本.jpg"];
        bj.position=ccp(160, 240);
        
        [self  addChild:bj];
        [[SimpleAudioEngine  sharedEngine]playBackgroundMusic:@"nabc.mp3"];
        //触摸事件
        monstres=[[NSMutableArray  alloc]init];
        smokes=[[NSMutableArray  alloc]init];
        monstres1=[[NSMutableArray  alloc]init];
        smokes1=[[NSMutableArray  alloc]init];
        [self setIsTouchEnabled:YES];
		CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite* f=[CCSprite  spriteWithFile:@"11副本.png"];
        f.position=ccp(35, 100);
        [self  addChild:f];
        CCMenuItemFont* b=[CCMenuItemFont   itemFromString:@"退出游戏" target:self selector:@selector(back:)];
        [b  setIsEnabled:YES];
        CCMenu *menu=[CCMenu menuWithItems:b, nil];
        menu.position=ccp(250, 80);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:1],nil];
        [self  addChild:menu];

        [self  schedule:@selector(gameLogic:)interval:1];
        [self schedule:@selector(delete:)];
    }
	return self;
}
-(void)back:(id)sender{
    CCScene*o=[CCScene  node];
    HelloWorldLayer*layer9=[HelloWorldLayer   node];
    [o addChild:layer9];
    [[CCDirector   sharedDirector]replaceScene:o];
    
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    //鼠标位置
    CGPoint  location=[self  convertTouchToNodeSpace:touch];
    CGSize size=[[CCDirector  sharedDirector]winSize];
    CCSprite  *smoke=[CCSprite  spriteWithFile:@"14副本 2.png"];
    CCSprite  *smoke1=[CCSprite  spriteWithFile:@"12副本.png"];
    [smokes addObject:smoke];
    [smokes1 addObject:smoke1];
    //子弹声音特效
    [[SimpleAudioEngine  sharedEngine]playEffect:@"yinyue.mp3"];
    //每触发一次出现一次
    //子弹位置
    smoke.position=ccp(20,size.height/3);
    smoke1.position=ccp(20,size.height/3);
    
    
    //偏移
    CGPoint offset=ccpSub(location, smoke.position);
    if (offset.x<0) {
        return;
    }
    [self addChild:smoke];
    
    //x坐标
    int realx=size.width+smoke.contentSize.width/2;
    float  r=offset.y/offset.x;
    //y坐标
    int  realy=realx*r+smoke.position.y;
    //最终位置
    CGPoint realdest=ccp(realx, realy);
    int m1=realx-smoke.position.x;
    int  m2=realy-smoke.position.y;
    float length=sqrtf(m1*m1+m2*m2);
    int v=480/1;
    float s=length/v;
    //移动
    CCMoveTo* moveto=[CCMoveTo actionWithDuration:s position:realdest];
    CCCallBlockN* movedone=[CCCallBlockN  actionWithBlock:^(CCNode  *node){[smokes removeObject:smoke];}];
    [smoke  runAction:[CCSequence  actions:moveto,movedone, nil]];
    
    
}
//打中怪兽消失
-(void)delete:(ccTime)de{
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
            if(monstersDestroyed>5){
                CCScene*mmm=[CCScene  node];
                tongguan*layer=[tongguan node];
                [mmm  addChild:layer];
                [[CCDirector  sharedDirector]replaceScene:mmm];
            }

            if(monsterToDelete.count>0){
                [smokesToDelete  addObject:smoke];
            }
        }
        for(CCSprite *smoke in smokesToDelete){
            [smokes removeObject:smoke];
            [self removeChild:smoke cleanup:YES];
        }
    }
    
    
    
}

-(void)gameLogic:(ccTime)t{
    [self  addMonster];
    
}
@end
