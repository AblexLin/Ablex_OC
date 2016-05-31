//
//  Class_four_TableViewCell.m
//  2016.05.22~2016.05.27
//
//  Created by 顾明轩 on 16/5/27.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "Class_four_TableViewCell.h"

@implementation Class_four_TableViewCell
@synthesize btn;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        btn=[UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:@"按钮" forState:UIControlStateNormal];
        [btn setFrame:CGRectMake(250, 0, 50, 30)];
        btn.backgroundColor=[UIColor greenColor];
        [btn addTarget:self action:@selector(pushTap:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        self.textfield=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
        [self addSubview:self.textfield];
    }
    return self;
}

-(void)pushTap:(UIButton *)sender
{
    NSLog(@"按钮呗按下了");
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
