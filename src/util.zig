pub fn swap(comptime T: type, a: *T, b: *T) void {
    var temp: T = undefined;
    temp = a.*;
    a.* = b.*;
    b.* = temp;
}