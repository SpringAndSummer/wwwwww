//
//  MOKOViewController.h
//  wwwwww
//
//  Created by moko on 15/11/30.
//  Copyright © 2015年 moko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MOKOViewController : UIViewController

typedef NS_ENUM(NSInteger, MOKOViewControllerType) {
    MOKOViewControllerShow,
    MOKOViewControllerHidden,
    
};

@property(nonatomic,assign)MOKOViewControllerType type;

@end
