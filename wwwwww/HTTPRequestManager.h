//
//  HTTPRequestManager.h
//  wwwwww
//
//  Created by moko on 16/1/13.
//  Copyright © 2016年 moko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperation;
typedef void(^RequestSuccsionBlock)(AFHTTPRequestOperation *operation, id resultObject);
typedef void(^RequestFailBlock)(AFHTTPRequestOperation *operation, NSError *error);
@interface HTTPRequestManager : NSObject

/**
 *  单例
 *
 *  @return 单例对象
 */
+(id)shareManager;

//网络请求

-(void)sendGetRequestWith:(NSString *)path requestSuccsion:(RequestSuccsionBlock)successBlock requestFail:(RequestFailBlock)failBlock;


@end
