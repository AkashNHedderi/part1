package com.nmit.Sparks.tweetmining 
import org.apache.spark.{SparkContext,SparkConf}
import org.apache.spark.rdd._
object tweetmining {
	val conf=new SparkConf().setAppName("User Mining").setMaster("local[*]")
	val sc=new SparkContext(conf)
	def main(args:Array[String]){ 
		if(args.length!=1){
			System.exit(1)
		} 
		val pathToFile=args(0)
		val tweets=sc.textFile(pathToFile).mapPartitions(TweetUtils.parseFromJson(_))
		val tweetsByUser=tweets.map(x=>(x.user,x)).groupByKey()
		val numTweetsByUser=tweetsByUser.map(x=>(x._1,x._2.size))
		val sortedUserNumByTweets=numTweetsByUser.sortBy(_._2,ascending=false)
		sortedUserNumByTweets.take(10).foreach(println)
		val selectedTweets=sortedUserNumByTweets.take(10)
	}
}
import com.google.gson._
object TweetUtils {
	case class Tweets(id:String,user:String,userName:String,
	text:String,place:String,country:String,lang:String)
	def parseFromJson(lines:Iterator[String]):Iterator[Tweets]={
		val gson=new Gson
		lines.map(line=>gson.fromJson(line,classOf[Tweets]))
	}
} 