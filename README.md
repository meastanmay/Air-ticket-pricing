# Airlines Pricing Analysis

File name: SixAirlinesData.csv

# Introduction: 
This analysis of Six Airlines’ namely (Air France, British Airways, Jet Airlines, Singapore Airlines, Delta and Virgin), there services, the cost or pricing and other details like the Aircraft carrier, Duration of the journey, months in which they provide services, International/Domestic, Number of seats of Economy and Premium class, etc. The analysis was done to go through all the factors on which the pricing of the Airline tickets depend on. The data was gathered from 462 working airlines giving their services in different countries.

## The analysis and inferences from the data set are as follows:
- The average price of the premium tickets of each airlines are different and the maximum average cost of the premium tickets is in Air France(3065.2162 USD)
- Price of premium class tickets are highly correlated to the price of economy class with the cor(0.9025311)
- Price of premium tickets also depends on Flight duration with cor(0.6518918).
- The average price of premium tickets in Airbus aircraft is more as compared to Boeing aircraft.
- Price of Premium tickets of International flights is quiet large as compared to the domestic airlines route of journey.
- Price of Premium tickets is more if the number premium seats get increased.
- Relative Price of tickets is positively correlated to Pitch difference with cor(0.4793339).
- Relative price is positively correlated to Relative Price of tickets with cor(0.4963931).
- Relative price of tickets is positively correlated to flight duration with cor(0.1082247).
- Relative Price in International flights is higher than domestic flights with many outliers.
- Relative Price in Boeing Aircraft is higher than the relative price of Airbus aircraft and has many outliers.

# Observations From T-Tests
- We can say that Relative price of International flight tickets of premium class and Economy class is higher than that of Domestic flights because the p-value is less than 0.05, which fails the null hypothesis that the two variables are independent.
- Relative Price of tickets of Boeing aircraft is higher than relative price of Airbus ticket because the p-value is less than 0.05, which fails the null hypothesis that the two variables are independent. 


# Multiple Regression Model 1
- The first multiple regression model has Price of premium tickets as the Dependent variable.
- The Independent variables are Flight Duration, Price of Economy seat Tickets, Number of Premium seats in the aircraft, Service of the airline (International/domestic), Aircraft used and the total number of seats in the aircraft.
- The Multiple R-square value is 0.8861 which is high, which tells that our model is good.
- The p-value is less than 0.05, which fails the null hypothesis that the variables are independent.
- *Bo = -806.4720, b1=(663.11393/609.7195/573.61493/313.32728/1010.03918), b2=55.65229, b3=-0.84176, b4=1016159, b5=175.35921, b6=2.37203 
Where, if Airline British= 663.11393, Airline Delta=609.7195, Airline Jet=573.61493, Airline Singapore=313.32728, Airline Virgin=1010.03918*
- *Model: PriceEconomy = 
-806.4720 + ((663.11393/609.7195/573.61493/313.32728/1010.03918) x Airline)
+ (55.65229 x FlightDuration) + (-0.84176 x SeatsPremium) + (1.16159 x PriceEconomy) + (175.35921 x IsInternational) + (2.37203 x Aircraft)*
 


# Multiple Regression Model 2
- The second multiple regression model has Relative Price of tickets as the dependent variable.
- The Independent variables in the model are Pitch difference, Width difference, Aircraft, IsInternational.
- The R-square value is 0.2747, which tells that the model is average model.
- The p-value is less than 0.05, thus fails the null hypothesis that the variables are independent of each other.
- *Bo= -0.13614, b1=0.07583, b2=0.10862, b3=0.04576, b4= -0.9958
Model: -0.13614 + (0.07583 x PitchDifference) + (0.10862 x WidthDifference) + (0.04576 x Aircraft) + (-0.9958 x IsInternational)*
      

   






