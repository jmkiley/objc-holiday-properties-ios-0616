//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [ self holidaysInSeason:s]
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    NSArray *holidays = [ _database[ season] allKeys ] ;
    return holidays;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    NSMutableArray *holidaySupplies = _database[season][holiday];
    return holidaySupplies;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    BOOL holidayIsInSeason = [ [_database[season] allKeys] containsObject:holiday ] ;
    return holidayIsInSeason;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    BOOL supplyIsInHoliday = [ _database[season][holiday] containsObject:supply ];
    return supplyIsInHoliday;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    _database[season][holiday] = [ NSMutableArray new ];
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [ _database[season][holiday] addObject:supply];
    // no return
}

@end
