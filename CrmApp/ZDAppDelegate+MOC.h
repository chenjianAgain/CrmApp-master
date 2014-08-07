//
//  PhotomaniaAppDelegate+MOC.h
//  Photomania
//
//  This code comes from the Xcode template for Master-Detail application.
//

#import "ZDAppDelegate.h"

@interface ZDAppDelegate (MOC)

- (NSManagedObjectContext *)createMainQueueManagedObjectContext;

@end
