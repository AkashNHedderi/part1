object ScalaSort {
  def sort(a: List[Int]): List[Int] = {
    if (a.length < 2) a
    else {
      val pivot = a(a.length / 2)
      val smaller = a.filter(_ < pivot)
      val equal = a.filter(_ == pivot)
      val greater = a.filter(_ > pivot)
      sort(smaller) ::: equal ::: sort(greater)
    }
  }

  def sortArray(a: Array[Int]): Unit = {
    def swap(l: Int, r: Int): Unit = {
      val t = a(l)
      a(l) = a(r)
      a(r) = t
    }

    def sort2(l: Int, r: Int): Unit = {
      val pivot = a((l + r) / 2)
      var i = l
      var j = r
      while (i <= j) {
        while (a(i) < pivot) i += 1
        while (a(j) > pivot) j -= 1
        if (i <= j) {
          swap(i, j)
          i += 1
          j -= 1
        }
      }
      if (l < j) sort2(l, j)
      if (i < r) sort2(i, r)
    }

    if (a.length > 1) sort2(0, a.length - 1)
  }

  def main(args: Array[String]): Unit = {
    var xs = List(6, 2, 9, 8, 1)
    println("Sorted List using Functional style:")
    println(sort(xs))
    
    val xs2 = Array(6, 2, 9, 8, 1)
    println("Sorted List using Imperative style:")
    sortArray(xs2)
    for (ele <- xs2)
      println(ele)
  }
}