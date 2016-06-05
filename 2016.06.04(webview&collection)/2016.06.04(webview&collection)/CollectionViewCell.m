//
//  CollectionViewCell.m
//  2016.06.04(webview&collection)
//
//  Created by 顾明轩 on 16/6/4.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
@synthesize labell;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor greenColor];
        labell=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
        [self addSubview:labell];
    }
    return self;
}
@end
