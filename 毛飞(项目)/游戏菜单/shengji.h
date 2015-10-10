//
//  shengji.h
//  游戏菜单
//
//  Created by 七夜 on 2015/10/9.
//
//

#import "CCLayer.h"
#import"cocos2d.h"
#import "HelloWorldLayer.h"
#import "fuhuo.h"
#import "guoguan.h"
#import "shengjibaoku.h"
@interface shengji : CCLayer
+(CCScene *) scene;
@property(strong, nonatomic)  NSMutableArray *monstres;
@property (strong, nonatomic)NSMutableArray  *smokes;
@property  int monstersDestroyed;
@property (strong, nonatomic) CCSprite* f;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSTimer *timer2;

@end
