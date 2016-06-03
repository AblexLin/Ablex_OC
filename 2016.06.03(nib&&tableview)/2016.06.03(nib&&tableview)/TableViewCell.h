//
//  TableViewCell.h
//  2016.06.03(nib&&tableview)
//
//  Created by 顾明轩 on 16/6/3.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)switchHH:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UISlider *sliderHH;
@property (weak, nonatomic) IBOutlet UISwitch *switchSX;

@end
