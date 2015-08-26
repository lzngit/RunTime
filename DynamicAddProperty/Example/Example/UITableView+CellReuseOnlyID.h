//
//  UITableView+CellReuseOnlyID.h
//  lbl
//
//  Created by lzn on 15/8/26.
//  Copyright (c) 2015年 NowFuture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CellReuseOnlyID)
/**
 *  获取 cell 重用 唯一 ID,内部用 runtime 编程存储和获取
 *  内部编码:实现了用 runtime 在类别中可以动态添加属性的效果
 */
@property(nonatomic,strong,readonly) NSString *cellReuseOnlyID;
@end
