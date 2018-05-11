#Day 2 - conditional statements, functions and ggplot

#Conditional statements

number <-37
if (number > 100) {   #if condition is true
  print("greater than 100") #what does it do/perform this function
}else{                    #if condition is false
  print("less than 100")  #alternative action/perform this function
}
print("finished checking") #useful thing to add 

#choice diagrams
#comparison operators:

#greater than >
#less than <
#equal to ==
# <- synonymous to =
# not equal to !=
# greater than equal to >=
# lesser than equal to <=


number <-150
if (number > 100) {   #if condition is true
  print("greater than 100") #what does it do/perform this function
}

# more than one test within a conditional statement

number <- -3
if (number > 0){
  print(1)
} else if (number< 0) {
  print(-1)
}else {
  print(0)
}

# combine tests
number1 <- -15
number2 <- -40

if(number1 >=0 & number2 >=0){ #& can be used to combine two functions
  print("both numbers are positive") 
    }else {
      print("atleast one is negative")
    }
  
# '0r'

if (number1 >=0 | number2 >=0){
print ("atleast one number is positive")
} else {
  print ("both numbers are negative")
  } #vertical bar is the or symbol

#creating and using functions

fahr_to_kelvin <- function(temp){   # function has one arugument that is temp, the foll part is body of argument
  kelvin <- ((temp - 32) * (5/9)) + 273.15
  return(kelvin)
}

fahr_to_kelvin(32) #freezing point
fahr_to_kelvin(212) #boiling point

kelvin_to_celsius <- function(temp){
  celsius <- temp - 273.15
  return (celsius)
}
kelvin_to_celsius(0)

celsius
#variable scope 

kelvin_to_celsius <- function(temp){
  celsius <- temp - 273.15
  (celsius)
}
kelvin_to_celsius(0)


#mixing and match

fahr_to_celsius <- function (temp){
  temp_kelvin <- fahr_to_kelvin(temp)
  temp_celsius <- kelvin_to_celsius(temp_kelvin)
  return (temp_celsius)
}

fahr_to_celsius(32)

#nesting function

kelvin_to_celsius(fahr_to_kelvin(32))

celsius_to_fahr <- function (temp) {
  fahr <- (temp * (9/5))+ 32
  return (fahr)
  }

celsius_to_fahr(32)

#making reproducible graphics

library(ggplot2) #good idea to put this in the top

# read in some data

gap <- read.csv(file = "data/gapminder-FiveYearData(1).csv")
head(gap)
str(gap)

plot (x= gap$gdpPercap, y= gap$lifeExp)

#ggplot image

ggplot(data = gap, aes(x=gdpPercap, y=lifeExp)) + #aes specifies which columns we want the ggplot to focus on
  geom_point() #geom---what kindo f plot do we want

plot(x= gap$year, y= gap$lifeExp)

ggplot(data = gap, aes(x=year, y=lifeExp))+
geom_point()


head(gap)

ggplot(data = gap, aes(x=year, y=lifeExp, by = country, 
                       color = continent))+
  geom_line()

ggplot(data = gap, aes(x=year, y=lifeExp, by = continent, 
                       color = continent))+
  geom_line()

ggplot(data = gap, aes(x=year, y=lifeExp, by = country, 
                       color = continent))+
  geom_line()+
  geom_point()

ggplot(data = gap, aes(x=year, y=lifeExp, by = country, 
                       color = continent))+
  geom_point()+
  geom_line()

ggplot(data = gap, aes(x=year, y=lifeExp, by = country))+
  geom_line(aes(color = continent))+
  geom_point()

ggplot(data = gap, aes(x=year, y=lifeExp, by = country))+
  geom_line(aes(color = continent))+
  geom_point(color="blue")

ggplot(data = gap, aes(x=gdpPercap, y=lifeExp)) + #aes specifies which columns we want the ggplot to focus on
  geom_point() #geom---what kindo f plot do we want

plot(x= gap$year, y= gap$lifeExp)

ggplot(data = gap, aes(x=year, y=lifeExp))+
  geom_point()

ggplot(data = gap, aes(x=gdpPercap, y=lifeExp)) + #aes specifies which columns we want the ggplot to focus on
  scale_x_log10()+
geom_point(alpha = 0.5) #alpha makes points transparent

ggplot(data = gap, aes(x=gdpPercap, y=lifeExp)) + #aes specifies which columns we want the ggplot to focus on
  scale_x_log10()+
  geom_point(alpha = 0.5)+
  geom_smooth(method = "lm", size = 4) #line-regression? #size to make it thicker


ggplot(data = gap, aes(x=gdpPercap, y=lifeExp)) + #aes specifies which columns we want the ggplot to focus on
  scale_x_log10()+
  geom_point(alpha = 0.5)+
  geom_smooth(method = "lm")+ #+adds a layer
  theme_bw()+
  ggtitle("Effects of percapita GDP on life expectancy") +
  xlab("GDP per capita ($)")+
  ylab("life expectancy (years)")

ggsave(file = "results/life_expectancy.pdf") #ggsave for reproducibility
?ggsave

#faceting #useful when you have a lot of data and to show diff aspects of it

ggplot(data = gap, aes (x=gdpPercap, y=lifeExp, color = continent))+
  geom_point()+
  scale_x_log10()+
  geom_smooth(method="lm")+
  facet_wrap(~year)