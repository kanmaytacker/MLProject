corr<-function(directory,threshold=0)
{ 
  a<-1
  z<-vector()
  for(i in 1:332)
  {
    
    if(i<10)
    {
      di<-paste(directory,"/","00",i,".csv",sep="")
    }
    else if(i<100)
    {  
      di<-paste(directory,"/","0",i,".csv",sep="")
    }
    else
    {
      di<-paste(directory,"/",i,".csv",sep="")
    }
    
    tmp<-read.csv(di)
    tmp<-tmp[complete.cases(tmp),]
    if(nrow(tmp)>threshold)
     {
      z[a]<-cor(tmp[,2],tmp[,3])
    a<-a+1
    }
  }
  z
}
  