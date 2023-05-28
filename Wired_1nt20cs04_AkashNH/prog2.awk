BEGIN{

	total_size_ftp=0;
	total_size_tel=0;
	thput_size_ftp=0;
	thput_size_tel=0;

}
{
	if( $1=="r" && $4=="5" && $5=="tcp")
		total_size_ftp+=$6;
	
	if( $1=="r" && $4=="4" && $5=="tcp")
		total_size_tel+=$6;
}
END{
	thput_size_ftp=(total_size_ftp*8)/1000000;
	thput_size_tel=(total_size_tel*8)/1000000;
	print("%d",total_size_ftp)
	print("%d",total_size_tel)
	print("Throughput for FTP connection : ",thput_size_ftp);
	print("Throughput for TELNET connection : ",thput_size_tel);
}
