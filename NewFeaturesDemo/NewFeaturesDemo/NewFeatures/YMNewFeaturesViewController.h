//
//  YMNewFeaturesViewController.h
//  NewFeaturesDemo
//
//  Created by 彦明 on 16/12/5.
//  Copyright © 2016年 Yanming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMNewFeaturesViewController : UIViewController
/**新特性图片数组*/
@property (nonatomic, copy) NSArray *imagesArray;
@property (nonatomic, copy) void (^passButtonDidClicked)();
@property (nonatomic, copy) void (^startButtonDidClicked)();
- (void)setPassButtonHidden:(BOOL)isHidden;
@end
