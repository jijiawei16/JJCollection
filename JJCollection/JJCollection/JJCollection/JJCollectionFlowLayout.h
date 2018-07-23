//
//  JJCollectionFlowLayout.h
//  JJCollection
//
//  Created by 16 on 2018/7/23.
//  Copyright © 2018年 冀佳伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJCollectionFlowLayout : UICollectionViewFlowLayout

///每行最大数
@property (nonatomic , assign) NSInteger rowNum;
///子视图宽
@property (nonatomic , assign) CGFloat width;
///子视图高
@property (nonatomic , assign) CGFloat height;
@end
