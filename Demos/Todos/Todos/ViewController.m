//
//  ViewController.m
//  Toodoos
//
//  Created by Sasa Prodribaba on 13/12/2018.
//  Copyright © 2018 Sasa Prodribaba. All rights reserved.
//

#import "ViewController.h"
#import "TableViewDataSource.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *todosTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set external data source for the tableView
    self.dataSource = [[TableViewDataSource alloc] init];
    self.todosTableView.dataSource = self.dataSource;
    
    // Set ViewController to be the delegate of TableViewDataSource class
    self.dataSource.dataSourceDelegate = self;
}

- (void)didReceiveData {
    
    // Reload contents of tableView from main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.todosTableView reloadData];
    });
}

@end
