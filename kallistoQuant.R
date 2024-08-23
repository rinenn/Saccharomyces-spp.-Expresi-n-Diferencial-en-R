#estabelecemos el wd
setwd = ("/Users/rafae/OneDrive/Documents/Carrera/ProgramaciónR/KallistoQuant")

#librerias
library(dplyr)

#leemos las tablas 
tab1 = read.table("Galaxy22-[KallistoQuant_SRR5137658].txt", header = TRUE, row.names = 1, sep = "\t", comment.char = "")

head(tab1)

tab2 = read.table("Galaxy16-[KallistoQuant_SRR5137659].txt", header = TRUE, row.names = 1, sep = "\t", comment.char = "")

tab3 = read.table("Galaxy24-[KallistoQuant_SRR5137660].txt", header = TRUE, row.names = 1, sep = "\t", comment.char = "")

tab4 = read.table("Galaxy18-[KallistoQuant_SRR5137661].txt", header = TRUE, row.names = 1, sep = "\t", comment.char = "")

tab5 = read.table("Galaxy20-[KallistoQuant_SRR5137662].txt", header = TRUE, row.names = 1, sep = "\t", comment.char = "")

tab6 = read.table("Galaxy26-[KallistoQuant_SRR5137663].txt", header = TRUE, row.names = 1, sep = "\t", comment.char = "")

#selección de la columna de interés
tab1_oTPM = tab1 %>% select(tpm)

tab1_oTPM

tab2_oTPM = tab2 %>% select(tpm)

tab3_oTPM = tab3 %>% select(tpm)

tab4_oTPM = tab4 %>% select(tpm)

tab5_oTPM = tab5 %>% select(tpm)

tab6_oTPM = tab6 %>% select(tpm)

#cbind
?cbind()

tabTPMs = cbind(tab1_oTPM, tab2_oTPM, tab3_oTPM, tab4_oTPM, tab5_oTPM, tab6_oTPM, deparse.level = 1)

head(tabTPMs)