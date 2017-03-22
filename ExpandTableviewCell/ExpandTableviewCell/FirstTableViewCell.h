//
//  FirstTableViewCell.h
//  ExpandTableviewCell
//
//  Created by Santhosh on 3/14/17.
//  Copyright © 2017 Santhosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstTableViewCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UIButton *expandButton;
@property (strong, nonatomic) IBOutlet UILabel *firstLabel;
@property (strong, nonatomic) IBOutlet UILabel *secondLabel;
@property (strong, nonatomic) IBOutlet UILabel *thirdLabel;

@end
