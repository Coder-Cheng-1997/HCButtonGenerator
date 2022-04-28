//
//  NSDictionary+HCCategory.h
//  iOSOpenSourceLearning
//
//  Created by CodeRemover on 2022/4/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (HCCategory)
- (void)addEntriesFromDictionaryIfAbsent:(NSDictionary*)dictionary;
@end

NS_ASSUME_NONNULL_END
