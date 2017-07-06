//
//  BWTreeNode.m
//  BWTree
//
//  Created by Bowen on 16/9/13.
//  Copyright © 2016年 Bowen. All rights reserved.
//

#import "BWTreeNode.h"

@interface BWTreeNode ()
{
    BOOL _expanded;
}
@property (nonatomic) BOOL expanded;

@end

@implementation BWTreeNode

- (BWTreeNode *)makeTreeNode:(BWTreeNode *)node children:(NSDictionary *)children depth:(NSUInteger)depth {
    node.depth = depth;
    node.expanded = NO;
    node.nodeId = [NSString stringWithFormat:@"%@", [children objectForKey:@"Id"]];
    node.nodeName = [NSString stringWithFormat:@"%@", [children objectForKey:@"Name"]];
    if (children == nil || [children objectForKey:@"children"] == nil) {
        return node;
    }
    NSArray *childrenArray = [children objectForKey:@"children"];
    if (children.count == 0) {
        return node;
    }
    depth++;
    node.children = @[].mutableCopy;
    
    [childrenArray enumerateObjectsUsingBlock:^(NSDictionary *childrenDic, NSUInteger idx, BOOL *stop) {
        BWTreeNode *tempNode = [[BWTreeNode alloc] init];
        tempNode.parent = node;
        [node addChild:[self makeTreeNode:tempNode children:childrenDic depth:depth]];
    }];
    return node;
}

+ (BWTreeNode *)dataWithTreeNode:(BWTreeNode *)node children:(NSDictionary *)children depth:(NSUInteger)depth {
    return [[self alloc] makeTreeNode:node children:children depth:depth];
}

- (NSInteger)depth {
    return _depth;
}

- (void)addChild:(BWTreeNode *)child {
    NSMutableArray *children = [self.children mutableCopy];
    [children addObject:child];
    self.children = [children copy];
}

- (void)removeChild:(BWTreeNode *)child {
    NSMutableArray *children = [self.children mutableCopy];
    [children removeObject:child];
    self.children = [children copy];
}


- (BOOL)expanded {
    return _expanded;
}

- (void)setExpanded:(BOOL)expanded {
    _expanded = expanded;
}
@end
