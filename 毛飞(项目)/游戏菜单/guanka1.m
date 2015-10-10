//
//  guanka1.m
//  游戏菜单
//
//  Created by admin on 15-5-20.
//
//

#import "guanka1.h"
#import "cocos2d.h"
#import "Guanka.h"
#import "HelloWorldLayer.h"
#import "Quit.h"
#import "guoguan.h"
#import "SimpleAudioEngine.h"
#import "setGame.h"
#import "jiangli.h"
#import "fenshu.h"
#import "zhanji.h"
#import "help.h"
#import "fuhuo.h"
#import "PauseLayer.h"
@implementation guanka1
@synthesize monstres,smokes,monstersDestroyed;
+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    guanka1 *layer = [guanka1 node];
    
    // add layer as a child to scene
    [scene addChild: layer];
    
    // return the scene
    return scene;
}

-(void)addMonster{
    CGSize size=[[CCDirector  sharedDirector]winSize];
    CCSprite* monster=[CCSprite   spriteWithFile:@"4副本.png"];
    
    
    
    [monstres  addObject:monster];
    //精灵的位置大小
//    int  minx=monster.contentSize.width/2;
//    int  maxx=size.width-monster.contentSize.width/2;
//    int  rangex=maxx-minx;
    //产生随机数
    float sw = [UIScreen mainScreen].bounds.size.width;
    int  actualy = (arc4random()%(int)((int)sw * 1.5)) - (int)sw * 0.25;
    monster.position=ccp(actualy,size.height+monster.contentSize.height/2);
    [self addChild:monster];

    //经过屏幕怒的时间长短
    int  minduration=2;
    int  maxduration=5;
    int  rangeduarstion=maxduration-minduration;
    int  arcualduration=(arc4random()%rangeduarstion)+minduration;
    //移动精灵（敌机俯冲）
    //CCMoveTo* move=[CCMoveTo actionWithDuration:arcualduration position:ccp(-monster.contentSize.height/2, actualy)];
    int  ranran = (arc4random()%400)-200;
    NSLog(@"%d", ranran);

    id moveBy = [CCMoveBy actionWithDuration:arcualduration
                 
                                    position:ccp(ranran,-monster.position.y-monster.contentSize.height)];
    
    [monster runAction:moveBy];


    
    
    //调用函数
    CCCallBlockN* movedone=[CCCallBlockN  actionWithBlock:^(CCNode*node){
        [node removeAllChildrenWithCleanup:YES];}];
    [monster  runAction:[CCSequence  actions:moveBy,movedone, nil]];
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
        //定义两个图片使背景图片滚动
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        CCSprite* bj=[CCSprite  spriteWithFile:@"5副本.jpg"];
        bj.position=ccp(screenSize.width*0.5, screenSize.height*0.5);
        CCSprite *bj2=[CCSprite spriteWithFile:@"lou.jpg"];
        bj2.position=ccp(bj.position.x, bj.position.y - (bj.contentSize.height + bj2.contentSize.height) / 2);
        [bj.texture setAliasTexParameters];
        [bj2.texture  setAliasTexParameters];
        [self schedule:@selector(move)interval:0.05];
        [self  addChild:bj  z:0 tag:11];
        [self addChild:bj2 z:0 tag:22];
        
        
         //飞机位置
        _f=[CCSprite  spriteWithFile:@"10副本.png"];
        _f.position=ccp(100, 100);
        [self  addChild:_f];
        //怪兽出来的速度(多少)
        [self  schedule:@selector(gameLogic:)interval:0.1];
        
        
        CCMenuItemFont* b=[CCMenuItemFont   itemFromString:@"退出游戏" target:self selector:@selector(back:)];
        [b  setIsEnabled:YES];
        CCMenuItemFont* a=[CCMenuItemFont   itemFromString:@"暂停" target:self selector:@selector(myButton:)];
        [a  setIsEnabled:YES];
        CCMenu *menu=[CCMenu menuWithItems:a,b, nil];
        menu.position=ccp(250, 80);
        [menu  alignItemsInColumns:[NSNumber  numberWithUnsignedInt:1],[NSNumber  numberWithUnsignedInt:1],nil];
        [self  addChild:menu];
        //删除精灵的遍历
          [self schedule:@selector(delete:)];
        //中间子弹的时间
        _timer=[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(shoot) userInfo:nil repeats:YES];
        //左右两侧的子弹出现时间
        _timer2=[NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(shoot2) userInfo:nil repeats:YES];
        }
	return self;
}
//使背景图片向上移动
-(void)move{
    CCSprite*tempSprite=(CCSprite *)[self getChildByTag:11];
    tempSprite.position=ccpAdd(tempSprite.position, ccp(0, 1));
    tempSprite=(CCSprite *)[self getChildByTag:22];
    tempSprite.position=ccpAdd(tempSprite.position, ccp(0, 1));
    
    
    
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
//飞机移动（滑动）
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch* touch = [touches anyObject];
    CGPoint location = [self convertTouchToNodeSpace: touch];
    if (_f) {
        _f.position=ccp(location.x, location.y);
    }}
//左右两侧的子弹
- (void)shoot2 {
    CCSprite  *smoke1=[CCSprite  spriteWithFile:@"dandan.png"];
    smoke1.position=ccp(150, 10);
    //子弹位置
    if (_f) {
        smoke1.position=ccp(_f.position.x - 30,_f.position.y);
    }
    ccColor3B smokeo1 = ccc3(100, 210, 126);
    [smoke1 setOpacity:120];
    [smoke1 setColor:smokeo1];
    //[smokes1  addObject:smoke1];
    [self addChild:smoke1];
    //x坐标
    int realx1=smoke1.position.x - 60;
    //y坐标
    int  realy1=[UIScreen mainScreen].bounds.size.height + smoke1.contentSize.height;
    //最终位置
    CGPoint realdest1=ccp(realx1, realy1);
    int m11=realx1-smoke1.position.x;
    int  m21=realy1-smoke1.position.y;
    float length1=sqrtf(m11*m11+m21*m21);
    int v1=160/1;
    float s1=length1/v1;
    //移动
    CCMoveTo* moveto1=[CCMoveTo actionWithDuration:s1 position:realdest1];
    CCCallBlockN* movedone1=[CCCallBlockN  actionWithBlock:^(CCNode*node){
        [node removeAllChildrenWithCleanup:YES];}];
    [smoke1  runAction:[CCSequence  actions:moveto1,movedone1, nil]];
    [smokes  addObject:smoke1];
    
    
    CCSprite  *smoke2=[CCSprite  spriteWithFile:@"dandan.png"];
    smoke2.position=ccp(150, 10);
    //子弹位置
    if (_f) {
        smoke2.position=ccp(_f.position.x + 30,_f.position.y);
    }
    ccColor3B smokeo2 = ccc3(200, 250, 126);
    [smoke2 setOpacity:120];
    [smoke2 setColor:smokeo2];
    //[smokes1  addObject:smoke1];
    [self addChild:smoke2];
    //x坐标
    int realx2=smoke2.position.x + 60;
    //y坐标
    int  realy2=[UIScreen mainScreen].bounds.size.height + smoke2.contentSize.height;
    //最终位置
    CGPoint realdest2=ccp(realx2, realy2);
    int m12=realx2-smoke2.position.x;
    int  m22=realy2-smoke2.position.y;
    float length2=sqrtf(m12*m12+m22*m22);
    int v2=160/1;
    float s2=length2/v2;
    //移动
    CCMoveTo* moveto2=[CCMoveTo actionWithDuration:s2 position:realdest2];
    CCCallBlockN* movedone2=[CCCallBlockN  actionWithBlock:^(CCNode*node){
        [node removeAllChildrenWithCleanup:YES];}];
    [smoke2  runAction:[CCSequence  actions:moveto2,movedone2, nil]];
    [smokes  addObject:smoke2];
}



- (void)shoot {
    
    CCSprite  *smoke=[CCSprite  spriteWithFile:@"14副本.png"];
    smoke.position=ccp(300, 100);
    //子弹的颜色
    //ccColor4B smoke2 =ccc4(120, 201, 103, 128);
    ccColor3B smoke1 = ccc3(255,0,255);
    [smoke setOpacity:150];
    [smoke setColor:smoke1];
    
    [smokes  addObject:smoke];
    //子弹声音
    [[SimpleAudioEngine sharedEngine]playEffect:@"yinyue.mp3"];
    
    //子弹位置
    if (_f) {
        smoke.position=ccp(_f.position.x,_f.position.y+50);
    }
    [self addChild:smoke];
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
    //判断飞机于怪兽碰撞时飞机消失
    for(CCSprite *monster in monstres){
        if (_f) {
            
            if (CGRectIntersectsRect(_f.boundingBox, monster.boundingBox)) {
               
                [_timer invalidate];
                
                _timer = nil;
                
                [self performSelector:@selector(destroyFly) withObject:nil afterDelay:0.2];
            }
        }
    }

}
//销毁飞机（重新定义飞机为空）
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
