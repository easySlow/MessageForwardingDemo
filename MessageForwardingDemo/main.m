//
//  main.m
//  MessageForwardingDemo
//
//  Created by Darwin on 2017/9/18.
//  Copyright © 2017年 Darwin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyOwnClass.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        MyOwnClass* myClass = [[MyOwnClass alloc] init];
        myClass.string = @"LFC";
        myClass.date = [NSDate date];
        
        NSLog(@"myClass content string is %@,date is %@",myClass.string,myClass.date);
        
        //Method Swizzing
        Method originMethod = class_getInstanceMethod([NSString class], @selector(lowercaseString));
        Method swappedMethod = class_getInstanceMethod([NSString class], @selector(myLowcaseString));
        method_exchangeImplementations(originMethod, swappedMethod);
        NSString* name = @"DARWIN";
        [name lowercaseString];
    }
    return 0;
}
