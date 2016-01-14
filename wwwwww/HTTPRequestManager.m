//
//  HTTPRequestManager.m
//  wwwwww
//
//  Created by moko on 16/1/13.
//  Copyright © 2016年 moko. All rights reserved.
//

#import "HTTPRequestManager.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperation.h"

static HTTPRequestManager *manager;

@implementation HTTPRequestManager

+(id)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HTTPRequestManager alloc] init];
    });
    return manager;
}

-(void)sendGetRequestWith:(NSString *)path requestSuccsion:(RequestSuccsionBlock)successBlock requestFail:(RequestFailBlock)failBlock
{
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    urlRequest.HTTPMethod = @"GET";
    urlRequest.timeoutInterval = 10;
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
//    op.requestSerializer = [AFHTTPRequestSerializer serializer];
//    op.responseSerializer = [AFHTTPResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            NSString * str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            str = [str stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
            str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            str = [str stringByReplacingOccurrencesOfString:@"\t" withString:@""];
            
            NSData * data = [str dataUsingEncoding:NSUTF8StringEncoding];
            id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
           
            successBlock(operation,json);
            
             NSLog(@"------%@",json);
        }
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failBlock(operation,error);
////
    }];
    [op start];

}


@end
