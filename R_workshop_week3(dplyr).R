library(nycflights13)
library(dplyr)

########################################################
#   filter 
########################################################
q.1 = filter(flights,dep_delay >120 | dep_delay == 120)
q.2 = filter(flights,dest == "IAH" | dest == "HOU")
q.3 = filter(flights,carrier == "UA" | carrier == "AA" | carrier =="DL")
q.4 = filter(flights,month == 6 | month == 7 | month == 8)
q.5 = filter(flights,arr_delay > 120 & dep_delay <= 0)
q.6 = filter(flights,dep_delay >=60 & dep_delay-arr_delay > 30 )
q.7 = filter(flights, dep_time >= 1800 & dep_time <= 2400)

?between()
q.7.1 = filter(flights,between(dep_time,1800,2400))

summary(filter(flights,is.na(dep_time)))
#########################################################
#   arrange 
#########################################################
a.q.1 = arrange(df, desc(is.na(x)))
a.q.2.1 = arrange(flights,desc(dep_delay))
a.q.2.2 = arrange(flights,dep_delay)

a.q.3 = arrange(flights,ifelse(arr_time - dep_time < 0,(arr_time+2400) - dep_time
                               ,arr_time - dep_time))
a.q.4 = arrange(flights,distance)
a.q.4.1 = arrange(flights,desc(distance))

#########################################################
# select 
#########################################################
s.q.1 = select(flights,dep_time,dep_delay,arr_time,arr_delay)
s.q.2 = select(flights,dep_time,dep_time)
?one_of()
vars <- c("year","month","day","dep_time","dep_delay","arr_delay")
one_of(vars)
s.q.4 = select(flights, contains("TIME"))
s.q.4.1 = select(flights, contains("TIME", ignore.case = FALSE))
#########################################################
# mutate
#########################################################
m.q.1 = transmute(flights,new_dep_time = ifelse(dep_time < 100,2400 + dep_time,dep_time),
               new_sched_arr_time = ifelse(sched_arr_time < 100,2400 + sched_arr_time,
                                            sched_arr_time))
# m.q.2 See before section


