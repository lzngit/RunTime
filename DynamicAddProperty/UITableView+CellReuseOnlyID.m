//
//  UITableView+CellReuseOnlyID.m
//  lbl
//
//  Created by lzn on 15/8/26.
//  Copyright (c) 2015年 NowFuture. All rights reserved.
//

#import "UITableView+CellReuseOnlyID.h"
#import <objc/runtime.h>

@interface UITableView ()
@property(nonatomic,strong) NSString *innerCellReuseOnlyID;

@end
@implementation UITableView (CellReuseOnlyID)

#pragma mark - Inner

static char cellOnlyReuseIDKey;

- (void)setInnerCellReuseOnlyID:(NSString *)innerCellReuseOnlyID
{
    //存储值
    objc_setAssociatedObject(self, &cellOnlyReuseIDKey, innerCellReuseOnlyID, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)innerCellReuseOnlyID
{
    //获取值
    return objc_getAssociatedObject(self, &cellOnlyReuseIDKey);
}

#pragma mark - Outer

- (NSString *)cellReuseOnlyID
{
    if (!self.innerCellReuseOnlyID) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd_HH:mm:ss"];
        self.innerCellReuseOnlyID = [formatter stringFromDate:[NSDate date]];
    }
    return self.innerCellReuseOnlyID;
}
@end
