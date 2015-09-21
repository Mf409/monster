//
//  AppDelegate.h
//  游戏菜单
//
//  Created by admin on 15-4-28.
//  Copyright __MyCompanyName__ 2015年. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
