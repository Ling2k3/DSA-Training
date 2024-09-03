const std = @import("std");
const testing = std.testing;
const sort = @import("algo/sorting/normal.zig");
const print = std.debug.print;

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "basic add functionality" {
    var arr = [_]i32{4,2,1,3, 6, 5, 4};
    sort.RecursiveInsertionSort(i32, &arr, 1);
    print("{any}\n", .{arr});
}
