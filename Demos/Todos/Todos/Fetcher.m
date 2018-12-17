//
//  Fetcher.m
//  Toodoos
//
//  Created by Sasa Prodribaba on 13/12/2018.
//  Copyright © 2018 Sasa Prodribaba. All rights reserved.
//

#import "Fetcher.h"
#import "Serializer.h"

@implementation Fetcher

#define kTodosEndpoint @"https://jsonplaceholder.typicode.com/todos"

- (NSData *)fetchFromURL:(NSURL *)url completion:(fetchCompletion)comp {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (!error) {
            comp(data);
        } else {
            NSLog(@"Error: %@", error.localizedDescription);
        }
                                      
    }];
    [dataTask resume];
    
    return 0;
}

- (NSArray *)fetchWithResult:(resultCompletion)comp {
    
    [self fetchFromURL:[NSURL URLWithString:kTodosEndpoint] completion:^(NSData * result) {
        
        Serializer *serializer = [Serializer new];
        NSArray *decodedObjects = [serializer serializeJSONObject:result];
        comp(decodedObjects);
        
    }];
    
    return 0;
}

@end
