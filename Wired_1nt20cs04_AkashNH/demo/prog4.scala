abstract class Notification
case class SMS(mobile:String,msg:String) extends Notification
case class Email(emailAddr:String,subject:String,body:String) extends Notification
object temp {
	def showNotification(note:Notification): String={ note match {
		case Email(emailAddr,subject,_)=> s"You got an Email from $emailAddr, with subject: $subject"
		case SMS(number,message)=> s"You got an SMS from $number! message: $message"
		}
	}
	def main(args:Array[String]):Unit={
		val someSMS=SMS("9946317834","Did you submit assignement")
		val someEmail=Email("shobha@gmail.com","BDT LAB","Intro to Big Data, Spark and R")
		println(showNotification(someSMS))
		println(showNotification(someEmail))
	}
}
