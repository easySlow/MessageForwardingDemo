//
//  NSString+MyAddtion.m
//  MessageForwardingDemo
//
//  Created by Darwin on 2017/9/18.
//  Copyright © 2017年 Darwin. All rights reserved.
//

#import "NSString+MyAddtion.h"

@implementation NSString (MyAddtion)
-(NSString*)myLowcaseString {
    NSString* result = [self myLowcaseString];
    NSLog(@"now lowcaseString is %@",result);
    return result;
}
@end
