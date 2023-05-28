set ns [new Simulator]


set tf [open prog4.tr w]
$ns trace-all $tf

set nf [open prog4.nam w]
$ns namtrace-all $nf 

set cwnd [open win4.tr w]

$ns color 1 Blue 
$ns color 2 Red 

$ns rtproto DV 

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

$ns duplex-link $n0 $n1 0.3Mb 10ms DropTail 
$ns duplex-link $n0 $n2 0.3Mb 10ms DropTail 
$ns duplex-link $n1 $n2 0.3Mb 10ms DropTail 
$ns duplex-link $n1 $n4 0.3Mb 10ms DropTail 
$ns duplex-link $n2 $n3 0.3Mb 10ms DropTail 
$ns duplex-link $n3 $n4 0.3Mb 10ms DropTail 
$ns duplex-link $n4 $n5 0.3Mb 10ms DropTail 
$ns duplex-link $n3 $n5 0.3Mb 10ms DropTail 

set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0 
set tcpsink [new Agent/TCPSink]
$ns attach-agent $n5 $tcpsink 
$ns connect $tcp0 $tcpsink 

$tcp0 set fid_ 1

set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0 
$ns rtmodel-at 1.0 down $n2 $n3 
$ns rtmodel-at 3.0 up $n2 $n3 

$ns at 0.1 "$ftp0 start"
$ns at 12.0 "finish"


proc plotWindow {tcpSource file} {
	global ns 
	set time 0.01 
	set now [$ns now]
	set cwnd [$tcpSource set cwnd_]
	puts $file "$now $cwnd"
	$ns at [expr $now+$time] "plotWindow $tcpSource $file"
	}

$ns at 1.0 "plotWindow $tcp0 $cwnd"

proc finish {} {
	global ns tf nf cwnd 
	$ns flush-trace
	close $tf 
	close $nf 
	exec nam prog4.nam &
	exec xgraph win4.tr &
	exit 0
}

$ns run 

