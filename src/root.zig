const std = @import("std");
const testing = std.testing;
const search = @import("algo/searching/basic.zig");
const ds = @import("ds/matrix/matrix.zig");
const sort = @import("algo/sorting/basic.zig");
const print = std.debug.print;

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "basic" {
    var arr = [_]i64{ 3, 6, 1, 5,  2, 7, 2, 5 };
    sort.HeapSort(i64, &arr);
    print("first {any}\n", .{arr});
    
}
// test "matrix" {
//     var pa = std.heap.page_allocator;
//     var mat = try pa.alloc([]i8, 5);
//     defer pa.free(mat);
//     for (mat, 0..) |_, ind| {
//         mat[ind] = try pa.alloc(i8, 5);
//         const i: i8 = @intCast(ind);
//         mat[ind][0] = i;
//         mat[ind][1] = i + 1;
//     }
//     try ds.BooleanMatrixQuestion(i8, mat);
// }
