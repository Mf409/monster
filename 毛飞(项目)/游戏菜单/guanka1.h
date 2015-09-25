//
//  guanka1.h
//  游戏菜单
//
//  Created by admin on 15-5-20.
//
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Guanka.h"
#import "HelloWorldLayer.h"
#import "setGame.h"
@interface guanka1 : CCLayer
@property(strong, nonatomic)  NSMutableArray *monstres;
@property (strong, nonatomic)NSMutableArray  *smokes;
@property  int monstersDestroyed;
@property (strong, nonatomic) CCSprite* f;
@property (strong, nonatomic) NSTimer *timer;
@end
