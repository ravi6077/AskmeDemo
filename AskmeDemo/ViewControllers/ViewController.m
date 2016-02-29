//
//  ViewController.m
//  AskmeDemo
//
//  Created by Ravinder on 27/02/16.
//  Copyright © 2016 Ravinder. All rights reserved.
//

#import "ViewController.h"
#import "CampaignCell.h"
#import "HomeDealCell.h"
#import "UIImageView+AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.pageControl setNumberOfPages:5];
    [_pageControl setCurrentPage:0];
    

}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.cv3) {
        int index=scrollView.contentOffset.x/scrollView.frame.size.width;
        NSLog(@"index---%ld",(long)index);
        [_pageControl setCurrentPage:index];

    }
}

//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//    for (UICollectionViewCell *cell in [self.cv3 visibleCells]) {
//        NSIndexPath *indexPath = [self.cv3 indexPathForCell:cell];
//        NSLog(@"%ld",(long)indexPath.row);
//        self.pageControl.currentPage = indexPath.row;
//
//    }
//
//}

#pragma mark CollectionView Delegates

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    if(collectionView == self.cv1)
    {
        return 1;
    }
    else if(collectionView == self.cv2)
    {
        return 20;
    }
    else if(collectionView == self.cv3)
    {
                return 5;
    }
    return 0;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(collectionView == self.cv1)
    {
//        Campaign *campaignItem = (Campaign*)[campaignDataArray objectAtIndex:indexPath.row];
        UINib *campaignNib = [UINib nibWithNibName:@"CampaignCell" bundle:[NSBundle mainBundle]];
        [self.cv1 registerNib:campaignNib forCellWithReuseIdentifier:@"CampaignCell" ];
        CampaignCell *campaignCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CampaignCell" forIndexPath:indexPath];
//        campaignCell.campaignLbl.text=campaignItem.Title;
        
//        NSString*ImgURL = campaignItem.AppImage;
        NSString*ImgURL = @"http://img.askmebazaar.com/data/Spring-coming-soon-778x400.jpg";
        
        NSArray *arr=[ImgURL componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        ImgURL=[arr componentsJoinedByString:@""];
        
        //NSLog(@"ImgURL----%@",ImgURL);
        
        NSString *fileNameToSave=[NSString stringWithFormat:@"%@",@""];//campaignItem.Id];
        
        //Get the docs directory
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = [paths objectAtIndex:0];
        NSString *filePath = [documentsPath stringByAppendingPathComponent:fileNameToSave];
        
        NSData *pngData = [NSData dataWithContentsOfFile:filePath];
        UIImage *image = [UIImage imageWithData:pngData];
        if (image)
        {
            [campaignCell.campaignImageView setImage:image];
        }
        else
        {
            __weak typeof(CampaignCell) *weakCampaignCell = campaignCell;
            NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:ImgURL]];
            [campaignCell.campaignImageView setImageWithURLRequest:request placeholderImage:[UIImage imageNamed:@"placeholder"]
                                                           success:
             ^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
             {
                 [weakCampaignCell.campaignImageView setImage:image];
                 
                 NSData *pngData = UIImagePNGRepresentation(image);
                 //Write the file
                 [pngData writeToFile:filePath atomically:YES];
                 
             }
                                                           failure:
             ^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
             {
                 [weakCampaignCell.campaignImageView setImage:[UIImage imageNamed:@"noimageplaceholder.png"]];
             }];
            
        }
        
        
        return campaignCell;
    }
    else if(collectionView == self.cv2)
    {
        NSLog(@"indexpath.row-=-=-=-=-=-=%ld",(long)indexPath.row);
//        DealsListItem *dealItem = (DealsListItem*)[dealsDataArray objectAtIndex:indexPath.row];
        UINib *dealNib = [UINib nibWithNibName:@"HomeDealCell" bundle:[NSBundle mainBundle]];
        [self.cv2 registerNib:dealNib forCellWithReuseIdentifier:@"HomeDealCell" ];
        HomeDealCell *homeDealCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeDealCell" forIndexPath:indexPath];
        
        
//        NSString*ImgURL = dealItem.dealimage;
        NSString*ImgURL = @"http://media.askmebazaar.com/media/catalog/product/a/n/ankita-30-april-50.jpeg";
        NSArray *arr=[ImgURL componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        ImgURL=[arr componentsJoinedByString:@""];
        
        NSString *fileNameToSave=[NSString stringWithFormat:@"%@",@""];//dealItem.id];
        
        //Get the docs directory
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = [paths objectAtIndex:0];
        //Add the file name
        NSString *filePath = [documentsPath stringByAppendingPathComponent:fileNameToSave];
        
        NSData *pngData = [NSData dataWithContentsOfFile:filePath];
        UIImage *image = [UIImage imageWithData:pngData];
        if (image)
        {
            [homeDealCell.dealImageView setImage:image];
        }
        else
        {
//            if (!dealItem.imageDownloaded)
//            {
//                dealItem.imageDownloaded=YES;
                __weak typeof(HomeDealCell) *weakHomeDealCell = homeDealCell;
                NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:ImgURL]];
                [homeDealCell.dealImageView setImageWithURLRequest:request placeholderImage:[UIImage imageNamed:@"placeholder"]
                                                           success:
                 ^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
                 {
                     NSArray *visibleIndexPaths = [collectionView indexPathsForVisibleItems];
                     if ([visibleIndexPaths containsObject:indexPath])
                     {
                         dispatch_async(dispatch_get_main_queue(), ^{
                             [weakHomeDealCell.dealImageView setImage:image];
                         });
                         
                     }
                     
                     
                     NSData *pngData = UIImagePNGRepresentation(image);
                     //Write the file
                     [pngData writeToFile:filePath atomically:YES];
                     
                 }
                                                           failure:
                 ^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
                 {
                     [weakHomeDealCell.dealImageView setImage:[UIImage imageNamed:@"noimageplaceholder.png"]];
                 }];
//            }
//            else
//            {
//                [homeDealCell.dealImageView setImage:[UIImage imageNamed:@"placeholder"]];
//            }
            
            
        }
        
        
        
               
        return  homeDealCell;
        
    }
    else if(collectionView == self.cv3)
    {
        //        Campaign *campaignItem = (Campaign*)[campaignDataArray objectAtIndex:indexPath.row];
        UINib *campaignNib = [UINib nibWithNibName:@"CampaignCell" bundle:[NSBundle mainBundle]];
        [self.cv3 registerNib:campaignNib forCellWithReuseIdentifier:@"CampaignCell" ];
        CampaignCell *campaignCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CampaignCell" forIndexPath:indexPath];
//        self.pageControl.currentPage = indexPath.row;
        //        campaignCell.campaignLbl.text=campaignItem.Title;
        
        //        NSString*ImgURL = campaignItem.AppImage;
//        NSString*ImgURL = @"http://img.askmebazaar.com/data/Spring-coming-soon-778x400.jpg";
        NSString*ImgURL = @"http://media.askmebazaar.com/media/catalog/product/thumbnails/150x150/6/c/6curtain.jpeg";
        
        
        NSArray *arr=[ImgURL componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        ImgURL=[arr componentsJoinedByString:@""];
        
        //NSLog(@"ImgURL----%@",ImgURL);
        
        NSString *fileNameToSave=[NSString stringWithFormat:@"%@",@""];//campaignItem.Id];
        
        //Get the docs directory
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = [paths objectAtIndex:0];
        NSString *filePath = [documentsPath stringByAppendingPathComponent:fileNameToSave];
        
        NSData *pngData = [NSData dataWithContentsOfFile:filePath];
        UIImage *image = [UIImage imageWithData:pngData];
        if (image)
        {
            [campaignCell.campaignImageView setImage:image];
        }
        else
        {
            __weak typeof(CampaignCell) *weakCampaignCell = campaignCell;
            NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:ImgURL]];
            [campaignCell.campaignImageView setImageWithURLRequest:request placeholderImage:[UIImage imageNamed:@"placeholder"]
                                                           success:
             ^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
             {
                 [weakCampaignCell.campaignImageView setImage:image];
                 
                 NSData *pngData = UIImagePNGRepresentation(image);
                 //Write the file
                 [pngData writeToFile:filePath atomically:YES];
                 
             }
                                                           failure:
             ^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
             {
                 [weakCampaignCell.campaignImageView setImage:[UIImage imageNamed:@"noimageplaceholder.png"]];
             }];
            
        }
        
        
        return campaignCell;
    }
    
    
      return  [[UICollectionViewCell alloc]init];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * title = @"";
    NSString *         message = [NSString stringWithFormat:@"Item %ld clicked",indexPath.row+1];
    
    if (collectionView == self.cv1)
    {
        title = @"Template 1";
    }
    else  if (collectionView == self.cv2)
    {
        title = @"Template 2";
    }
    else  if (collectionView == self.cv3)
    {
        title = @"Template 3";
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // handle specific action on button click
        }];
        [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];

}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    int screenH=[UIScreen mainScreen].bounds.size.height;
    //        switch (screenH)
    //        {
    //            case 480:
    //                _campaignBgViewHeightConstraint.constant=190;
    //                break;
    //
    //            case 568:
    //                _campaignBgViewHeightConstraint.constant=220;
    //                break;
    //
    //            case 667:
    //                _campaignBgViewHeightConstraint.constant=250;
    //                break;
    //
    //            case 736:
    //                _campaignBgViewHeightConstraint.constant=280;
    //                break;
    //            default:
    //                _campaignBgViewHeightConstraint.constant=280;
    //                break;
    //        }

    if(collectionView == self.cv1)
        return CGSizeMake(self.view.frame.size.width, 200);
    else if(collectionView == self.cv2)
        return CGSizeMake(160, 250);
    else if(collectionView == self.cv3)
        return CGSizeMake(self.view.frame.size.width, 200);
    
    else
        return CGSizeMake(0, 0);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
