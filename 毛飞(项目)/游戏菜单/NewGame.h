//
//  NewGame.h
//  游戏菜单
//
//  Created by admin on 15-5-5.
//
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Guanka.h"
#import "HelloWorldLayer.h"
#import "setGame.h"
@interface NewGame : CCLayer
@property (nonatomic,strong) NSMutableArray *monstres;
@property(nonatomic,strong) NSMutableArray  *smokes;
@property  int monstersDestroyed;

@end
