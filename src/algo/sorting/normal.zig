const std = @import("std");
const util = @import("../../util.zig");
pub fn RecursiveBubbleSort(comptime T: type, arr: []T, n: usize) void {
    if (n <= 1) {
        return;
    }
    var swapped = false;  for(arr, 0..) |_, ind| {
        if(ind+1 < arr.len and arr[ind] > arr[ind+1]) {
            util.swap(i32,&arr[ind], &arr[ind+1]);
            swapped = true;
        }
    }
    if(!swapped) {
        return;
    }
    RecursiveBubbleSort(T,arr, n-1);
}
pub fn RecursiveInsertionSort(comptime T:type, arr: []T, i: usize) void {
    if (i > arr.len-1) {
        return;
    }
    var j = i;
    const key = arr[i];
    if(j == 0 and arr[j] > key) {
        arr[j] = arr[j-1];
    }
    while(j > 0 and arr[j-1] > key): (j-=1) { arr[j] = arr[j-1]; }
    arr[j] = key;
    RecursiveInsertionSort(T, arr, i+1);
}

