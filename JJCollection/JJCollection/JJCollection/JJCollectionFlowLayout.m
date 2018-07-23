//
//  JJCollectionFlowLayout.m
//  JJCollection
//
//  Created by 16 on 2018/7/23.
//  Copyright © 2018年 冀佳伟. All rights reserved.
//

#import "JJCollectionFlowLayout.h"

@interface JJCollectionFlowLayout ()

///collection数据
@property (nonatomic , strong) NSMutableArray *items;
@end
@implementation JJCollectionFlowLayout

- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)prepareLayout
{
    [super prepareLayout];
    
    // 设置控件水平和竖直间距
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    //把初始化数组
    [self.items removeAllObjects];
    
    //开始创建每一个cell对应的布局属性
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i < count; i++) {
        // 创建位置
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        // 获取indexPath位置cell对应的布局属性
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.items addObject:attrs];
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.items;
}

// 在这个方法里面修改控件的布局(自定义布局)
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    // 在这个地方设置cell的frame，瀑布流也是在这个地方写,注意下面的size要和这里的size一致，要不然会不能滑动
    NSInteger max = self.rowNum?self.rowNum:1;
    CGFloat w = self.width;
    CGFloat h = self.height;
    CGFloat x = (indexPath.row%max)*w;
    CGFloat y = (indexPath.row/max)*h;
    NSLog(@"x=%f,y=%f",x,y);
    attrs.frame = CGRectMake(x, y, w, h);
    return attrs;
}

- (CGSize)itemSize
{
    CGFloat w = self.width;
    CGFloat h = self.height;
    return CGSizeMake(w, h);
}
@end
