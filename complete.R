complete<-function(directory,id=1:332)
{ 
  a<-1
  z<-data.frame(id=numeric(0),nobs=(numeric(0)))
  for(i in id)
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
    z[a,1]<-i
    z[a,2]<-nrow(tmp)
    a<-a+1
  }
  z
}