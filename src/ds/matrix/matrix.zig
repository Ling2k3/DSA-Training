const std = @import("std");
const print = std.debug.print;

pub fn TraverseCompleteMatrix(comptime T: type, mat: [][]T, key: T) void {
    if (mat.len == 0 or mat.len == 1) {
        return;
    }
    for (mat, 0..) |row, row_index| {
        for (row, 0..) |col, col_index| {
            if (col == key) {
                print("key found at col: {any}, row: {any}\n", .{ col_index, row_index });
            }
        }
    }
}
pub fn SearchNTime(comptime T: type, mat: [][]T, key: T, n: usize) void {
    if (n == 0 or n == 1) {
        return;
    }
    var i: usize = 0;
    var j: usize = n - 1;
    while (i < n and j >= 0) {
        if (mat[i][j] == key) {
            print("key found at col: {any}, row: {any}\n", .{ j, i });
        }
        if (mat[i][j] > key) {
            j -= 1;
        } else {
            i += 1;
        }
    }
    print("key not found", .{});
}
pub fn SpiralOrder(comptime T: type, mat: [][]T) !void {
    const row = mat.len;
    const col = mat[0].len;

    if (row <= 1 or col <= 1) {
        return;
    }

    var ans = std.ArrayList(T).init(std.testing.allocator);
    defer ans.deinit();

    var top: usize = 0;
    var left: usize = 0;
    var bottom: usize = row - 1;
    var right: usize = col - 1;

    while (top <= bottom and left <= right and right >= 1 and bottom >= 1) {
        for (left..right + 1) |ind| {
            try ans.append(mat[top][ind]);
        }
        top += 1;
        for (top..bottom + 1) |ind| {
            try ans.append(mat[ind][right]);
        }
        right -= 1;
        if (top <= bottom) {
            var k: usize = right;
            while (k >= left and k >= 1) : (k -= 1) {
                try ans.append(mat[bottom][k]);
            }
            bottom -= 1;
        }
        if (left <= right) {
            var k: usize = bottom;
            while (k >= top and k >= 1) : (k -= 1) {
                try ans.append(mat[k][left]);
            }
            left += 1;
        }
    }
    print("{any}\n", .{ans.items});
}
pub fn BooleanMatrixQuestion(comptime T: type, mat: [][]T) !void {
    var row_flag = false;
    var col_flag = false;
    for (mat, 0..) |row, row_ind| {
        for (row, 0..) |val_c, col_ind| {
            if(row_ind == 0 and val_c == 1) {
                row_flag = true;
            }
            if(col_ind == 0 and val_c == 1) {
                col_flag = true;
            }
            if(val_c == 1) {
                mat[0][col_ind] = 1;
                mat[row_ind][0] = 1;
            }

        }
    }

    for(mat, 0..) |row, row_ind| {
        for(row, 0..) |_, col_ind| {
            if(mat[0][col_ind] == 1 or mat[row_ind][0] == 1) {
                mat[row_ind][col_ind] = 1;
            }
        } 
    }
    if(row_flag) {
        for(0..mat[0].len) |ind| {
            mat[0][ind] = 1;
        }
    }
    if(col_flag) {
        for(0..mat.len) |ind| {
            mat[ind][0] = 1;
        }
    }
}
