//
//  TableViewDataSource.m
//  Toodoos
//
//  Created by Sasa Prodribaba on 13/12/2018.
//  Copyright © 2018 Sasa Prodribaba. All rights reserved.
//

#import "TableViewDataSource.h"
#import "Fetcher.h"
#import "Todo.h"

@implementation TableViewDataSource

#define kTodoCellIdentifier @"todoCell"

NSArray *todos;

- (instancetype)init {
    self = [super init];
    if (self) {
        todos = [NSArray new];
        Fetcher *fetcher = [Fetcher new];
        [fetcher fetchWithResult:^(NSArray *result) {
            todos = result;
            [self.dataSourceDelegate didReceiveData];
        }];
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTodoCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = ((Todo *)todos[indexPath.row]).title;
    cell.detailTextLabel.text = [((Todo *)todos[indexPath.row]).completed boolValue]?@"Completed":@"Due";
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [todos count];
}

@end
