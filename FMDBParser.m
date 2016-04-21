//
//  FMDBParser.m
//  FMDB封装
//
//  Created by Iven on 16/4/21.
//  Copyright © 2016年 Iven. All rights reserved.
//

#import "FMDBParser.h"
#import "FMDB.h"

@interface FMDBParser (){

    FMDatabase *_db;
}

@end

@implementation FMDBParser



//打开数据库，如果不存在该数据库，则自行创建
-(void)openDataBase:(NSString*)fileName{
    
    NSString *path = [NSString stringWithFormat:@"/Documents/%@",fileName];
    NSString *filePath = [NSHomeDirectory() stringByAppendingString:path];
    _db = [[FMDatabase alloc]initWithPath:filePath];
    
    
    BOOL isOpen = [_db open];
    if (!isOpen) {
        NSLog(@"打开失败");
        return;
    }

}



//传入数据库操作语句,进行数据操作
-(void)excuteUpdate:(NSString*)excuteSQL{

    BOOL isTrue = [_db executeUpdate:excuteSQL];
    
    if (!isTrue) {
        NSLog(@"语句执行失败");
    }
    
}

//数据查询
-(void)excuteAllDate:(NSString*)selectSQL withNameBlock:(void(^)(NSString* name))sucBlock{

    FMResultSet *set = [_db executeQuery:selectSQL];
    
    while ([set next]) {
        
        NSString *name = [set stringForColumn:@"name"];

        sucBlock(name);
        
    }
}

//关闭数据库
-(void)closeDataBase{
    [_db close];

}
@end
