# I. Duomenų nuskaitymas

library(data.table)
df<-fread("https://raw.githubusercontent.com/vilnius/gyventojai/master/registered_people_n_streets.csv", encoding = "UTF-8")

# II. Duomenų redagavimas

library(dplyr, warn.conflicts = FALSE)

# df<-dataset

df<-mutate(df, AMZIUS=2022-GIMIMO_METAI)

k1<-group_by(df, SENIUNIJA, GATVE)
viso<-summarise(k1, KIEKIS=n(), VIDURKIS=mean(AMZIUS))

viso<-arrange(viso, -VIDURKIS)

# III. Duomenų vizualizavimas

# d<-dataset
d<-viso

k1<-df$AMZIUS
l1<-df$LYTIS

boxplot(k1~l1,main = "Gyventojų amžius",
        xlab = "Amžius",
        col = "orange",
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)
