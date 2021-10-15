# Innovative visualiztion on COVID-19 data
Data obtained from [Our world in data's repositories](https://github.com/owid/covid-19-data/tree/master/public/data). Download date: 11/08/2021

# TODO
[link](https://ourworldindata.org/covid-stringency-index)

Update the code into an R markdown, plot different values to have a general overview

Continue with the exploratory stadistics

check if there are correlations between variables

Check minimum date that every country started reporting

Do some type of agregation (maybe weekly, monthly, to see), also check how it will be done. Will it include the boundries? will it keep the median? the std? Another type of granularity is to have some points with a distance of time (for example, 5 days aggregation but only every 2 weeks).

Maybe do some clustering to check wich countries are close to one another. Maybe not, with biplots you can get the same data

Check the greenacre pdf as a first reference. In the book there are snippets of code to recreate the differents plots that are present in the book.

Maybe have a basic representation just showing the variables selected and the countries. At first. With biplot you can see if variables are correlated or not (and in what directions). Then we can add the time series into the plot.

One possible thing that can happen is that the correlation between the variables can change from one time to another. In that case we have to ask ourselves, can we compare the situation in one time with another one?

Another thing to do, maybe not plot the countries, but just the way the biplot changes over time, to see the fluctuations of the correlations.

If we have any ideas, we can tackle them.
