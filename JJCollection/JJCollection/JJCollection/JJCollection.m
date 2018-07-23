//
//  JJCollection.m
//  JJCollection
//
//  Created by 16 on 2018/7/23.
//  Copyright © 2018年 冀佳伟. All rights reserved.
//

#import "JJCollection.h"
#import "JJCollectionFlowLayout.h"

@interface JJCollection ()<UICollectionViewDelegate,UICollectionViewDataSource>

///代理
@property (nonatomic , weak) id<JJCollectionDelegate>jj_delegate;
@end
@implementation JJCollection

- (instancetype)initWithFrame:(CGRect)frame jj_delegate:(id<JJCollectionDelegate>)jj_delegate cellSize:(CGSize)cellSize rowNum:(NSInteger)rowNum scrollDirection:(UICollectionViewScrollDirection)scrollDirection
{
    // 设置collectionFlow信息
    JJCollectionFlowLayout *layout = [[JJCollectionFlowLayout alloc] init];
    layout.scrollDirection = scrollDirection;
    layout.width = cellSize.width?cellSize.width:0;
    layout.height = cellSize.height?cellSize.height:0;
    layout.rowNum = rowNum;
    return [self initWithFrame:frame collectionViewLayout:layout jj_delegate:jj_delegate];
}
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout jj_delegate:(id<JJCollectionDelegate>)jj_delegate
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.jj_delegate = jj_delegate;
        self.showsHorizontalScrollIndicator = false;
        self.backgroundColor = [UIColor clearColor];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return (NSInteger)_items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    return  [self.jj_delegate JJCollection:self cellForItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.jj_delegate respondsToSelector:@selector(JJCollectionDidSelectIndexPath:)]) {
        [self.jj_delegate JJCollectionDidSelectIndexPath:indexPath];
    }
}
- (void)setUpItems:(NSArray *)items
{
    self.items = items;
    self.contentOffset = CGPointMake(0, 0);
    [self reloadData];
}
- (void)setItems:(NSArray *)items
{
    _items = items;
    [self reloadData];
}
@end
