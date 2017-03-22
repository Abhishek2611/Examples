//
//  ViewController.m
//  ExpandTableviewCell
//
//  Created by IDEABYTES on 3/14/17.
//  Copyright © 2017 Santhosh. All rights reserved.
//

#import "ViewController.h"
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "SecondDummyTableViewCell.h"
#import "ThirdTableViewCell.h"
#import "ThirdDummyTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    Boolean selected;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    self.dataTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    expandStatusArray = [[NSMutableArray alloc] initWithObjects:@"No",@"No",@"No", nil];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"FirstTableViewCell";

    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil){
        NSArray *nibObjects = [[NSBundle mainBundle]loadNibNamed:@"FirstTableViewCell" owner:nil options:nil];
        cell = (FirstTableViewCell*)[nibObjects objectAtIndex:0];
    }
    
    cell.expandButton.tag = indexPath.row;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 0) {
    
        cell.firstLabel.text = @"First";
        cell.secondLabel.text = @"First";
        cell.thirdLabel.text = @"First";
    }
    
    if (indexPath.row == 1) {
        
        if (secondView.tag != 22) {
            secondView.tag = 22;
            secondView.frame = CGRectMake(0, 100, 320, 300);
            [cell.contentView addSubview:secondView];
            
            cell.firstLabel.text = @"Second";
            cell.secondLabel.text = @"second";
            cell.thirdLabel.text = @"second";

        }
    }
    
    if (indexPath.row == 2) {
        
        if (thirdView.tag != 22) {
            thirdView.tag = 22;
            thirdView.frame = CGRectMake(0, 100, 320, 360);
            [cell.contentView addSubview:thirdView];

            cell.firstLabel.text = @"third";
            cell.secondLabel.text = @"third";
            cell.thirdLabel.text = @"third";

        }
    }
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([[expandStatusArray objectAtIndex:indexPath.row] isEqualToString:@"Yes"]) {
        
        if (indexPath.row == 0) {
            return 44+500;
        }
        else if (indexPath.row == 1) {
            
            NSLog(@" %f ",secondView.frame.size.height);
            
            return 44+300+2;
        }
        else {
            return 44+360;
        }
    }
    else
    {
        return 44;
    }
}

-(IBAction)expandButtonTapped:(id)sender
{
    if ([[expandStatusArray objectAtIndex:[sender tag]] isEqualToString:@"No"]) {
        [expandStatusArray replaceObjectAtIndex:[sender tag] withObject:@"Yes"];
    }
    else{
        [expandStatusArray replaceObjectAtIndex:[sender tag] withObject:@"No"];
    }
    
    [self.dataTableView reloadData];
    
//    [self updateTableViewAtIndex:[NSIndexPath indexPathForRow:[sender tag] inSection:0]];
}
@end
