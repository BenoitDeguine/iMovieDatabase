//
//  SearchMovieTableViewController.m
//  iMovieDB
//
//  Created by DEGUINE Benoît on 06/04/2016.
//  Copyright (c) 2016 DEGUINE Benoît. All rights reserved.
//

#import "SearchMovieTableViewController.h"
#import "APIManager.h"
#import "SearchMovieTableViewCell.h"
#import "DataManager.h"
#import <YapDatabase/YapDatabase.h>


@interface SearchMovieTableViewController()
@property (weak, nonatomic) IBOutlet UITextField *searchMovieTextField;
@property (strong, nonatomic) NSMutableArray *result;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation SearchMovieTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _searchBar.layer.borderWidth = 0;
    self.searchMovieTextField.placeholder =[NSString stringWithFormat:NSLocalizedString(@"search_movie", nil)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.result.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CustomCell";
    SearchMovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Movie *myMovie = [self.result objectAtIndex: [indexPath row]];
    cell.titleMovie.text = myMovie.title;
    cell.dateSortie.text = myMovie.releaseDate;
    cell.imgMovie.image = [myMovie ConvertStringToUIImage];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     Movie *myMovie = [self.result objectAtIndex: [indexPath row]];
    
//    if (!UIAccessibilityIsReduceTransparencyEnabled()) {
//        self.view.backgroundColor = [UIColor clearColor];
//        
//        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
//        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//        blurEffectView.frame = self.view.bounds;
//        blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//        
//
//        
//        [self.view addSubview:blurEffectView];
//     
//    }
//    else {
//        self.view.backgroundColor = [UIColor blackColor];
//    }
    
    UIAlertController * view = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:NSLocalizedString(@"add_new_movie_title", nil)] message:[NSString stringWithFormat:NSLocalizedString(@"add_new_movie", nil), myMovie.title] preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction* yes = [UIAlertAction actionWithTitle:[NSString stringWithFormat:NSLocalizedString(@"yes", nil)] style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {

        // YAP DATABASE
        [[[DataManager alloc] init] addMovie:myMovie];
  
        [view dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction* no = [UIAlertAction  actionWithTitle:[NSString stringWithFormat:NSLocalizedString(@"no", nil)] style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [view dismissViewControllerAnimated:YES completion:nil];
    }];
    
    
    [view addAction:yes];
    [view addAction:no];
    [self presentViewController:view animated:YES completion:nil];
}

#pragma Close window
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextField
-(void) textFieldShouldReturn:(UITextField *)textField {
     if(textField.returnKeyType==UIReturnKeySearch) {
         APIManager *myAPI = [[APIManager alloc]init];
         [myAPI searchMovie:self.searchMovieTextField.text answer:^(NSMutableArray *response) {
             self.result = response;
             
             [self.tableView reloadData];
         }];
    }
}

@end
