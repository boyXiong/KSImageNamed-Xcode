//
//  XWModel.h
//  KSImageNamed
//
//  Created by boyXiong on 15/9/23.
//
//

#import <Foundation/Foundation.h>

@interface XWModel : NSObject

@property (nonatomic, copy) NSString * classAndMethod;

@property (nonatomic, copy) NSString * methodDeclaration;

@property (nonatomic, copy) NSString * methodName;

@property (nonatomic, copy) NSString * comment;



//classAndMethod	mage imageNamed:
//methodDeclaration	imageNamed:
//methodName	imageNamed
//comment	Standrd NSImage/UImage method


@end
