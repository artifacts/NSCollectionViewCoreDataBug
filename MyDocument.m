//
//  MyDocument.m
//  CollectionViewCoreDataBug
//
//  Created by Michael Markowski on 05.08.11.
//  Copyright Artifacts - Fine Software Development 2011 . All rights reserved.
//

#import "MyDocument.h"

@implementation MyDocument
@synthesize arrayController;

- (id)init 
{
    self = [super init];
    if (self != nil) {
        // initialization code
    }
    return self;
}

- (IBAction)addAction:(id)sender {
	NSManagedObject *item = [NSEntityDescription insertNewObjectForEntityForName: @"Item" inManagedObjectContext: [self managedObjectContext]];
	NSManagedObject *relatedItem = [NSEntityDescription insertNewObjectForEntityForName: @"RelatedItem" inManagedObjectContext: [self managedObjectContext]];
	[item setValue:relatedItem forKey:@"relatedItem"];
//	[arrayController rearrangeObjects];
}

- (IBAction)infoAction:(id)sender {
	NSLog(@"arraycontroller contents: %@", [[arrayController arrangedObjects] description]);
}

- (NSString *)windowNibName 
{
    return @"MyDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)windowController 
{
    [super windowControllerDidLoadNib:windowController];
    // user interface preparation code
}

- (void) dealloc
{
	[arrayController release];
	[super dealloc];
}

@end
