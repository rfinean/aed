#
# srtm.R, 13 Sep 14


get_contours=function(x)
{
x1 = NA
x2 = NA
for(i in 1:length(x))
   {
   x1 = c(x1, x[[i]]$x, NA)
   x2 = c(x2, x[[i]]$y, NA)
   }
data.frame(x = x1, y = x2)
}


mk_contour=function(file_str, sea_inc=5)
{
# S13E096.hgt
is_n=(substr(file_str, 1, 1) == "N")
ns_val=as.numeric(substr(file_str, 2, 3))
is_e=(substr(file_str, 4, 4) == "E")*2-1
we_val=as.numeric(substr(file_str, 5, 7))

h=read.csv(paste0("climate-hack/csv-eurasia/", file_str), head=FALSE)

print(file_str)

colnames(h)=c("x", "y", "height")

h[h == -32768] = NA

htab=matrix(nrow=1201, ncol=1201, data=h$height)
htab=cbind(999, htab, 999)
htab=rbind(999, htab, 999)

# contour(htab)

hcon=contourLines(z=htab, levels=sea_inc)

# plot.contourLines(hcon)

conlist=get_contours(hcon)

conlist$x=round(conlist$x+is_e*we_val, 7)
conlist$y=round(ns_val+1-conlist$y, 7)

write.csv(conlist, paste0("climate-hack/con-eurasia/", file_str, ".con"), row.names=FALSE)

# blah()

return(NULL)
}

csv_files=list.files("climate-hack/csv-eurasia/", pattern="N*.csv")

# t=sapply(csv_files, function(X) mk_contour(X, 2))
t=sapply(csv_files, function(X) mk_contour(X, 1.0))

