const std = @import("std");
const Error = @import("../../error.zig");
const util = @import("../../util.zig");
pub fn SelectionSort(comptime T: type, arr: []T) !void {
    if (arr.len == 0) {
        return Error.ArrayError.IndexOutOfBound;
    } else if (arr.len == 1) {
        return;
    } else { for (arr, 0..) |_, ind| {
            var minIndex: usize = 0;
            var i: usize = ind;
            var isChange: bool = false;
            while (i < arr.len) : (i += 1) {
                if (arr[i] < arr[ind]) {
                    minIndex = i;
                    isChange = true;
                }
            }
            if (isChange) {
                util.swap(T, &arr[minIndex], &arr[ind]);
            }
        }
    }
}
pub fn BubbleSort(comptime T: type, arr: []T) !void {
    if (arr.len == 0) {
        return Error.ArrayError.IndexOutOfBound;
    } else if (arr.len == 1) {
        return;
    } else {
        var isSwap = false;
        for (arr, 0..) |_, ind| {
            for (0..arr.len - ind - 1) |i| {
                if (arr[i] > arr[i + 1]) {
                    util.swap(i32, &arr[i], &arr[i + 1]);
                    isSwap = true;
                }
            }
            if (!isSwap) {
                break;
            }
        }
    }
}
pub fn InsertionSort(comptime T: type, arr: []T) !void {
    if (arr.len == 0) {
        return Error.ArrayError.IndexOutOfBound;
    } else if (arr.len == 1) {
        return;
    } else {
        for (1..arr.len) |ind| {
            var j = ind - 1;
            const key = arr[ind];
            while (j >= 0 and arr[j] > key) : (j -= 1) {
                arr[j + 1] = arr[j];
            }
            arr[j + 1] = key;
        }
        return;
    }
}
fn mergeSortHelper(comptime T: type, arr: []T, mid: usize, low: usize, high: usize, alloc: std.mem.Allocator) !void {
    var rs = try alloc.alloc(T, arr.len);
    defer alloc.free(rs);
    @memset(rs, 0);
    // start ingex
    var left = low;
    var right = mid + 1;
    var i: usize = 0;
    while (left <= mid and right <= high) {
        if (arr[left] <= arr[right]) {
            const ptr = &rs[i];
            ptr.* = arr[left];
            left += 1;
        } else {
            const ptr = &rs[i];
            ptr.* = arr[right];
            right += 1;
        }
        i += 1;
    }

    while (left <= mid) {
        const ptr = &rs[i];
        ptr.* = arr[left];
        left += 1;
        i += 1;
    }
    while (right <= high) {
        const ptr = &rs[i];
        ptr.* = arr[right];
        right += 1;
        i += 1;
    }
    for (low..high + 1) |ind| {
        const ptr = &arr[ind];
        ptr.* = rs[ind - low];
    }
}

pub fn MergeSort(comptime T: type, arr: []T, low: usize, high: usize, alloc: std.mem.Allocator) !void {
    const len = arr.len;
    if (len <= 1 or low >= high) {
        return;
    }
    const m = (low + high) / 2;
    try MergeSort(T, arr, low, m, alloc);
    try MergeSort(T, arr, m + 1, high, alloc);
    try mergeSortHelper(T, arr, m, low, high, alloc);
}

pub fn quickSortHelper(comptime T: type, arr: []T, low: usize, high: usize) usize {
    var index_smaller: usize = low;
    const pivot = arr[high];

    // loop from low to high - 1
    for (low..high) |ind| {
        if (arr[ind] < pivot) {
            if (low > 0) {
                index_smaller += 1;
                util.swap(T, &arr[index_smaller - 1], &arr[ind]);
            } else {
                util.swap(T, &arr[index_smaller], &arr[ind]);
                index_smaller +=1;
            }
        }
    }
    util.swap(T, &arr[index_smaller], &arr[high]);
    return index_smaller;
}
pub fn QuickSort(comptime T: type, arr: []T, low: usize, high: usize) void {
    if (arr.len <= 1 or low >= high) {
        return;
    }
    const ind = quickSortHelper(T, arr, low, high);
    if (ind > 0) {
        QuickSort(T, arr, low, ind - 1);
    }
    QuickSort(T, arr, ind + 1, high);
}
