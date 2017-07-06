//
//  ViewController.m
//  BWTree
//
//  Created by Bowen on 16/9/13.
//  Copyright © 2016年 Bowen. All rights reserved.
//

#import "ViewController.h"
#import "BWTreeView.h"
#import "BWTreeNode.h"

@interface ViewController ()
{
    NSMutableArray *_nodesArray;
}

@property (nonatomic, strong) BWTreeView *treeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _nodesArray = @[].mutableCopy;
    
    [self loadData];
    [self buildTree];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadData {
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSDictionary *dataDic = [NSDictionary dictionaryWithContentsOfFile:dataPath];
    NSLog(@"%@",dataDic);
    NSArray *dataArray = [dataDic objectForKey:@"nodes"];
    for (NSDictionary *nodeDic in dataArray) {
        BWTreeNode *node = [[BWTreeNode alloc] init];
        node = [BWTreeNode dataWithTreeNode:node children:nodeDic depth:0];
        node.parent = nil;
        [_nodesArray addObject:node];
    }
}

- (void)buildTree {
    _treeView = [[BWTreeView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:_treeView];
    _treeView.dataArray = _nodesArray;
    
    
}
@end
