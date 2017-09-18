//
//  MyOwnClass.m
//  MessageForwardingDemo
//
//  Created by Darwin on 2017/9/18.
//  Copyright © 2017年 Darwin. All rights reserved.
//

#import "MyOwnClass.h"
#import <objc/runtime.h>

@interface MyOwnClass()
@property (nonatomic,strong) NSMutableDictionary* backingStore;
@end
@implementation MyOwnClass
@dynamic string,date,number,opaqueObject;

-(id)init {
    self = [super init];
    if (self) {
        self.backingStore = [[NSMutableDictionary alloc] initWithCapacity:5];
    }
    return self;
}

id autoDictionaryGetter (id self,SEL _cmd) {
    MyOwnClass* myClass = (MyOwnClass*)self;
    NSMutableDictionary* backingStore = myClass.backingStore;
    
    NSString* key = NSStringFromSelector(_cmd);
    return [backingStore objectForKey:key];
}

void autoDictonarySetter (id self,SEL _cmd,id value) {
    MyOwnClass* myClass = (MyOwnClass*)self;
    NSMutableDictionary* backingStore = (NSMutableDictionary*)myClass.backingStore;
    
    NSString* selectorString = NSStringFromSelector(_cmd);
    NSMutableString* key = [selectorString mutableCopy];
    //去掉“:”
    [key deleteCharactersInRange:NSMakeRange(key.length - 1, 1)];
    //去掉set
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    
    NSString* low = [[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:low];

    if (value) {
        [backingStore setValue:value forKey:key];
    }
    else {
        [backingStore removeObjectForKey:key];
    }
}

+(BOOL)resolveInstanceMethod:(SEL)sel {
    NSString* selector = NSStringFromSelector(sel);
    
    if ([selector hasPrefix:@"set"]) {
        class_addMethod(self, sel, (IMP)autoDictonarySetter, "v@:@");
    }
    else {
        class_addMethod(self, sel, (IMP)autoDictionaryGetter, "@@:");
    }
    return YES;
}
@end
