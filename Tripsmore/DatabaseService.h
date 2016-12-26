//
//  DatabaseService.h
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DatabaseService : NSObject

+ (DatabaseService *) shareInstance;
@property (nonatomic, strong) FMDatabase * database;
- (NSArray *) search:(NSString *)word eng2pa:(BOOL)isEng2Pa;
- (BOOL) update:(Words *)word changeEditTime:(BOOL)changeEditTime;
- (NSArray *) listWordFavouriteIsEng2Pa:(BOOL)isEng2Pa;
- (BOOL) insert:(Words *)word changeEditTime:(BOOL)changeEditTime;
- (BOOL) deleteW:(Words *)word;
- (void) resetDB;
-(BOOL)insertIntoEng :(Words *)word changeEditTime:(BOOL)changeEditTime;
@end
