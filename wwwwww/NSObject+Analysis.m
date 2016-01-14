//
//  NSObject+Analysis.m
//  wwwwww
//
//  Created by moko on 16/1/13.
//  Copyright © 2016年 moko. All rights reserved.
//

#import "NSObject+Analysis.h"
#import "MJExtension.h"

@implementation NSObject (Analysis)

+(instancetype)modelWithJson:(NSString *)jsonString
{
    NSObject *object = [self objectWithKeyValues:jsonString];
    return object;
}

+(NSArray *)arrayWithJsonData:(NSString *)jsonString
{
    NSArray *array = [self objectArrayWithKeyValuesArray:jsonString];
    return array;
}


@end
