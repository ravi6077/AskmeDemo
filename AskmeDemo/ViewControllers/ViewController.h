//
//  ViewController.h
//  AskmeDemo
//
//  Created by Ravinder on 27/02/16.
//  Copyright © 2016 Ravinder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *outerView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *innerView;


@property (weak, nonatomic) IBOutlet UICollectionView *cv1;

@property (weak, nonatomic) IBOutlet UICollectionView *cv2;

@property (weak, nonatomic) IBOutlet UICollectionView *cv3;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


@end

