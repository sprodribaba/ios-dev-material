//
//  Serializer.h
//  Toodoos
//
//  Created by Sasa Prodribaba on 13/12/2018.
//  Copyright © 2018 Sasa Prodribaba. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Serializer : NSObject

- (NSArray *)serializeJSONObject:(NSData *)jsonObject;

@end

NS_ASSUME_NONNULL_END
