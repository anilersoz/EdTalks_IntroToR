install.packages("tidyverse")
library(tidyverse)

# bit.ly/3nqviB9
getwd()
gapminder <- read.csv("/Users/anilersoz/EdTalks/EdTalks/gapminder_data.csv")

#Exploring the data frame
str(gapminder)

dim(gapminder)
nrow(gapminder)
ncol(gapminder)

head(gapminder, n = 20)
tail(gapminder, n = 15)

colnames(gapminder)

#The dplyr package

install.packages('dplyr')
library("dplyr")

#select()
#filter()
#group_by()
#summarize()
#count() and n()
#mutate()

#~~ select() ####
image_read('1.png')

year_country_gdp <- select(gapminder, year, country, gdpPercap)
head(year_country_gdp)

#~ pipe operator ####
year_country_gdp <- gapminder %>% select(year,country,gdpPercap)

?select
gapminder %>% select(starts_with("c")) %>% head(6)
gapminder %>% select(matches(c("co", "li"))) %>% head(2)

#~~ filter() ####
#Sadece Avrupa kitasindaki ulkeleri veri setimizde gormek istersek
year_country_gdp_euro <- gapminder %>%
  filter(continent == "Europe") %>%
  select(year, country, gdpPercap)

    #Hem Turkiye hem Yunanistan'in yillara gore ulke nufusunu bulalim
###Answer####
colnames(gapminder)
tr_gr_pop <- gapminder %>% 
  filter(country == c("Turkey", "Greece")) %>% 
  select(country, year, pop)

    #Turkiyenin 1982 yili ve sonrasindaki gdpPercap'sini bulalim
###Answer####
tr_1982_gdp <- gapminder %>% 
  filter(year > 1981, country == "Turkey") %>% 
  select(country, year, gdpPercap)

#~~ group_by() and summarize() ####
image_read('2.png')
image_read('3.png')

#Kitalarin gdpPercap bulalim
gdp_bycontinents <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdp = mean(gdpPercap))

    #Yillara gore kitalarin gdp'sini bulalim
###Answer####
gdp_year_continents <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdp = mean(gdpPercap))

    # Ulkelerin ortalama yasam beklentilerini hesaplayalim ve en kucuk ve en buyuk degere
    # sahip olan ulkeleri bulalim
###Answer####
lifeExp_country <- gapminder %>% 
  group_by(country) %>% 
  summarize(mean_life_exp = mean(lifeExp)) %>% 
  filter(mean_life_exp == min(mean_life_exp) | mean_life_exp == max(mean_life_exp))

#~~ arrange()####
lifeExp_country <- gapminder %>% 
  group_by(country) %>% 
  summarize(mean_life_exp = mean(lifeExp))

lifeExp_country %>% 
  arrange(mean_life_exp) %>% head(1)

lifeExp_country %>% 
  arrange(desc(mean_life_exp)) %>% head(1)

    # Her bir kitanin yillara gore gdpPercap'sinin ve nufusunun  ortalamasini, standart sapma degerlerini bulalim
    #Ipucu mean(), sd(), summary fonksiyonu icine birden fazla degisken konabilir.
###Answer####

gdp_pop_bycontinents_byyear <- gapminder %>%
  group_by(continent,year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop))

#~~ mutate() ####
#gdpPercap veri setinde var. GSYIH sutunu yaratalim

gdp_pop_bycontinents_byyear <- gapminder %>%
  mutate(gdp_billion = gdpPercap*pop/10^9) %>% #her kitanin yillara gore gdp'sinin,
  #nufusunun ve kisi basina dusen gdp'sinin ortalamasini ve standart sapmasini bulalim
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdp_billion = mean(gdp_billion),
            sd_gdp_billion = sd(gdp_billion))


# Multiple linear regression
mtcars
?mtcars
data <- mtcars %>% select(mpg, disp, hp, wt)
head(data)
str(data)

model <- lm(mpg ~ disp + hp + wt, data = data) #tilde
summary(model)