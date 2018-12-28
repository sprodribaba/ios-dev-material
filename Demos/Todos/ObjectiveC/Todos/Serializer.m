//
//  Serializer.m
//  Toodoos
//
//  Created by Sasa Prodribaba on 13/12/2018.
//  Copyright © 2018 Sasa Prodribaba. All rights reserved.
//

#import "Serializer.h"
#import "Todo.h"

@implementation Serializer

- (NSArray *)serializeJSONObject:(NSData *)jsonData {
    
    NSError *jsonError;
    NSArray *jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];
    
    NSMutableArray *todos = [NSMutableArray new];
    
    if(!jsonError) {
        for (NSDictionary *dict in jsonObjects) {
            Todo *todo = [[Todo alloc] initWithDictionary:dict];
            [todos addObject:todo];
        }
    }
    
    return todos;
}

@end
