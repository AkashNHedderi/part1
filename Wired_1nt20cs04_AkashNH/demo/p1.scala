import scala.io.Source
object wordCount{
	def main(args:Array[String])
	{
		if(args.length!=1)
			{
					System.err.println("error")
					System.exit(1)
			}
var filename=args(0)
val wordCount=scala.collection.mutable.Map[String,Int]()
for(line<-Source.fromFile(filename).getLines)
for(word<-line.split(" "))
wordCount(word)=if(wordCount.contains(word)) wordCount(word)+1 else 1
println(wordCount)
for((k,v)<-wordCount)
printf("word %s occurs %d times \n",k,v)
}
}
