//
//  MyDocument.h
//  CollectionViewCoreDataBug
//
//  Created by Michael Markowski on 05.08.11.
//  Copyright Artifacts - Fine Software Development 2011 . All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyDocument : NSPersistentDocument {
	NSArrayController *arrayController;
}

@property (nonatomic, retain) IBOutlet NSArrayController *arrayController;

- (IBAction)infoAction:(id)sender;
- (IBAction)addAction:(id)sender;

@end
