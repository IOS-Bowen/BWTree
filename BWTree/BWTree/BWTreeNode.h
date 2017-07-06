//
//  BWTreeNode.h
//  BWTree
//
//  Created by Bowen on 16/9/13.
//  Copyright © 2016年 Bowen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BWTreeNode : NSObject

@property (nonatomic, readonly) BOOL expanded;
@property (nonatomic, strong) NSString *nodeId;
@property (nonatomic, strong) NSString *nodeName;
@property (nonatomic, strong) NSArray *children;
@property (nonatomic, strong) BWTreeNode *parent;
@property (nonatomic, assign) NSInteger depth;

/**
 *  初始化方法
 *
 *  @param node 节点
 *  @param children 子节点字典
 *  @param depth 深度
 *
 *  @return TreeNode
 */

- (instancetype)makeTreeNode:(BWTreeNode *)node children:(NSDictionary *)children depth:(NSUInteger)depth;
+ (instancetype)dataWithTreeNode:(BWTreeNode *)node children:(NSDictionary *)children depth:(NSUInteger)depth;

- (void)setExpanded:(BOOL)expanded;

- (void)addChild:(BWTreeNode *)child;
- (void)removeChild:(BWTreeNode *)child;

@end
