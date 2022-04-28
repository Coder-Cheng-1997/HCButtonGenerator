//
//  NSDictionary+HCCategory.m
//  iOSOpenSourceLearning
//
//  Created by CodeRemover on 2022/4/26.
//

#import "NSMutableDictionary+HCCategory.h"
#import <objc/runtime.h>
@implementation NSMutableDictionary (HCCategory)

- (void)addEntriesFromDictionaryIfAbsent:(NSDictionary*)dictionary {
    for (id key in dictionary.allKeys) {
        if (![self.allKeys containsObject:key]) {
            [self addEntriesFromDictionary:@{key:[dictionary valueForKey:key]}];
        }
    }
}
@end
