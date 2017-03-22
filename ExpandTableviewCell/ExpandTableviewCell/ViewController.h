//
//  ViewController.h
//  ExpandTableviewCell
//
//  Created by IDEABYTES on 3/14/17.
//  Copyright © 2017 Santhosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSMutableArray *expandStatusArray;
    IBOutlet UIView *secondView;
    
    IBOutlet UIView *thirdView;
    
    

}
@property (weak, nonatomic) IBOutlet UITableView *dataTableView;

@end

