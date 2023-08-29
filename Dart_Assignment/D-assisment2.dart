import 'dart:collection';

base class EntryItem extends LinkedListEntry<EntryItem> {
  int id;
  int value;
  EntryItem(this.id, this.value);
  @override
  String toString() {
    return '$id : $value';
  }
}

void main() {
  var l1 = LinkedList<EntryItem>();
  var arr = [1, 3, 6, 12, 22, 32, 9, 8];

  for (int i = 0; i < arr.length; i++) {
    l1.add(EntryItem(i, arr[i]));
  }

  print(l1);
  bublesort(l1);
  print("sorted list $l1");
}

LinkedList<EntryItem> bublesort(l1) {
  int a = l1.length;
  for (int i = 0; i < a - 1; i++) {
    for (int j = 0; j < a - 1; j++) {
      if (l1.elementAt(j).value > l1.elementAt(j + 1).value) {
        int temp = l1.elementAt(j).value;
        l1.elementAt(j).value = l1.elementAt(j + 1).value;
        l1.elementAt(j + 1).value = temp;
      }
    }
  }
  return l1;
}
