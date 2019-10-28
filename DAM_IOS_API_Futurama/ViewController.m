//
//  ViewController.m
//  DAM_IOS_API_Futurama
//
//  Created by Raul Ramirez on 24/10/2019.
//  Copyright © 2019 Raul Ramirez. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:@"https://futuramaapi.herokuapp.com/api/quotes"];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        characters = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }];
    
    [task resume];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return characters.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
    layout:(UICollectionViewLayout *)collectionViewLayout
    sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width = (CGRectGetWidth(_mCollectionView.frame) / 2) - 7;
    
    return CGSizeMake(width, width);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *name = [characters[indexPath.row] valueForKey:@"character"];
    NSString *urlImage = [characters[indexPath.row] valueForKey:@"image"];
    NSURL *url = [NSURL URLWithString:urlImage];
    NSData *dataImage = [[NSData alloc] initWithContentsOfURL:url];
    
    [cell.mName setText:name];
    [cell.mImage setImage:[UIImage imageWithData:dataImage]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *quote = [characters[indexPath.row] valueForKey:@"quote"];
}


@end
