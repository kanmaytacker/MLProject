pollutantmean<-function(directory,pollutant,id=1:332)
{
  a<-0
  s<-0
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
    a<-a+nrow(tmp)
    if(pollutant=="sulfate")
    {
      s<-s+sum(tmp[,2])
      
    }
    else if(pollutant=="nitrate")
    {
      s<-s+sum(tmp[,3])
    }
    }

  m<-round(s/a,digits=3)
  m
}