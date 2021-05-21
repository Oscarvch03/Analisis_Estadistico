# Reducción de los Datasets

datos_2019_2 = read.csv(file.path("/home/oscarvch03/Desktop/Proyecto_Analisis_Estadistico", "Saber_11__2019-2.csv"), sep = ";")
datos_2019_2_clc = na.omit(data.frame(filter(datos_2019_2, ESTU_DEPTO_RESIDE != "")))
head(datos_2019_2_clc)

datos_2020_2 = read.csv(file.path("/home/oscarvch03/Desktop/Proyecto_Analisis_Estadistico", "Saber_11__2020-2.csv"), sep = ";")
datos_2020_2_clc = na.omit(data.frame(filter(datos_2020_2, ESTU_DEPTO_RESIDE != "")))
head(datos_2020_2_clc)

n = 20000
sample19 = sample(1:nrow(datos_2019_2_clc), n, replace = F)
sample20 = sample(1:nrow(datos_2020_2_clc), n, replace = F)

cov1 = sample(c("No-Covid"), n, replace = T)
cov2 = sample(c("Si-Covid"), n, replace = T)
COVID = c(cov1, cov2)

muestra19 = data.frame(datos_2019_2_clc[sample19, ])
muestra20 = data.frame(datos_2020_2_clc[sample20, ])

join = merge(muestra19, muestra20, by = names(muestra19), all = TRUE)
out = data.frame(join, COVID)
write.csv(out, "/home/oscarvch03/Desktop/Proyecto_Analisis_Estadistico/Saber11_20_1920_2.csv")
