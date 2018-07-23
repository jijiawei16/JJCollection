//
//  ViewController.m
//  JJCollection
//
//  Created by 16 on 2018/7/23.
//  Copyright © 2018年 冀佳伟. All rights reserved.
//

#import "ViewController.h"
#import "JJCollection.h"
#import "test.h"

@interface ViewController ()<JJCollectionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JJCollection *collection = [[JJCollection alloc] initWithFrame:CGRectMake(0, 50, 300, 100) jj_delegate:self cellSize:CGSizeMake(100, 100) rowNum:11 scrollDirection:UICollectionViewScrollDirectionHorizontal];
    [collection registerClass:[test class] forCellWithReuseIdentifier:@"cell"];
    [collection setUpItems:@[@"",@"",@"",@"",@"",@"",@"",@"",@"",@""]];
    [self.view addSubview:collection];
}

#pragma mark JJCollocation代理方法必须实现
- (UICollectionViewCell *)JJCollection:(JJCollection *)collection cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    test *cell = [collection dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:indexPath.row*0.1 green:indexPath.row*0.1 blue:indexPath.row*0.1 alpha:1];
    return cell;
}
- (void)JJCollectionDidSelectIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}
@end
