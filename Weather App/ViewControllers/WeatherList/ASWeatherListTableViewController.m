//
//  ASWeatherListTableViewController.m
//  Weather App
//
//  Created by Tomás Figueroa on 4/11/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import "ASWeatherListTableViewController.h"
#import "ASWeatherDetailViewController.h"

#import "ASWeather.h"
#import "ASWeatherAPIClient.h"

@interface ASWeatherListTableViewController () <NSFetchedResultsControllerDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) NSFetchedResultsController *data;

@end

@implementation ASWeatherListTableViewController

- (NSFetchedResultsController *)data
{
    if (!_data) {
        _data = [ASWeather allWeatherWithDelegate:self];
    }
    return _data;
}

#pragma mark - ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                      target:self
                                                      action:@selector(showAlertView)];
    // set up fetchedResults
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AlertView

- (void)showAlertView
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"ZIP Code"
                                                        message:@"Add a ZIP code"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Add", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertView show];
}

#pragma mark - UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSString *zip = [alertView textFieldAtIndex:0].text;
        NSLog(@"Zip code: %@", zip);
        if (!zip.length) {
            return;
        }
        [[ASWeatherAPIClient sharedInstance] addZIPCode:zip
                                             completion:^{
                                                 [self.data performFetch:nil];
                                             }];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.data sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.data.sections objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    // Configure the cell...
    ASWeather *weather = [self.data objectAtIndexPath:indexPath];
    cell.textLabel.text = weather.zip;

    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
     forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        ASWeather *weather = [self.data objectAtIndexPath:indexPath];
        [weather deleteObject];
        //        [tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.allowsSelection = NO;
    ASWeather *weather = [self.data objectAtIndexPath:indexPath];
    NSString *zipCode = weather.zip;
    __weak typeof(self) weakSelf = self;

    [[ASWeatherAPIClient sharedInstance] weatherForZIPCode:zipCode
        success:^(NSString *weatherID) {
            [weakSelf showWeather:weatherID];
            tableView.allowsSelection = YES;
        }
        error:^(NSError *error) {
            NSLog(@"Error: %@", error);
            tableView.allowsSelection = YES;
        }];
}

#pragma mark - NSFetchedResultsController

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller
    didChangeObject:(id)anObject
        atIndexPath:(NSIndexPath *)indexPath
      forChangeType:(NSFetchedResultsChangeType)type
       newIndexPath:(NSIndexPath *)newIndexPath
{
    switch (type) {
    case NSFetchedResultsChangeInsert: {
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
        break;
    }
    case NSFetchedResultsChangeDelete: {
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
        break;
    }
    case NSFetchedResultsChangeUpdate: {
        //            [self configureCell:(TSPToDoCell *)[self.tableView cellForRowAtIndexPath:indexPath]
        //            atIndexPath:indexPath];
        break;
    }
    case NSFetchedResultsChangeMove: {
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
        break;
    }
    }
}

#pragma mark - Navigation

- (void)showWeather:(NSString *)weatherID
{
    ASWeather *weather = [ASWeather weatherWithWeatherID:weatherID];
    [self performSegueWithIdentifier:@"showWeatherDetail" sender:weather];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showWeatherDetail"] &&
        [segue.destinationViewController isKindOfClass:[ASWeatherDetailViewController class]]) {
        ASWeatherDetailViewController *dvc = segue.destinationViewController;
        dvc.weather = sender;
    }
}

@end
