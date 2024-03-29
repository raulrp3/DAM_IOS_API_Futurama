//
//  ViewController.h
//  DAM_IOS_API_Futurama
//
//  Created by Raul Ramirez on 24/10/2019.
//  Copyright © 2019 Raul Ramirez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UICollectionViewController<UICollectionViewDelegate, UICollectionViewDataSource>{
    
    NSMutableArray *characters;
    NSNumber *numberCharacters;
}

@property (strong, nonatomic) IBOutlet UICollectionView *mCollectionView;
- (IBAction)reloadCharacters:(id)sender;

@end

