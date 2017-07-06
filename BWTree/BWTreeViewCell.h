//
//  BWTreeViewCell.h
//  BWTree
//
//  Created by Bowen on 16/9/13.
//  Copyright © 2016年 Bowen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BWTreeNode;
@interface BWTreeViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *arrowBtn;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) BWTreeNode *treeNode;

+ (instancetype)treeViewCellWithTableView:(UITableView *)tableView;

@end
