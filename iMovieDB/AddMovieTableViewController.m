//
//  AddMovieTableViewController.m
//  iMovieDB
//
//  Created by Benoit Deguine on 12/05/2016.
//  Copyright © 2016 DEGUINE Benoît. All rights reserved.
//

#import "AddMovieTableViewController.h"

@interface AddMovieTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleText;
@property (weak, nonatomic) IBOutlet UILabel *releaseLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseText;
@property (weak, nonatomic) IBOutlet UILabel *resumeText;


@end

@implementation AddMovieTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", self.myMovie);
    
    self.tableView.estimatedRowHeight = 600;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    // Labels
    self.titleLabel.text = [NSString stringWithFormat:NSLocalizedString(@"title", nil)];
    self.titleText.text = self.myMovie.title;
    self.releaseLabel.text = [NSString stringWithFormat:NSLocalizedString(@"release_date", nil)];
    self.releaseText.text = self.myMovie.releaseDate;
    
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }  else {
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

@end
