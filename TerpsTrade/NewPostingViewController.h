//
//  NewPostingViewController.h
//  TerpsTrade
//
//  Created by Jonathan Tseng on 12/11/14.
//  Copyright (c) 2014 JonkGames. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewPostingViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *authorTextField;
@property (weak, nonatomic) IBOutlet UITextField *conditionTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@end
