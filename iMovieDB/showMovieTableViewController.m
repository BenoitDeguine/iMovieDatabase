//
//  showMovieTableViewController.m
//  iMovieDB
//
//  Created by DEGUINE Benoît on 13/04/2016.
//  Copyright (c) 2016 DEGUINE Benoît. All rights reserved.
//

#import "showMovieTableViewController.h"
#import "Movie.h"
#import "DataManager.h"
#import <YapDatabase/YapDatabase.h>

@interface showMovieTableViewController ()


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleText;
@property (weak, nonatomic) IBOutlet UILabel *releaseLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseText;
@property (weak, nonatomic) IBOutlet UILabel *resumeText;

@property (weak, nonatomic) IBOutlet UIButton *btnRemove;


@end

@implementation showMovieTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 600;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    // Bouton remove
    _btnRemove.layer.cornerRadius = 5;
    [self.btnRemove setTitle: [NSString stringWithFormat:NSLocalizedString(@"remove_movie", nil)] forState:UIControlStateNormal];

    
    // Labels
    self.titleLabel.text = [NSString stringWithFormat:NSLocalizedString(@"title", nil)];
    self.titleText.text = self.myMovie.title;
    self.releaseLabel.text = [NSString stringWithFormat:NSLocalizedString(@"release_date", nil)];
    self.releaseText.text = self.myMovie.releaseDate;
    
    self.resumeText.text = self.myMovie.overview;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section == 0) {
         return 2;
    }  else {
         return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
         return [NSString stringWithFormat:NSLocalizedString(@"infos_movie", nil)];
    } else  {
          return [NSString stringWithFormat:NSLocalizedString(@"resume_movie", nil)];
    }
}

- (IBAction)removeMovie:(id)sender {
    UIAlertController * view = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:NSLocalizedString(@"add_new_movie_title", nil)] message:[NSString stringWithFormat:NSLocalizedString(@"remove_movie_title", nil), _myMovie.title] preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* yes = [UIAlertAction actionWithTitle:[NSString stringWithFormat:NSLocalizedString(@"yes", nil)] style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        
        // YAP DATABASE
        [[[DataManager alloc] init] removeMovie:_myMovie];
        
        [self.navigationController popViewControllerAnimated:YES];
        
        [view dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction* no = [UIAlertAction  actionWithTitle:[NSString stringWithFormat:NSLocalizedString(@"no", nil)] style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [view dismissViewControllerAnimated:YES completion:nil];
    }];
    
    
    [view addAction:yes];
    [view addAction:no];
    [self presentViewController:view animated:YES completion:nil];

}




@end
