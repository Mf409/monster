//
//  yiban.h
//  游戏菜单
//
//  Created by admin on 15-6-3.
//
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "Guanka.h"
#import "SimpleAudioEngine.h"
@interface yiban : CCLayer
+(CCScene *) scene;
@property (strong, nonatomic) NSMutableArray *monstres;
@property (strong, nonatomic)NSMutableArray  *smokes;
@property  int monstersDestroyed;
@property (strong, nonatomic) NSMutableArray *monstres1;
@property(strong, nonatomic) NSMutableArray  *smokes1;
@property (strong, nonatomic) CCSprite* f;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSTimer *timer2;
@end
