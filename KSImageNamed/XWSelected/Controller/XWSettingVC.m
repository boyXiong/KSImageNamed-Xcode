//
//  XWSettingVC.m
//  KSImageNamed
//
//  Created by key on 15/9/23.
//
//

#import "XWSettingVC.h"
#import "XWModel.h"
#import "XWhintCell.h"

@interface XWSettingVC () <NSTableViewDataSource, NSTableViewDelegate, xwHintCellDelegate>

@property (assign) IBOutlet NSTextField *hintTextField;

@property (assign) IBOutlet NSTableView *tableView;


@end

@implementation XWSettingVC

- (void)windowDidLoad {
    
    [super windowDidLoad];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

#pragma mark - override setter
- (void)setHintModels:(NSMutableArray *)hintModels{
    _hintModels = hintModels;
    
    [self.tableView reloadData];
}

#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    
    return self.hintModels.count;
    
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    XWhintCell *result = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
//    result.delegate = self;
    
    result.model = self.hintModels[row];
    
    return result;
}


- (void)tableView:(NSTableView *)aTableView setObjectValue:(id)anObject forTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex{

}


- (IBAction)addBtnClicked:(NSButton *)sender {
    
    [self close];
}


#pragma mark -  xwHintCellDelegate
- (void)xwHintCellRemoveHintModel:(XWModel *)model{
    
    [self.hintModels removeObject:model];
    
    [self.tableView reloadData];
    
}

@end
