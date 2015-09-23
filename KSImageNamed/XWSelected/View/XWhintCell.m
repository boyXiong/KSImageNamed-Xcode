//
//  XWhintCell.m
//  KSImageNamed
//
//  Created by boyXiong on 15/9/22.
//
//

#import "XWhintCell.h"
#import "XWModel.h"

@interface XWhintCell ()

/** 按钮 */
@property (nonatomic, assign) NSButtonCell * button;


@end

@implementation XWhintCell

- (void)awakeFromNib{
    
    NSButton *button = [[NSButton alloc] initWithFrame:CGRectMake(150, 0, 17, 17)];
    button.title = @"x";
    [button setFont:[NSFont boldSystemFontOfSize:15]];
    button.bordered = NO;
    button.target = self;
    button.action = @selector(removeHint);
    
    [self addSubview:button];

}

- (void)setModel:(XWModel *)model{
    
    _model = model;
    self.textField.stringValue = model.methodName;
}

- (void)removeHint{
    
    if ([self.delegate respondsToSelector:@selector(xwHintCellRemoveHintModel:)]) {
        [self.delegate xwHintCellRemoveHintModel:self.model];
    }
    
}




@end
