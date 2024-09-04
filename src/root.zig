const std = @import("std");
const testing = std.testing;
const search = @import("algo/searching/basic.zig");
const print = std.debug.print;

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "basic add functionality" {
    var arr = [_]i32{1, 2, 3, 4, 4, 5, 6};
    const rs = search.TernarySearch(i32, &arr, 4, 0, arr.len-1);
    print("{any}\n", .{rs});
}
