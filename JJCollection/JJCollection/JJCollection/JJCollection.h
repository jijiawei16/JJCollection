//
//  JJCollection.h
//  JJCollection
//
//  Created by 16 on 2018/7/23.
//  Copyright © 2018年 冀佳伟. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JJCollection;

@protocol JJCollectionDelegate <NSObject>

/**
 *  点击了某一行cell
 *
 *  @param indexPath 当前行数
 */
- (void)JJCollectionDidSelectIndexPath:(NSIndexPath *)indexPath;

/**
 *  设置cell样式
 *
 *  @param collection 当前控件
 *  @param indexPath 当前行数
 *  @return UICollectionViewCell实例
 */
- (UICollectionViewCell *)JJCollection:(JJCollection *)collection cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface JJCollection : UICollectionView

///数据源
@property (nonatomic , strong , readonly) NSArray *items;

/**
 设置数据源
 */
- (void)setUpItems:(NSArray *)items;

/**
 *  初始化JJCollection
 *
 *  @param frame JJCollocation的尺寸
 *  @param jj_delegate 代理
 *  @param cellSize cell尺寸
 *  @param rowNum 每一行最大数
 *  @return JJCollocation实例
 */
- (instancetype)initWithFrame:(CGRect)frame jj_delegate:(id<JJCollectionDelegate>)jj_delegate cellSize:(CGSize)cellSize rowNum:(NSInteger)rowNum scrollDirection:(UICollectionViewScrollDirection)scrollDirection;
@end
