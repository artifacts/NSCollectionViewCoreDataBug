## Summary:

CoreData throws an Exception when removing NSCollectionView Items and saving while NSCollectionView is performing it's animation.

Project setup/environment:
CoreData model with two entities: "Item" and "RelatedItem". "Item" has a relation to "RelatedItem". Both entities each contain two attributes: "foo" and "bar" (NSString), which are bound to the view (NSCollectionViewItem).

##Steps to Reproduce:

- Open attached Project or clone at https://github.com/artifacts/NSCollectionViewCoreDataBug
- Hit "Add" button a couple of times. Some items will be added.
- Save document under an arbitrary name.
- Start clicking "Remove"-Button a couple of times and WHILE NSCollectionView IS ANIMATING hit Cmd-S to save.

##Expected Results:

The document should be saved without error.

##Actual Results:

CoreData could not fulfill a fault for '0x1001f40b0 <x-coredata://64DE7FCC-8F74-4445-8F6F-173ECA2CB5C4/Item/p5>'

##Regression:

This also happens in undo/redo scenarios. E.g.:
Add some items, save, remove all items, save again, undo until no more undo possible, redo, CRASH:

2011-08-05 12:28:01.942 CollectionViewCoreDataBug[73308:a0f] CoreData could not fulfill a fault for '0x1004e73a0 <x-coredata://0F566CD9-715B-46EB-8E2F-66EF9CA08869/Item/p1>'
2011-08-05 12:28:02.493 CollectionViewCoreDataBug[73308:a0f] CoreData could not fulfill a fault for '0x10047fc30 <x-coredata://0F566CD9-715B-46EB-8E2F-66EF9CA08869/RelatedItem/p4>'
2011-08-05 12:28:02.587 CollectionViewCoreDataBug[73308:a0f] Cannot remove an observer <NSKeyValueObservance 0x115e0eca0> for the key path "relatedItem.bar" from <NSManagedObject 0x10043ec80>, most likely because the value for the key "relatedItem" has changed without an appropriate KVO notification being sent. Check the KVO-compliance of the NSManagedObject class.
2011-08-05 12:28:02.598 CollectionViewCoreDataBug[73308:a0f] Serious application error.  Exception was caught during Core Data change processing: CoreData could not fulfill a fault for '0x10047fc30 <x-coredata://0F566CD9-715B-46EB-8E2F-66EF9CA08869/RelatedItem/p4>' with userInfo {
    NSAffectedObjectsErrorKey =     (
        "<NSManagedObject: 0x10044a730> (entity: RelatedItem; id: 0x10047fc30 <x-coredata://0F566CD9-715B-46EB-8E2F-66EF9CA08869/RelatedItem/p4> ; data: <fault>)"
    );
}

This also happens on Lion.

##Notes:

I'm not alone, see:

http://stackoverflow.com/questions/4733911/is-nscollectionview-compatible-with-coredata/6951079#6951079

