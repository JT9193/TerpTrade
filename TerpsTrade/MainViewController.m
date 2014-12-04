//
//  MainViewController.m
//  TerpsTrade
//
//  Created by Jonathan Tseng on 10/28/14.
//  Copyright (c) 2014 JonkGames. All rights reserved.
//

#import "MainViewController.h"
#import "SearchResultsTableViewCell.h"
#import "BookDetailsViewController.h"

@interface MainViewController()

@property (strong, nonatomic) NSArray *bookTitles;
@property (strong, nonatomic) NSArray *authors;
@property (strong, nonatomic) NSArray *prices;
@property (strong, nonatomic) NSArray *distances;
@property (strong, nonatomic) NSArray *images;

@end

@implementation MainViewController

@synthesize bookTitles = _bookTitles;
@synthesize authors = _authors;
@synthesize prices = _prices;
@synthesize distances = _distances;
@synthesize images = _images;


- (NSArray *)bookTitles
{
  if (!_bookTitles) {
    _bookTitles = @[@"Calculus: An Intuitive and Physical Approach", @"Calculus For Dummies", @"The Calculus Lifesaver", @"Calculus", @"Calculus, 7th Edition"];
  }
  return _bookTitles;
}

- (NSArray *)authors
{
  if (!_authors) {
    _authors = @[@"Morris Kline", @"Mark Ryan", @"Adrian Bonner", @"Ron Larson and Bruce H. Edwards", @"James Stewart"];
  }
  return _authors;
}

- (NSArray *)prices
{
  if (!_prices) {
    _prices = @[@"$55", @"$20", @"$100", @"$233.33", @"$266.65"];
  }
  return _prices;
}

- (NSArray *)distances
{
  if (!_distances) {
    _distances = @[@"0.3 mi", @"0.6 mi", @"0.9 mi", @"1.1 mi", @"1.2 mi"];
  }
  return _distances;
}



- (void)viewDidLoad {
  [super viewDidLoad];
  self.navigationController.navigationBarHidden = YES;
  [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
  self.searchField.enabled = TRUE;
  [self.createListingButton setHidden:FALSE];
  [self.tableView setHidden:TRUE];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
  self.navigationController.navigationBarHidden = YES;

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
- (IBAction)searchButton:(UIButton *)sender {
  [self.createListingButton setHidden:TRUE];
  [self.tableView setHidden:FALSE];
}

#pragma mark - UITableView Delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.bookTitles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  SearchResultsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell"];
  
  if (!cell) {
    [tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"BookCell" ];
    cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell"];
  }
  
  cell.titleLabel.text = [self.bookTitles objectAtIndex:indexPath.row];
  cell.priceLabel.text = [self.prices objectAtIndex:indexPath.row];
  cell.distanceAwayLabel.text = [self.distances objectAtIndex:indexPath.row];
  cell.authorLabel.text = [self.authors objectAtIndex:indexPath.row];
  
  return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - TextField Delegates
// This method is called once we click inside the textField
-(void)textFieldDidBeginEditing:(UITextField *)textField{
  NSLog(@"Text field did begin editing");
}

// This method is called once we complete editing
-(void)textFieldDidEndEditing:(UITextField *)textField{
  NSLog(@"Text: %@", textField.text);
  NSLog(@"Text field ended editing");
}

// This method enables or disables the processing of return key
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
  [textField resignFirstResponder];
  return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if([[segue identifier] isEqualToString:@"ShowDetails"]) {
    BookDetailsViewController *bookDetailsViewController = segue.destinationViewController;
    NSLog(@"22");
    bookDetailsViewController.title = self.title;
    bookDetailsViewController.author = self.author;
    bookDetailsViewController.price = self.price;
    
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    
    self.title = [self.bookTitles objectAtIndex:indexPath.row];
    self.author = [self.authors objectAtIndex:indexPath.row];
    self.price = [self.prices objectAtIndex:indexPath.row];
    
  }

}


@end
