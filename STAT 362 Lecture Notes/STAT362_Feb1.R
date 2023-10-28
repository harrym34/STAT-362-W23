# more on dplyr

library(tidyverse)
library(nycflights13)

# Last class, talked about: arrange, filter,


#
# select() - to select specific columns
#

colnames(flights)
select(flights, year, month, day, dep_time)

# suppose you want to select cols with names containing delay (arr and dep)
select(flights, contains("delay"))

# Can also do
select(flights, contains("a"))
select(flights, starts_with("a"))
select(flights, ends_with("e"))

# Not case sensitive, unless you make it
colnames(select(flights, contains("TIME")))
# like
colnames(select(flights, contains("TIME"), ignore.case = FALSE))


#
# grep() - like contains
#

some_names <- c("ab", "bc", "cd")
# Will return the index that "b" is in (1 and 2)
grep("b", some_names)

# Will give cols 6 and 9
grep("delay", colnames(flights))
# Could do it this way but then you have to manually look to get the numbers
flights[, c(6, 9)]


#
# mutate() - to add (a) new column(s)
#

# year:day will select all the columns between year and day
flights_small <- select(flights, year:day, arr_delay,
                        dep_delay, distance, air_time)

# Create two additional columns:
  # "gain" = arr_delay - dep_delay
  # "speed" = distance / air_time * 60
mutate(flights_small, gain = arr_delay - dep_delay)
View(mutate(flights_small, speed = distance / air_time * 60))

# transmute() is similar, but will only give you the new columns,
# not added on the the base dataset


#
# summarize() - to create a summary of statistics
#

flights$dep_time
unique(sort(flights$dep_time))

# change from this format to minutes since midnight
# e.g. 100 (1 AM), we want 60, or 205 (2:05 AM) we want 125
# to compute, for instance 7:34 - 7 * 60 + 34
734 %/% 100 * 60 + 734 %% 100

815 %/% 100 * 60 + 815 %% 100

# There is an exception - manually override this
2400 %/% 100 * 60 + 2400 %% 100


flights_time <- select(flights, dep_time, mutate(flights, dep_time_minutes 
                       = dep_time %/% 100 * 60 + dep_time %% 100))

time_to_minutes <- function(time) {
  if (time != 2400) {
    return(time %/% 100 * 60 %% 100)
  }
  else {
    return(0)
  }
  
}

time_to_minutes(15)
time_to_minutes(2400)
time_to_minutes(400)
View(mutate(flights_time, dep_time, minutes = time_to_minutes(dep_delay),
            arr_time_minutes = time_to_minutes(arr_delay)))
