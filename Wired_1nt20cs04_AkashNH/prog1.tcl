set ns [new Simulator]

set tf [open prog1.tr w]
$ns trace-all $tf

set nf [open prog1.nam w]
$ns namtrace-all $nf

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$ns duplex-link $n0 $n2 2Mb 2ms DropTail
$ns duplex-link $n1 $n2 2Mb 2ms DropTail
$ns duplex-link $n2 $n3 0.4Mb 10ms DropTail
#$ns queue-limit $n0 $n1 5

set udp0 [new Agent/UDP]
$ns attach-agent $n1 $udp0
set null0 [new Agent/Null]
$ns attach-agent $n3 $null0
$ns connect $udp0 $null0
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp0
$ns at 1.1 "$cbr1 start"

set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0
set tcp1 [new Agent/TCPSink]
$ns attach-agent $n3 $tcp1
$ns connect $tcp0 $tcp1 
set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ns at 0.1 "$ftp0 start"

$ns at 10.0 "finish"

proc finish {} {
	global ns tf nf
	$ns flush-trace
	close $tf
	close $nf 
	puts "Running nam in backround....."
	exec nam prog1.nam &
	exit 0
}

$ns run 

















