# Data Structures - In Swift

## Heap

<details><summary>Details</summary>
<p>

A heap is a complete binary tree, also known as a binary heap, that can be constructed using an array.
Heaps are of two types:
1. `Maxheap` - Elements with higher value have higher priority. In a max heap, parent nodes must always contain a value that is greater than or equal to the value in its children. The root node will always contain the highest value
2. `Minheap` - Elements with lower value have higher priority. In a min heap, parent nodes must always contain a value that is less than or equal to the value in its children. The root node will always contain the lowest value.

Another important property of a heap is that it is a complete binary tree. This means that every level must be filled, except for the last level.

Applications of Heap
1. Calculating the minimum or maximum element of a collection 
2. Heap Sort
3. Constructing a priority queue
4. Constructing graph algorithms like Prim’s or Dijkstra’s with a priority queue.

| Operation | Time Complexity(Worst Case) |
| :---: | :---: |
| Heap Creation | O(nlogn) |
| Insert | O(logn) |
| Remove | O(logn) |
| Search | O(n) |
| Peek | O(1) |

</p>
</details>

## Linked Lists

<details><summary>Single Linked List</summary>
<p>

The linked list is a linear data structure that contains a sequence of elements such that each element links to its next element in the sequence. Each element in a linked list is called "Node".

| Operation | Time Complexity(Average Case) | Time Complexity(Worst Case) |
| :---: | :---: | :---: |
| Insert | O(1) | O(1) |
| Delete | O(1) | O(1) |
| Search | O(1) | O(n) |

| Space Complexity(Worst Case) |
| :---: |
| O(n) |

<details><summary>Code</summary>
<p>

```swift
print("hello world!")
```

</p>
</details>

</p>
</details>

## Sorting Algorithms

### Fast
| Algorithm | Time Complexity(Average Case) | Time Complexity(Worst Case) |
| :---: | :---: | :---: |
| [Merge Sort](#merge-sort) | O(nlogn) | O(nlogn) |
| [Heap Sort](#heap-sort) | O(nlogn) | O(nlogn) |
| [Quick Sort](#quick-sort) | O(nlogn) | O(n^2) |

### Slow
| Algorithm | Time Complexity(Average Case) | Time Complexity(Worst Case) |
| :---: | :---: | :---: |
| [Bubble Sort](#bubble-sort) | O(n^2) | O(n^2) |

| Space Complexity |
| :---: |
| O(1) |

### Merge Sort
<details><summary>Details</summary>
<p>

Merge sort is one of the most efficient sorting algorithms. With a time complexity of O(log n), it’s one of the fastest of all general-purpose sorting algorithms. The idea behind merge sort is divide and conquer; to break up a big problem into several smaller, easier to solve problems and then combine those solutions into a final result. The merge sort mantra is to split first and merge after.

The merge sort algorithm works as follows:
1. First split the list in half. You now have two unsorted lists:
2. Now keep splitting the resulting list until you can’t split anymore. In the end, you will have one (sorted!) item in each list:
3. Finally merge the lists together in the reverse order in which you split them. During each merge, you put the contents in sorted order. This is easy because each individual list has already been sorted:

#### Reading reference
1. https://www.youtube.com/watch?v=TzeBrDU-JaY

| Operation | Time Complexity(Average Case) | Time Complexity(Worst Case) |
| :---: | :---: | :---: |
| Sort | O(nlogn) | O(nlogn) |

| Space Complexity |
| :---: |
| O(nlogn) |

</p>
</details>

### Heap Sort
<details><summary>Details</summary>
<p>

A heap is a partially sorted binary tree that is stored inside an array. The heap sort algorithm takes advantage of the structure of the heap to perform a fast sort. To sort from lowest to highest, heap sort first converts the unsorted array to a max-heap, so that the first element in the array is the largest.

1. Swap the first element (index 0) with the last one at index n-1 on heap. Now the new root node, will be smaller than its children, so we fix up the max-heap up to element n-2 using the shift down or "heapify" procedure.
Important: When we fix the heap, we ignore the last item at index n-1. That now contains the array's maximum value, so it is in its final sorted place already.
2. We repeat this process until we arrive at the root node and then the whole array is sorted.

</p>
</details>

### Quick Sort
<details><summary>Details</summary>
<p>

Quick Sort is an efficient inplace sorting algorithm that takes constant amount of space. Basic idea behind quick sort is to select a pivot element and arrange elements lower than pivot on left and greater than pivot on right to find a partition index. An ideal pivot would split the elements evenly between the less than and greater than partitions.

Three steps are involved in whole process

1. `Pivot selection`: Pick an element, called a pivot, from the array (usually the leftmost or the rightmost element of the partition).
2. `Partitioning`: Reorder the array so that all elements with values less than the pivot come before the pivot, while all elements with values greater than the pivot come after it (equal values can go either way). After this partitioning, the pivot is in its final position.
 3. `Recur`: Recursively apply the above steps to the sub-array of elements with smaller values than pivot and separately to the sub-array of elements with greater values than pivot.

#### Types of Quick Sort
1. Choose middle element as pivot
2. `Lomuto’s partitioning` - Choose the last element as the pivot. 
`Issues` - Duplicates end up in the less than partition and aren’t grouped together
3. `Hoare’s partitioning` - Uses two indices that start at the ends of the array being partitioned, then move toward each other, until they detect an inversion: a pair of elements, one greater than or equal to the pivot, one lesser or equal, that are in the wrong order relative to each other. The inverted elements are then swapped. When the indices meet, the algorithm stops and returns the final index. Hoare's scheme is more efficient than Lomuto's partition scheme because it does three times fewer swaps on average, and it creates efficient partitions even when all values are equal.
`Issues` - Like Lomuto's partition scheme, Hoare's partitioning also would cause Quicksort to degrade to O(n^2) for already sorted input, if the pivot was chosen as the first or the last element. Duplicates can be all over the place
4. Median element strategy
5. `Dutch national flag partitioning` - Technique to use if you have lots of duplicate elements in the array to be sorted.

#### Reading reference
1. https://github.com/raywenderlich/swift-algorithm-club/tree/master/Quicksort
2. https://en.wikipedia.org/wiki/Quicksort
3. https://www.youtube.com/watch?v=COk73cpQbFQ

| Operation | Time Complexity(Average Case) | Time Complexity(Worst Case) |
| :---: | :---: | :---: |
| Sort | O(nlogn) | O(n^2) |

| Space Complexity |
| :---: |
| O(1) |

#### Optimizations

1. To make sure at most O(log n) space is used, recur first into the smaller side of the partition, then use a tail call to recur into the other, or update the parameters to no longer include the now sorted smaller side, and iterate to sort the larger side.
2. When the number of elements is below some threshold (perhaps ten elements), switch to a non-recursive sorting algorithm such as insertion sort that performs fewer swaps, comparisons or other operations on such small arrays. The ideal 'threshold' will vary based on the details of the specific implementation.

</p>
</details>

### Bubble Sort
<details><summary>Details</summary>
<p>

One of the simplest sorts is the bubble sort, which repeatedly compares adjacent values and swaps them, if needed, to perform the sort. The larger values in the set will therefore "bubble up" to the end of the collection.

#### Reading reference
1. https://www.youtube.com/watch?v=Jdtq5uKz-w4

| Operation | Time Complexity(Average Case) | Time Complexity(Worst Case) |
| :---: | :---: | :---: |
| Sort | O(n^2) | O(n^2) |

| Space Complexity |
| :---: |
| O(1) |

</p>
</details>
