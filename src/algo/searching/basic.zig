const std = @import("std");
const Error = @import("../../error.zig");
const util = @import("../../util.zig");
const math = std.math;
pub fn BinarySearch(comptime T: type, arr: []T, key: T, low: usize, high: usize) usize {
    if (arr.len <= 1) {
        return 0;
    }
    if (low <= high) {
        const mid = (high + low) / 2;
        if (key > arr[mid]) {
            return BinarySearch(T, arr, key, mid, high);
        } else if (key == arr[mid]) {
            return mid;
        } else if (key < arr[mid]) {
            return BinarySearch(T, arr, key, low, mid);
        }
    }
    return 0;
}
pub fn MetaBinarySearch(comptime T: type ,arr: []T, key: T) usize {
    if(arr.len <= 1) {
        return 0;
    }
    var n = arr.len;
    while(n > 0) {
        const mid = util.min(usize, arr.len-1, n/2);
        if(arr[mid] == key) {
            return mid;
        } else if(arr[mid] < key) {
            n = (arr.len - mid)/2;
        } else {
            n = mid/2;
        }
    }
    return 0;
} 
pub fn TernarySearch(comptime T:type, arr: []T,key: T, low: usize, high: usize) usize {
    if(arr.len <= 1) {
        return 0;
    }
    if(low <= high) {
        const m1 = low + (high - low)/3;
        const m2 = high - (high - low)/3;
        if(arr[m1] == key) {
            return m1;
        }
        if(arr[m2] == key) {
            return m2;
        }
        if(key < arr[m2] and arr[m1] > key) {
            return TernarySearch(T, arr, key, m1, m2);
        }
        if(key > arr[m2]) {
            return TernarySearch(T, arr, key, m2, high);
        }
        if(key < arr[m1]) {
            return TernarySearch(T, arr, key, low, m1);
        }
    }
    return 0;
}