//
//  main.m
//  MessageForwardingDemo
//
//  Created by Darwin on 2017/9/18.
//  Copyright © 2017年 Darwin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyOwnClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        MyOwnClass* myClass = [[MyOwnClass alloc] init];
        myClass.string = @"LFC";
        myClass.date = [NSDate date];
        
        NSLog(@"myClass content string is %@,date is %@",myClass.string,myClass.date);
    }
    return 0;
}
