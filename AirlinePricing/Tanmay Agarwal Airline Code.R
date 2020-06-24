# ANALYSIS OF AIRLINE TICKET PRICING
# NAME: TANMAY AGARWAL
# EMAIL: tanmay151997@gmail.com 
# COLLEGE: R.V. COLLEGE OF ENGINEERING

# We will be analyzing the pricing of Premium Economy tickets relative 
# to regular Economy airline tickets.

# Reading the data set from the working directory

# First setting the working directory

setwd("C:/Users/Tanmay/Desktop/Data Science and Analytics and Programming in R/Week3 Day6/SIxAirlines")

# Reading the data using R command

airline.df<-read.csv(paste("SixAirlinesData.csv", sep = ""))

# Summarizing the data set

summary(airline.df)

# loading the psych package

library(psych)

# Loading some other packages like "car","gplots", "corrplot","lattice"

library(corrplot)
library(gplots)
library(lattice)


# Describing the data set to know the mean, meadian, standard deviation, etc.

describe(airline.df)

# Using the above command, we are able to find out various central tendency for each variable or collumn 
# separately, giving us the rough idea of all the variables to give us an outlook of the data set.
 

# To form subset of International and Domestic airlines

international<-airline.df[ which(airline.df$IsInternational==1),]

domestic<-airline.df[ which(airline.df$IsInternational==0),]

# To view the two subsets

international

domestic

# To attach the data set

attach(airline.df)

# To find the mean average price of premium economy seats in different airlines

premeco<-aggregate(PricePremium~Airline, data = airline.df, mean)

# To view the table of average price of premium ticket

premeco

# To visualize it graphically using boxplot

boxplot(PricePremium~Airline, data = airline.df, main="Prices of Premium tickets in various Airlines",
        xlab="PRICES", ylab="AIRLINES", horizontal= TRUE, col= c("Blue","Green","Yellow","Lightblue"))


# To visualize correlation matrices for the variables in the dataset

corrplot(corr = cor(airline.df[,c(3,8:13)], use = "complete.obs"), method = "ellipse")

# From the the above data visualization we can take two very important inferences
# They are:
# 1. Price Premium is highly correlated with the flight duration and Price Economy
# 2. Width Premium and Width Economy are highly correlated with Pitch Premium and Pitch Economy respectively.

# To study analyse further we will visualize them using scatter plots

# To study relation between Prices of Premium and Economy tickets

plot(x=airline.df$PriceEconomy,y=airline.df$PricePremium, main = "Relation between Prices of Premium
     and Economy class", xlab= "Price Of Premium tickets", ylab="Price Of Economy tickets", col="blue")


# To perform correlation test

cor.test(airline.df$PriceEconomy,airline.df$PricePremium)

# From the correlation test we can say that since, the p-value<0.05, therefore, it fails the null hypothesis and the correlation between the two variables is 0.9025311.
# The inference from this analyzation is that if the Prices of Economy tickets of an airlines is high then the prices of its premium tickets will also become higher

# To study the relation between Price Of premium class tickets and fight duaration

plot(x=airline.df$FlightDuration,y=airline.df$PricePremium, main="Relation between Price of premium tickets
     and Flight Duration", xlab="Flight duration", ylab="Premium Price",col= "magenta")

# To do the correlation test of the above two variables

cor.test(airline.df$FlightDuration,airline.df$PricePremium)


# To find the relation  between the price of the premium tickets and the Aircraft carrier

# To Draw boxplot between PRICE_PREMIUM and AIRCRAFT

boxplot(PricePremium~Aircraft, data = airline.df,
        main="Relation between Premium Price tickets and Aircraft",
        xlab="Price of Tickets(In US Dollars)",
        ylab="Aircraft", col= c("Blue","green","yellow"), horizontal= TRUE)
# The above graph shows that the price of premium tickets also depends on the AIrcraft carriers


# To construct boxplot between Price of Premium tickets and Route of Flights

boxplot(PricePremium~IsInternational, data = airline.df,
        main="Relation between PRice of Premium Tickets and The route of Airline",
        xlab="Price Of Premium Ticket(In US Dollars)",
        ylab="AIRCRAFT Route",horizontal= TRUE,col= c("Blue","Green"))

# The above boxplot shows that the price of the premium tickets also depends on the route of the airline that is International/Domestic

#To construct histogram showing relation between PricePremium and airlines segmented by the route of airlines



# To check the relation between the Price of Premium tickets and the No.of premium seats

plot(jitter(airline.df$SeatsPremium),jitter(airline.df$PricePremium),
     main = "Relationship between the total number of premium seats and the price of the premium tickets",
     xlab="Total seats",
     ylab="Price of the premium ticket",
     cex= 0.8, col= "green")

# To draw the best fit line

x1<-lm(PricePremium~SeatsPremium, data= airline.df)

abline(x1, col="blue")

# To do the correlation test between the total number of premium seats and the price of the premium tickets

cor.test(airline.df$SeatsPremium,airline.df$PricePremium)

# The inference we get from the correlation test is that:
# 1. They are weakly correlated to each other
# 2. Since, p<0.05 therefore, it fails the null hypothesis and the two variables are dependent

##Correlation test to find correlation between different variables
# Correlation matrix, covariance matrix and Corrgram

x<-airline.df[,c("FlightDuration","SeatsEconomy","SeatsPremium","PricePremium","PriceEconomy","PitchEconomy","PitchPremium","WidthEconomy","WidthPremium","PitchDifference","WidthDifference","SeatsTotal","PriceRelative","FractionPremiumSeats")]
y<-airline.df[,c("PricePremium","PriceRelative")]

cor(x,y)

cov(x,y)

corrgram(airline.df,order = TRUE,upper.panel = panel.pie,lower.panel = panel.shade,text.panel = panel.txt,main="Corrgram For Airline Pricing")

# To analyze the relationship between Price of the PricePremium, SeatsPremium, PriceEconomy, SeatsEconomy, PriceRelative, SeatsTotal,FractionPremiumSeats,PitchDifference and WidthDifference
# using scatterplot matrix and correlations plots

# Using correlation plots

corrplot(corr = cor(airline.df[,c(6,7,12:18)],use = "complete.obs"), method = "ellipse")

# To analyze the relationship between Price of Premium seats and No.of Premium seats.

# Using Scatterplot finding the relationship between the PricePremium and SeatsPremium

plot(airline.df$SeatsPremium,airline.df$PricePremium, main = "Relation between Price of premium ticket and total premium seats",
     xlab = "Seats Premium", ylab = "Price of Premium tickets",
     col="blue")
abline(lm(PricePremium~SeatsPremium, data = airline.df))

# So from all the analysis done above to get the relationship of Price Of Premium Tickets with various variables
# Now we will try to do some regression analysis using the Dependent variable and the Independent variables

# Dependent Variable = PricePremium
# Independent variables = Airline+Aircraft+FlightDuration+SeatsPremium+PriceEconomy+IsInternational

# Let us assume a value fit for our regression analysis model

fit<-lm(PricePremium~Airline+Aircraft+FlightDuration+SeatsPremium+PriceEconomy+IsInternational,
        data = airline.df)
summary(fit)
residuals(fit)

# Since we found that correlation with all the variables we have used do not have a good correlation 
# with the price of the premium tickets.
# We will construct another linear model with only those variables which we have analysed earlier
# showing better correlation with the PRice of the premium tickets

model2<-lm(PricePremium~FlightDuration+PriceEconomy+SeatsPremium+SeatsTotal, data = airline.df)

# To get the summary of the results

summary(model2)

# Confidence Interval for the population mean

confint(model2)

# Checking how fit was the regression model

fitted(model2)

# From the summary details of the linear model we made, we made some inferences given below:
#  1. The linear model for the Price of Premium tickets will be:
#  PricePremium = (70.06145*FlightDuration)+(1.02116*PriceEconomy)+(12.24167*SeatsPremium)+(-0.59658*SeatsTotal)-312.31275
#  2. The P-value is 2.2e-16<0.05 thus failing the null Hypothesis
#  3. The multiple R-squared: 0.8524 accounts for 85.24% variance in Price Of Premium Tickets.


# To Visualize the relation between Relative Price Of Tickets and The Pitch Differnce

scatterplot(airline.df$PitchDifference,airline.df$PriceRelative,main="Relation Between Pitch Differnce and Relative Price of tickets",xlab="Pitch Difference",ylab="Relative Price",pch=19)

# To run the correlation test for the above relationship between the two variables

cor.test(airline.df$PitchDifference,airline.df$PriceRelative)

# From the correlation test we have found that:
#  1.p-value<0.05, thus, it fails the null hypothesis that the two variables are independent
#  2.The correlation between the two variables is 0.479339.

# To visualize the relation between Width difference and the Reative Price of the tickets

scatterplot(airline.df$WidthDifference,airline.df$PriceRelative,
            main="Relation Betwen Width Differnce and Relative Price Of Tickets",
            xlab = "Width Difference",ylab = "Relative Price",
            cex=1.1,pch=19)

# To run the correlation test between Relative Price and the Width Differnce

cor.test(airline.df$WidthDifference,airline.df$PriceRelative)

# From the correlation test run , we generated the following inferences:
#  1. p-value<0.05, thus, fails the null hypothesis that the two variables are independent
#  2. The correlation coeffecient=0.4963931

# To visualise the relation between Relative Price Of tickets and the Flight Duration

scatterplot(airline.df$FlightDuration,airline.df$PriceRelative,
            main="Relation between Flight Duration and Relative Price Of Tickets",
            xlab = "Flight Duration",
            ylab="Relative Price Of Tickets",
            cex=1.1,pch=19)

# To run the correlation test between Relative Price Of the Tickets and the Flight Duaration

cor.test(airline.df$FlightDuration,airline.df$PriceRelative)

# From the analysis we generated the inference given below:
#  1. 0.01<p-value<0.05, thus fails the null hypothesis that the two variables are independent, but are quiet similar to each other or they have very less significant differnce in them.
#  2. The Correlation coeffecient is 0.1082247.

# To visualize the Relation between Relative Price Of tickets and and the Route of Airlines that is International/Domestic

scatterplot(airline.df$IsInternational,airline.df$PriceRelative,
            main="Relation between Flight Type and Relative Price Of Tickets",
            xlab = "IsInternational",
            ylab = "Relative Price Of tickets",
            cex = 1.1,pch = 19,
            col= c("Blue","Yellow"))

# To run the T-Test for the above relationship

t.test(PriceRelative~IsInternational,var.equal=TRUE)

# After running the T-Test to analyse the results, we generated the following inferences:
#  1. p-value<0.05, thus fails the null hypothesis that the two variables are independent and they have significant difference in there values
#  2.mean in group domestic=0.0847500 and mean in group International=0.5313033.

scatterplot(airline.df$Aircraft,airline.df$PriceRelative,main="Relation between Relative Price and Airline",
            xlab = "Airline",
            ylab = "Relative Price Of Tickets",
            cex = 1.1,pch = 19)

# To run the t-test between Relative price of the tickets and the Aircraft carrier to show that average Relative Price of Boeing is Higher than the average Relative Price Of Airbus.

t.test(PriceRelative~Aircraft,var.equal=TRUE)

# After running the T-Test for the, the following inferences can be drawn:
# 1. p-value<0.05, thus fails the null hypothesis.

## To run and test the linear regression model
# Dependent variable = PriceRelative
# Independent Variables = PitchDifference+WidthDifference+Aircraft+IsInternational

model3<-lm(PriceRelative~PitchDifference+WidthDifference+Aircraft+IsInternational
,data = airline.df)

#Summary 

summary(model3)

residuals(model3)

fitted(model3)

## model3:PriceRelative= b0 +b1*PitchDiffernece+b2*WidthDifference+b3*Aircraft+b4*IsInternational
## b0=-0.13614,b1=0.07583,b2=0.10862,b3=0.04576,b4=-0.09958
## Model: -0.13614+0.07583*PitchDiffernece+0.10862*WidthDifference+0.04576*Aircraft+-0.09958*IsInternational
