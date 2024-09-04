pub fn swap(comptime T: type, a: *T, b: *T) void {
    var temp: T = undefined;
    temp = a.*;
    a.* = b.*;
    b.* = temp;
}
pub fn min(comptime T: type, a: T, b: T) T {
    if(a < b) {
        return a;
    } else {
        return b;
    }
}
