//
//  guanka2.h
//  游戏菜单
//
//  Created by admin on 15-5-26.
//
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "Guanka.h"
#import "SimpleAudioEngine.h"
@interface guanka2 : CCLayer
@property (strong, nonatomic) NSMutableArray *monstres;
@property ( strong, nonatomic) NSMutableArray  *smokes;
@property  int monstersDestroyed;
@property (strong, nonatomic) CCSprite* f;
@property (strong, nonatomic) NSTimer *timer;
@end
