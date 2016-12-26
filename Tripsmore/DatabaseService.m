//
//  DatabaseService.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "DatabaseService.h"

@implementation DatabaseService

static id _instance = nil;


+ (DatabaseService *) shareInstance;
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [[DatabaseService alloc] init];
        }
    });
    return _instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        //NSString *documentsDirectory = [paths objectAtIndex:0];
       // NSString *pathInDocument = [documentsDirectory stringByAppendingPathComponent:@"database.sqlite"];
        
       // NSFileManager *fileManager = [NSFileManager defaultManager];
       // BOOL isDatabaseExist = [fileManager fileExistsAtPath:pathInDocument];
        //if (!isDatabaseExist) {
            NSString* dbPath = [[NSBundle mainBundle] pathForResource:@"Project1" ofType:@"db"];
          //  [fileManager copyItemAtPath:dbPath toPath:pathInDocument error:nil];
            NSLog(@"%@",dbPath);
        //}
        
        // create database
        self.database = [[FMDatabase alloc] initWithPath:dbPath];
        NSLog(@" DÂTA BASE NƠ :%@",dbPath);
    }
    
    return self;
}

- (void) resetDB;
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pathInDocument = [documentsDirectory stringByAppendingPathComponent:@"Project1.db"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString* dbPath = [[NSBundle mainBundle] pathForResource:@"Project1" ofType:@"db"];
    [fileManager removeItemAtPath:pathInDocument error:nil];
    [fileManager copyItemAtPath:dbPath toPath:pathInDocument error:nil];
    // create database
    self.database = [[FMDatabase alloc] initWithPath:pathInDocument];
   
}

- (BOOL) insert:(Words *)word changeEditTime:(BOOL)changeEditTime;
{
    [self.database open];
    NSString *strDB = @"table_eng_pa";
    if (!word.isEng2Pa) {
        strDB = @"table_pa_eng";
    }
    NSDate *dateNow = [NSDate date];
    
    NSString *strDate = [[Utils dateFormatterShort] stringFromDate:dateNow];
    if (!changeEditTime) {
        strDate = word.edited;
    }
    
    NSString *strQuery = [NSString stringWithFormat:@"INSERT INTO %@ (word, result, description, favorites, edited , translitetation) VALUES ('%@', '%@', '%@', '%@', '%@' ,'%@')", strDB,
                          SAFE_STR(word.word),
                          SAFE_STR(word.result),
                          SAFE_STR(word.strDescription),
                          SAFE_STR(word.favorites),
                          SAFE_STR(strDate),
                          SAFE_STR(word.translitetation)
                          ];
    BOOL success = [self.database executeUpdate:strQuery];
    if (!success) {
        NSLog(@"Error %d: %@", [self.database lastErrorCode], [self.database lastErrorMessage]);
    } else {
        word.edited = strDate;
    }
    
    [self.database close];
    return success;
}
-(BOOL)insertIntoEng :(Words *)word changeEditTime:(BOOL)changeEditTime;{
    [self.database open];
    NSString *strDB = @"table_eng_pa";
    NSDate *dateNow = [NSDate date];
    
    NSString *strDate = [[Utils dateFormatterShort] stringFromDate:dateNow];
    if (!changeEditTime) {
        strDate = word.edited;
    }
    
    NSString *strQuery = [NSString stringWithFormat:@"INSERT INTO %@ (word, result, description, favorites, edited , translitetation) VALUES ('%@', '%@', '%@', '%@', '%@' ,'%@')", strDB,
                          SAFE_STR(word.word),
                          SAFE_STR(word.result),
                          SAFE_STR(word.strDescription),
                          SAFE_STR(word.favorites),
                          SAFE_STR(strDate),
                          SAFE_STR(word.translitetation)
                          ];
    BOOL success = [self.database executeUpdate:strQuery];
    if (!success) {
        NSLog(@"Error %d: %@", [self.database lastErrorCode], [self.database lastErrorMessage]);
    } else {
        word.edited = strDate;
    }
    
    [self.database close];
    return success;

}
- (BOOL) update:(Words *)word changeEditTime:(BOOL)changeEditTime;
{
    [self.database open];
    NSString *strDB = @"table_eng_pa";
    if (!word.isEng2Pa) {
        strDB = @"table_pa_eng";
    }
    NSDate *dateNow = [NSDate date];
    
    NSString *strDate = [[Utils dateFormatterShort] stringFromDate:dateNow];
    if (!changeEditTime) {
        strDate = word.edited;
    }
    
    NSString *strQuery = [NSString stringWithFormat:@"UPDATE %@ SET word='%@', result='%@', description='%@', favorites='%@', edited='%@' WHERE _id=%ld", strDB,
                          SAFE_STR(word.word),
                          SAFE_STR(word.result),
                          SAFE_STR(word.strDescription),
                          SAFE_STR(word.favorites),
                          SAFE_STR(strDate),
                        
                          word.mId];
    BOOL success = [self.database executeUpdate:strQuery];
    if (!success) {
        NSLog(@"Error %d: %@", [self.database lastErrorCode], [self.database lastErrorMessage]);
    } else {
        word.edited = strDate;
    }
    
    [self.database close];
    return success;
}

- (NSArray *) search:(NSString *)word eng2pa:(BOOL)isEng2Pa;
{
    NSLog(@"Start");
    [self.database open];
    NSString *strDB = @"table_eng_pa";
    if (!isEng2Pa) {
        strDB = @"table_pa_eng";
    }
    NSString *strQuery = [NSString stringWithFormat:@"SELECT _id, word, result, description, favorites, edited,translitetation FROM %@ WHERE word LIKE '%%%@%%' LIMIT 100", strDB, word];
    FMResultSet *results = [self.database executeQuery:strQuery];
    NSLog(@"query: %@", results.query);
    if (!results || !results.query) {
        NSLog(@"Error %d: %@", [self.database lastErrorCode], [self.database lastErrorMessage]);
    }

    NSMutableArray *lstResult = [NSMutableArray array];
    while ([results next])
    {
        NSLog(@"%@, %@", results[0], results[1]);
        Words *obj = [[Words alloc] init];
        obj.isEng2Pa = isEng2Pa;
        obj.mId = [results[0] intValue];
        if (results[1] != [NSNull null]) {
            obj.word = results[1];
        }
        if (results[2] != [NSNull null]) {
            obj.result = results[2];
        }
        if (results[3] != [NSNull null]) {
            obj.strDescription = results[3];
        }
        if (results[4] != [NSNull null]) {
            obj.favorites = results[4];
        }
        if (results[5] != [NSNull null]) {
            obj.edited = results[5];
        }
        if (results[6] != [NSNull null]) {
            obj.translitetation = results[6];
        }
        [lstResult addObject:obj];
    }
    
    [self.database close];
    
    return lstResult;
}

- (BOOL) deleteW:(Words *)word;
{
    [self.database open];
    NSString *strDB = @"table_eng_pa";
    if (!word.isEng2Pa) {
        strDB = @"table_pa_eng";
    }
    
    NSString *strQuery = [NSString stringWithFormat:@"DELETE FROM %@ WHERE _id = %ld", strDB,
                          word.mId];
    BOOL success = [self.database executeUpdate:strQuery];
    if (!success) {
        NSLog(@"Error %d: %@", [self.database lastErrorCode], [self.database lastErrorMessage]);
    } else {
    }
    
    [self.database close];
    return success;
}
- (NSArray *) listWordFavouriteIsEng2Pa:(BOOL)isEng2Pa;
{
    NSLog(@"Start");
    [self.database open];
    NSString *strDB = @"table_eng_pa";
    if (!isEng2Pa) {
        strDB = @"table_pa_eng";
    }
    NSString *strQuery = [NSString stringWithFormat:@"SELECT _id, word, result, description, favorites, edited,translitetation FROM %@ WHERE favorites = '1'", strDB];
    FMResultSet *results = [self.database executeQuery:strQuery];
    NSLog(@"query: %@", results.query);
    if (!results || !results.query) {
        NSLog(@"Error %d: %@", [self.database lastErrorCode], [self.database lastErrorMessage]);
    }
    
    NSMutableArray *lstResult = [NSMutableArray array];
    while ([results next])
    {
        NSLog(@"%@, %@", results[0], results[1]);
        Words *obj = [[Words alloc] init];
        obj.isEng2Pa = isEng2Pa;
        obj.mId = [results[0] intValue];
        if (results[1] != [NSNull null]) {
            obj.word = results[1];
        }
        if (results[2] != [NSNull null]) {
            obj.result = results[2];
        }
        if (results[3] != [NSNull null]) {
            obj.strDescription = results[3];
        }
        if (results[4] != [NSNull null]) {
            obj.favorites = results[4];
        }
        if (results[5] != [NSNull null]) {
            obj.edited = results[4];
        }
        if (results[6] != [NSNull null]) {
            obj.translitetation = results[6];
        }
        [lstResult addObject:obj];
    }
    
    [self.database close];
    
    return lstResult;
}




@end
