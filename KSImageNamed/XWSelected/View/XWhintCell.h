//
//  XWhintCell.h
//  KSImageNamed
//
//  Created by boyXiong on 15/9/22.
//
//

#import <Cocoa/Cocoa.h>

@class XWModel;


@protocol xwHintCellDelegate <NSObject>

- (void)xwHintCellRemoveHintModel:(XWModel *)model;

@end

@interface XWhintCell : NSTableCellView

@property (nonatomic, strong) XWModel * model;

@property (nonatomic, assign) id<xwHintCellDelegate> delegate;



@end
