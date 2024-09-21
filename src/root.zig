const std = @import("std");
const testing = std.testing;
const search = @import("algo/searching/basic.zig");
const ds = @import("ds/matrix/matrix.zig"); const print = std.debug.print;

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "basic" {
    var arr = [_]u64{ 1, 2, 3, 4, 4, 5, 6 };
    const rs = search.InterpolationSearch(@TypeOf(arr[0]), &arr, 4, 0, arr.len - 1);
    print("first {any}\n", .{rs});
}
test "matrix" {
    var pa = std.heap.page_allocator;
    var mat = try pa.alloc([]i8, 5);
    defer pa.free(mat);
    for(mat, 0..) |_,ind| {
        mat[ind] = try pa.alloc(i8, 5);
        const i: i8 = @intCast(ind);
        mat[ind][0] = i; 
        mat[ind][1] = i+1;
    }
    try ds.BooleanMatrixQuestion(i8, mat);

}
