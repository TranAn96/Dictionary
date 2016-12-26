//
//  FSCalendarViewPage.h
//  Pods
//
//  Created by Wenchao Ding on 29/1/15.
//
//

#import <UIKit/UIKit.h>

@class FSCalendar,FSCalendarUnit;

@interface FSCalendarPage : UIView

@property (copy, nonatomic) NSDate *date;

- (FSCalendarUnit *)unitForDate:(NSDate *)date;

@end
// Copyright belongs to original author
// http://code4app.net (en) http://code4app.com (cn)
// From the most professional code share website: Code4App.net