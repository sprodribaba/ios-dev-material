//
//  Fetcher.h
//  Toodoos
//
//  Created by Sasa Prodribaba on 13/12/2018.
//  Copyright © 2018 Sasa Prodribaba. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^fetchCompletion)(NSData *result);
typedef void (^resultCompletion)(NSArray *result);

@interface Fetcher : NSObject

- (NSArray *)fetchWithResult:(resultCompletion)comp;

@end

NS_ASSUME_NONNULL_END
