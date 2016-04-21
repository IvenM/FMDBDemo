//
//  FMDBParser.h
//  FMDB封装
//
//  Created by Iven on 16/4/21.
//  Copyright © 2016年 Iven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMDBParser : UIView

-(void)openDataBase:(NSString*)fileName;

-(void)excuteUpdate:(NSString*)excuteSQL;

-(void)excuteAllDate:(NSString*)selectSQL withNameBlock:(void(^)(NSString* name))sucBlock;

-(void)closeDataBase;

@end
