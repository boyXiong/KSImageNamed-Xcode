//
//  XWTool.m
//  KSImageNamed
//
//  Created by key on 15/9/23.
//
//

#import "XWTool.h"
#import "XWModel.h"
#import <objc/runtime.h>

static NSString * const savePath = @"/Library/Application Support/Developer/Shared/Xcode/Plug-ins/ksImageNamed.plist";

@implementation XWTool

+ (void)saveData:(NSArray *)data{
    
    @autoreleasepool {
        
        NSString *homeStr = NSHomeDirectory();
        
        NSString *path = [NSString stringWithFormat:@"%@%@", homeStr, savePath];
        
        NSMutableArray *dataM = [NSMutableArray array];
        
        for (XWModel *model in data) {
            
            Class class = [model class];
            unsigned int count;
            Ivar *ivars =  class_copyIvarList(class, &count);
            
            NSMutableDictionary *tempDict = [NSMutableDictionary dictionary];
            
            for (int i = 0; i < count; ++ i) {
                
                Ivar signleIvar =  ivars[i];
                
                const char *name = ivar_getName(signleIvar);
                
                NSString *key = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
                
                //得到这个ivar的类型
                //            const char *typeEncode =  ivar_getTypeEncoding(signleIvar);
                
                id value = [model valueForKey:key];
                
                [tempDict setValue:value forKey:key];
                
            }
            
            free(ivars);
            
            [dataM addObject:tempDict];
            
        }
        
        [dataM writeToFile:path atomically:YES];
    }
    
}

static NSMutableArray *hintsModelM;

+ (NSArray *)data{
    
    NSString *homeStr = NSHomeDirectory();
    
    NSString *path = [NSString stringWithFormat:@"%@%@", homeStr, savePath];
    
    NSArray *temp = [[NSArray arrayWithContentsOfFile:path] autorelease];
    
    if (!temp) {
        return nil;
    }
    
    hintsModelM = [NSMutableArray array];
    
    
    for (NSDictionary *dict in temp) {
        
        __block XWModel *model = [[XWModel alloc] init];
        
        Class c = [model class];
        unsigned int count;
        Ivar *ivars =  class_copyIvarList(c , &count);

        [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            
            for (int i = 0; i < count; ++ i) {
                const char *name = ivar_getName(ivars[i]);
                
                if ([key isEqualToString:[NSString stringWithCString:name encoding:NSUTF8StringEncoding]]) {
                    [model setValue:obj forKeyPath:key];
                }
            }
        }];
        
        free(ivars);
        
        [hintsModelM addObject:model];
    }
    
    return hintsModelM;
}

@end
