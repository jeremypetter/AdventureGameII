//
//  RoomBuilder.m
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "RoomBuilder.h"

@implementation RoomBuilder

+ (instancetype)roomBuilder{
    RoomBuilder* builder = [[RoomBuilder alloc] init];
    return builder;
}

- (Room*)buildDungeonWithDimensionsX: (int) sizeX andY: (int) sizeY
{
    Room* origin = [self buildRowOfRoomsOfSize:sizeX];
    Room* target = origin;
    for(int i=1; i<sizeY;i++)
    {
        Room* newRow = [self buildRowOfRoomsOfSize:sizeX];
        [self attachRow: target toSouthRow: newRow];
        target = newRow;
    }
    return origin;
}

- (Room*)buildRowOfRoomsOfSize:(int) sizeX
{
    Room* origin = [[Room alloc] init];
    Room* target = origin;
    for(int i=1; i<sizeX; i++)
    {
        Room* newRoom = [[Room alloc] init];
        [newRoom attachEastOf: target];
        target = newRoom;
    }
    return origin;
}

- (void) attachRow: (Room*) northRowOrigin toSouthRow: (Room*) southRowOrigin
{
    Room* south = southRowOrigin;
    Room* north = northRowOrigin;
    while (south){
        [south attachSouthOf:north];
        south = south.west;
        north = north.west;
    }
}

@end
