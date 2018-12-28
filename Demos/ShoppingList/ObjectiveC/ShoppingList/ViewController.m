//
//  ViewController.m
//  ShoppingList
//
//  Created by Sasa Prodribaba on 16/12/2018.
//  Copyright © 2018 Sasa Prodribaba. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *itemNameTextField;
@property (weak, nonatomic) IBOutlet UITableView *itemsTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize an empty array
    self.items = [NSMutableArray array];
}

// Method called when user taps on Add button (Action connected to button via outlet)
- (IBAction)addButtonTouchUpInside:(UIButton *)sender {
    if (self.itemNameTextField.hasText) {
        [self.items addObject:self.itemNameTextField.text];
        self.itemNameTextField.text = @"";
        [self.itemsTableView reloadData];
    }
    
}

#pragma mark - UITableViewDataSource Methods

// Returns a cell object on which we set the text property (ReuseIdentifier is set in storyboard)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell" forIndexPath:indexPath];
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

@end
