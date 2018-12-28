//
//  TableViewDataSource.h
//  Toodoos
//
//  Created by Sasa Prodribaba on 13/12/2018.
//  Copyright © 2018 Sasa Prodribaba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DataSourceDelegate
- (void)didReceiveData;
@end

@interface TableViewDataSource : NSObject <UITableViewDataSource>

@property (weak, nonatomic) id dataSourceDelegate;

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
