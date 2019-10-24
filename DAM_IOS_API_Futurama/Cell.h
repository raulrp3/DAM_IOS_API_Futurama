//
//  Cell.h
//  DAM_IOS_API_Futurama
//
//  Created by Raul Ramirez on 24/10/2019.
//  Copyright © 2019 Raul Ramirez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mImage;
@property (weak, nonatomic) IBOutlet UILabel *mName;

@end
