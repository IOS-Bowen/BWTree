//
//  BWTreeViewCell.m
//  BWTree
//
//  Created by Bowen on 16/9/13.
//  Copyright © 2016年 Bowen. All rights reserved.
//

#import "BWTreeViewCell.h"
#import "BWTreeNode.h"
#import "UIView+Ext.h"

@interface BWTreeViewCell ()

@end

@implementation BWTreeViewCell

+ (instancetype)treeViewCellWithTableView:(UITableView *)tableView
{
    static NSString *treeCellID = @"treeCellID";
    BWTreeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:treeCellID];
    if (!cell) {
        cell = [[BWTreeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:treeCellID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupCell];
    }
    
    return self;
}

- (void)setupCell
{
    self.arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.arrowBtn.userInteractionEnabled = NO;
    //解决image旋转形变问题
    self.arrowBtn.imageView.contentMode = UIViewContentModeCenter;
    self.arrowBtn.imageView.clipsToBounds = NO;
    [self.arrowBtn setFrame:CGRectMake(0, 0, 30, 30)];
    self.arrowBtn.centerY = self.contentView.centerY;
    
    [self.arrowBtn setImage:[UIImage imageNamed:@"tree_arrow"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.arrowBtn];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, self.contentView.frame.size.width - 35, 44)];
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    self.titleLabel.centerY = self.contentView.centerY;
    [self.contentView addSubview:self.titleLabel];
}

- (void)setTreeNode:(BWTreeNode *)treeNode
{
    _treeNode = treeNode;
    
    NSMutableString *name = [NSMutableString string];
    [name appendString:treeNode.nodeName];
    self.titleLabel.text = name;
    
    if (treeNode.depth == 0) {
        self.arrowBtn.originX = 0;
        self.titleLabel.originX = 30;
    }
    if (treeNode.depth == 1) {
        self.arrowBtn.originX = 18;
        self.titleLabel.originX = 48;
    }
    if (treeNode.depth == 2) {
        self.arrowBtn.originX = 36;
        self.titleLabel.originX = 66;
    }
    if (treeNode.depth == 3) {
        self.arrowBtn.originX = 54;
        self.titleLabel.originX = 84;
    }
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
