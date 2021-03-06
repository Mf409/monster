//
//  NewGame.m
//  游戏菜单
//
//  Created by admin on 15-5-5.
//
//

#import "NewGame.h"
#import "cocos2d.h"
#import "Guanka.h"
#import "HelloWorldLayer.h"
#import "Quit.h"
#import "guoguan.h"
#import "SimpleAudioEngine.h"
#import "setGame.h"
#import "jiangli.h"
@implementation NewGame
@synthesize monstres,smokes,monstersDestroyed;
-(void)addMonster{
    CGSize size=[[CCDirector  sharedDirector]winSize];
    CCSprite* monster=[CCSprite   spriteWithFile:@"4副本.png"];
    [monstres  addObject:monster];
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
    int  maxduration=5;
    int  rangeduarstion=maxduration-minduration;
    int  arcualduration=(arc4random()%rangeduarstion)+minduration;
    //移动精灵
    CCMoveTo* move=[CCMoveTo actionWithDuration:arcualduration position:ccp(-monster.contentSize.height/2, actualy)];
    //调用函数
    CCCallBlockN* movedone=[CCCallBlockN  actionWithBlock:^(CCNode*node){
        [node removeAllChildrenWithCleanup:YES];}];
    [monster  runAction:[CCSequence  actions:move,movedone, nil]];
}

// on "init" you need to initialize your instance
-(id) init
{
    if( (self=[super init])) {
        monstres=[[NSMutableArray  alloc]init];
        smokes=[[NSMutableArray  alloc]init];
        
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
        [self setIsTouchEnabled:YES];
        CCSprite* bj=[CCSprite  spriteWithFile:@"5副本.jpg"];
        bj.position=ccp(160,  330);
        
        [self  addChild:bj];
        
        CCSprite* f=[CCSprite  spriteWithFile:@"10副本.png"];
        f.position=ccp(100, 100);
        [self  addChild:f];
        [self  schedule:@selector(gameLogic:)interval:1.0];
        CCMenuItemFont* b=[CCMenuItemFont   itemFromString:@"退出游戏" target:self selector:@selector(back:)];
        [b  setIsEnabled:YES];
        CCMenu *menu=[CCMenu menuWithItems:b, nil];
        menu.position=ccp(250, 80);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:1],nil];
        [self  addChild:menu];
        [self schedule:@selector(delete:)];
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

-(void)gameLogic:(ccTime)t{
    [self  addMonster];
    
}
-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    //鼠标位置
    CGPoint  location=[self  convertTouchToNodeSpace:touch];
    CGSize size=[[CCDirector  sharedDirector]winSize];
    CCSprite  *smoke=[CCSprite  spriteWithFile:@"14副本.png"];
    smoke.position=ccp(300, 100);
    [smokes  addObject:smoke];
    //子弹声音特效
    [[SimpleAudioEngine sharedEngine]playEffect:@"yinyue.mp3"];
    
    //子弹位置
    smoke.position=ccp(20,size.height/3);
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
            if(monstersDestroyed>5){
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
    
    
    
    
}

@end
