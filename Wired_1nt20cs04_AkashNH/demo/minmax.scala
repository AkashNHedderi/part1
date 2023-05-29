import scala.io.StdIn
import scala.collection.mutable.ArrayBuffer

object Minmax {
	def main(args: Array[String]): Unit = {
		var numArray = new ArrayBuffer[Int]()
		println("Enter the number of elements")
		val n = scala.io.StdIn.readInt()
		println("Enter Elements")
		for (i <- 1 to n)
			numArray += scala.io.StdIn.readInt()
		//println(numArray)
		val t = Minmax(numArray)
		println("Maximum number is ", t._2)
		println("Minimum number is ", t._1)
		}
	def Minmax(numArray : ArrayBuffer[Int] ) : (Int,Int) = {
		var min:Int = 999
		var max:Int = -999
		for(i <- numArray)
		{
			if(i < min)
				min = i
			else if(i > max)
				max = i
		}
		(min , max)
	}
}
