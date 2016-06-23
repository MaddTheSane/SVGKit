//
//  RootViewController.h
//  SVGPad
//
//  Copyright Matt Rajca 2010. All rights reserved.
//

@class DetailViewController;

@interface MasterViewController : UITableViewController <UIAlertViewDelegate>

@property(nonatomic,strong) NSMutableArray<NSString*> *sampleNames;

@property (nonatomic, strong) IBOutlet DetailViewController *detailViewController;

@end
