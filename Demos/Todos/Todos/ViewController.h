//
//  ViewController.h
//  Toodoos
//
//  Created by Sasa Prodribaba on 13/12/2018.
//  Copyright © 2018 Sasa Prodribaba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewDataSource.h"

@interface ViewController : UIViewController <DataSourceDelegate>

@property TableViewDataSource *dataSource;

@end

