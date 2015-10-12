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
+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    yiban *layer = [yiban node];
    
    // add layer as a child to scene
    [scene addChild: layer];
    
    // return the scene
    return scene;
}
-(void)addMonster{
    CGSize size=[[CCDirector  sharedDirector]winSize];
    CCSprite* monster=[CCSprite   spriteWithFile:@"4副本.png"];
    CCSprite* monster1=[CCSprite   spriteWithFile:@"grey.png"];
    [monstres  addObject:monster];
    [monstres  addObject:monster1];
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
    int  maxduration=4;
    int  rangeduarstion=maxduration-minduration;
    int  arcualduration=(arc4random()%rangeduarstion)+minduration;
    //移动精灵(敌机俯冲)
    //CCMoveTo* move=[CCMoveTo actionWithDuration:arcualduration position:ccp(-monster.contentSize.height/2, actualy)];
    int  ranran = (arc4random()%400)-200;
    NSLog(@"%d", ranran);
    id moveBy = [CCMoveBy actionWithDuration:arcualduration
                 
                                    position:ccp(ranran,-monster.position.y-monster.contentSize.height)];
    
    [monster runAction:moveBy];    //调用函数
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
    CCCallBlockN* movedone1=[CCCallBlockN  actionWithBlock:^(CCNode  *node){[monstres removeObject:monster1];}];
    
    [monster1  runAction:[CCSequence  actions:move,movedone1, nil]];
    
    
    

}

// on "init" you need to initialize your instance

-(id) init
{
	if( (self=[super init])) {
        [CCMenuItemFont  setFontName:@"Marker Felt"];
        [CCMenuItemFont  setFontSize:20];
     CGSize screenSize = [[CCDirector sharedDirector] winSize];
        CCSprite* bj=[CCSprite  spriteWithFile:@"momo.jpg"];
        bj.position=ccp(screenSize.width*0.5, screenSize.height*0.5);
        
        CCSprite *bj2=[CCSprite spriteWithFile:@"vvbn.jpg"];
        bj2.position=ccp(bj.position.x, bj.position.y - (bj.contentSize.height + bj2.contentSize.height) / 2);
        [bj.texture setAliasTexParameters];
        [bj2.texture  setAliasTexParameters];
        [self schedule:@selector(move)interval:0.05];
        [self  addChild:bj  z:0 tag:11];
        [self addChild:bj2 z:0 tag:22];
        [[SimpleAudioEngine  sharedEngine]playBackgroundMusic:@"nabc.mp3"];
        //触摸事件
        monstres=[[NSMutableArray  alloc]init];
        smokes=[[NSMutableArray  alloc]init];
        monstres1=[[NSMutableArray  alloc]init];
        smokes1=[[NSMutableArray  alloc]init];
        [self setIsTouchEnabled:YES];
		
        _f=[CCSprite  spriteWithFile:@"jijjij.png"];
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
        _timer=[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(shoot) userInfo:nil repeats:YES];
        _timer2=[NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(shoot2) userInfo:nil repeats:YES];
    }
	return self;
}
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

//飞机移动（滑动）
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch* touch = [touches anyObject];
    CGPoint location = [self convertTouchToNodeSpace: touch];
    if (_f) {
        _f.position=ccp(location.x, location.y);
    }

}

- (void)shoot2 {
    CCSprite  *smoke1=[CCSprite  spriteWithFile:@"dandan.png"];
    smoke1.position=ccp(300, 500);
    //子弹位置
    if (_f) {
        smoke1.position=ccp(_f.position.x - 30,_f.position.y);
    }
    ccColor3B smokeo1 = ccc3(255,120,035);
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
    smoke2.position=ccp(600, 1000);
    //子弹位置
    if (_f) {
        smoke2.position=ccp(_f.position.x + 30,_f.position.y);
    }
    ccColor3B smokeo2 = ccc3(255,0,100);
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
                
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"fh"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                [[NSUserDefaults standardUserDefaults] setObject:@"yiban" forKey:@"fh"];
                
                
                
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
                [self performSelector:@selector(destroyFly) withObject:nil
                           afterDelay:0.2];
            }
        }
    }

}

-(void)gameLogic:(ccTime)t{
    [self  addMonster];
    
}
- (void)destroyFly {
    CCParticleExplosion *mao = [CCParticleExplosion particleWithFile:@"Phoenix.plist"];
    mao.positionType=kCCPositionTypeFree;
    //    kCCPositionTypeFree
    //    kCCPositionTypeRelative
    //CGPoint point = CGPointMake(_f.position.x, _f.position.y);
    //    CGPoint point = CGPointMake(191.150436401367, 217.411758422852);
    //    mao.sourcePosition = point;
    mao.position=ccp(_f.position.x, _f.position.y);
    [self addChild:mao];
    
    [self removeChild:_f cleanup:YES];
    _f = nil;
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"fh"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults standardUserDefaults] setObject:@"yiban" forKey:@"fh"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self performSelector:@selector(jump:) withObject:mao afterDelay:1];
}
- (void)jump:(CCParticleExplosion *)mao {
    [self  removeChild:mao cleanup:YES];
    
    [self performSelector:@selector(redirector) withObject:nil afterDelay:1];
}

- (void)redirector {
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
