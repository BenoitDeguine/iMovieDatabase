//
//  MyMoviesTableViewController.m
//  iMovieDB
//
//  Created by DEGUINE Benoît on 06/04/2016.
//  Copyright (c) 2016 DEGUINE Benoît. All rights reserved.
//

#import "MyMoviesTableViewController.h"
#import "MyMovieTableViewCell.h"
#import "ILMovieDBClient.h"
#import "DataManager.h"
#import "showMovieTableViewController.h"

@interface MyMoviesTableViewController ()

@end

@implementation MyMoviesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:NSLocalizedString(@"my_movies", nil)];
}

- (void)viewDidAppear:(BOOL)animated{
   
  
    [self getMovies];
    [self.tableView reloadData];
      self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

-(void) getMovies {
    self.myMovies = [[[DataManager alloc]init] getMovies];
   [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.myMovies.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"myMovieCustomCell";
    MyMovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Movie *myMovie = [self.myMovies objectAtIndex: [indexPath row]];
    cell.titleMovie.text = myMovie.title;
    cell.dateSortie.text = myMovie.releaseDate;
    cell.imgMovie.image = [myMovie ConvertStringToUIImage];
        
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Movie *myMovie = [self.myMovies objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"showDetails" sender:myMovie];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showDetails"]) {
        showMovieTableViewController *smtvc = segue.destinationViewController;
        smtvc.myMovie = sender;
    }
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation


@end
