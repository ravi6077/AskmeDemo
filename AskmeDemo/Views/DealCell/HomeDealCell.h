//
//  HomeDealCell.h
//  AskmeDemo
//
//  Created by Ravinder on 27/02/16.
//  Copyright © 2016 Ravinder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeDealCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *grayCutLabel;

@property (strong, nonatomic) IBOutlet UILabel *originalPrice;
@property (strong, nonatomic) IBOutlet UILabel *offeredPrice;
@property (strong, nonatomic) IBOutlet UILabel *dealLabel;
@property (strong, nonatomic) IBOutlet UIImageView *dealImageView;
@property (weak, nonatomic) IBOutlet UIView *priceView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *offeredPriceWidthConstraint;

@end
