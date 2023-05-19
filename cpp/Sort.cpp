#include <array>
#include <bits/stdc++.h>
#include <unordered_map>
using namespace std;

// Quadratic Sort
void swap(int &a, int &b) {
  int temp = a;
  a = b;
  b = temp;
}

// selection_sort (descending)
void selection_sort(int a[], int n) {
  int i, j, min_idx;
  for (i = 0; i < n; i++) {
    min_idx = i;
    for (j = i + 1; j < n; j++) {
      if (a[j] < a[min_idx])
        min_idx = j;
      swap(a[j], a[min_idx]);
    }
  }
}

// bubble_sort
void bubble_sort(int a[], int n) {
  int i, j;
  for (i = 0; i < n; i++) {
    for (j = 0; j < n - i - 1; j++) {
      if (a[j] < a[j + 1])
        swap(a[j], a[j + 1]);
    }
  }
}

// insertion_sort (ascending)
void insertion_sort(int a[], int n) {
  int i, j, key;
  for (i = 1; i < n; i++) {
    key = a[i];
    j = i - 1;

    while (j >= 0 && a[j] > key) {
      a[j + 1] = a[j];
      j = j - 1;
    }
    a[j + 1] = key;
  }
}

// quick_sort using last element as pivot (asc)
int partition(int a[], int low, int high) {

  int pivot = a[high];
  int i = (low - 1);

  for (int j = low; j < high; j++) {
    if (a[j] <= pivot) {
      i++;
      swap(a[i], a[j]);
    }
  }

  swap(a[i + 1], a[high]);
  return (i + 1);
}

void quick_sort(int a[], int low, int high) {
  if (low < high) {

    int pi = partition(a, low, high);

    quick_sort(a, low, pi - 1);

    quick_sort(a, pi + 1, high);
  }
}

// merge_sort
void merge(int arr[], int l, int m, int r) {
  int i, j, k;
  int n1 = m - l + 1;
  int n2 = r - m;

  int L[n1], R[n2];

  for (i = 0; i < n1; i++)
    L[i] = arr[l + i];
  for (j = 0; j < n2; j++)
    R[j] = arr[m + 1 + j];

  i = 0;
  j = 0;
  k = l;

  while (i < n1 && j < n2) {
    if (L[i] <= R[j]) {
      arr[k] = L[i];
      i++;
    } else {
      arr[k] = R[j];
      j++;
    }
    k++;
  }

  while (i < n1) {
    arr[k] = L[i];
    i++;
    k++;
  }

  while (j < n2) {
    arr[k] = R[j];
    j++;
    k++;
  }
}

void merge_sort(int arr[], int l, int r) {
  if (l < r) {
    int m = l + (r - l) / 2;

    merge_sort(arr, l, m);
    merge_sort(arr, m + 1, r);
    merge(arr, l, m, r);
  }
}

// heap_sort
void heapify(int arr[], int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && arr[left] > arr[largest])
    largest = left;

  if (right < n && arr[right] > arr[largest])
    largest = right;

  if (largest != i) {
    swap(arr[i], arr[largest]);
    heapify(arr, n, largest);
  }
}

void heap_sort(int arr[], int n) {
  for (int i = n / 2 - 1; i >= 0; i--)
    heapify(arr, n, i);

  for (int i = n - 1; i >= 0; i--) {
    swap(arr[0], arr[i]);
    heapify(arr, i, 0);
  }
}
int main() {
  int n;
  cin >> n;
  int *a = new int[n];
  for (int i = 0; i < n; i++) {
    cin >> a[i];
  }
  quick_sort(a, 0, n - 1);
  for (int i = 0; i < n; i++)
    cout << a[i] << " ";
  delete[] a;
  return 0;
}
