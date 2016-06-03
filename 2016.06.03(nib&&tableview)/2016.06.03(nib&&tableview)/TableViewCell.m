//
//  TableViewCell.m
//  2016.06.03(nib&&tableview)
//
//  Created by 顾明轩 on 16/6/3.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//开关的点击事件实现地点
- (IBAction)switchHH:(UISwitch *)sender {
    self.sliderHH.value=1;
    self.textField.text=@"哈哈";
}
@end
