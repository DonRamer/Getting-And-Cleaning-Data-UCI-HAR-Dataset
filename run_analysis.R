########## PASO 0 ##########

# Librerias

library(dplyr)

# Obtención de datos en R

# Datos train

X_train   <- read.table("C:/Users/MXI02003837A/Desktop/Material Data Science/Quizz 4 R Cleaning Data/Q4/UCI HAR Dataset/train/X_train.txt") 
y_train   <- read.table("C:/Users/MXI02003837A/Desktop/Material Data Science/Quizz 4 R Cleaning Data/Q4/UCI HAR Dataset/train/y_train.txt") 
sub_train <- read.table("C:/Users/MXI02003837A/Desktop/Material Data Science/Quizz 4 R Cleaning Data/Q4/UCI HAR Dataset/train/subject_train.txt") 

# Datos test

X_test   <- read.table("C:/Users/MXI02003837A/Desktop/Material Data Science/Quizz 4 R Cleaning Data/Q4/UCI HAR Dataset/test/X_test.txt") 
y_test   <- read.table("C:/Users/MXI02003837A/Desktop/Material Data Science/Quizz 4 R Cleaning Data/Q4/UCI HAR Dataset/test/y_test.txt") 
sub_test <- read.table("C:/Users/MXI02003837A/Desktop/Material Data Science/Quizz 4 R Cleaning Data/Q4/UCI HAR Dataset/test/subject_test.txt") 

########## PASO 1 (Merges the training and the test sets to create one data set) ########

# Unión de datos 

x_data  <- bind_rows(X_train,X_test)
y_label <- bind_rows(y_train,y_test)
subject <- bind_rows(sub_train,sub_test)

# Borrar datos que ya no se van a utilizar
rm(X_test)
rm(X_train)
rm(y_test)
rm(y_train)
rm(sub_test)
rm(sub_train)

########## PASO 2 (Extracts only the measurements on the mean and standard deviation for each measurement) ########

# Obtener datos feature

features <- read.table("C:/Users/MXI02003837A/Desktop/Material Data Science/Quizz 4 R Cleaning Data/Q4/UCI HAR Dataset/features.txt")

# Extraer datos que contengan media o varianza

features_data <- grep("mean\\(\\)|std\\(\\)", features[,2])

# Obtener conjuntos con media o varianza

data_mean_std <- x_data[,features_data]

# Extraer y dar nombres adecuados a las columnasde datos feature

var <- features[features_data,]

names(var) <- c("ID", "Variable")

######### PASO 4 (Appropriately labels the data set with descriptive variable names) ##########

var <- var %>% 
mutate(Variable = gsub("-mean\\(\\)","_mean", Variable), 
Variable = gsub("-std\\(\\)","_std", Variable), 
Variable = gsub("-","_", Variable), 
Variable = gsub("^t","Time_", Variable), 
Variable = gsub("^f","Frequency_", Variable), 
Variable = gsub("BodyBody","Body", Variable)) 
rm(var)

# Nombre columnas 
names(data_mean_std) <- var[,2] 

########## PASO 3 (Uses descriptive activity names to name the activities in the data set) #########

# obtener los datos de "activity"

activity_labels <- read.table("C:/Users/MXI02003837A/Desktop/Material Data Science/Quizz 4 R Cleaning Data/Q4/UCI HAR Dataset/activity_labels.txt") 
 
# Renombrar los titulos de las columnas

names(activity_labels) <- c("ID", "Activity") 
names(y_label)[1] <- "ID" 
names(subject)[1] <- "Subject_Id" 
 

# Reemplzar con el nombre de las actividades

Activity <- y_label %>% 
full_join(activity_labels, by = "ID") %>% 
select(Activity) 
 
# Unión datos activity y records

All_data <- bind_cols(subject,Activity,data_mean_std) 

  
########## PASO 5 (From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject) #########

tidy_data <- All_data %>% 
group_by(Subject_Id, Activity) %>% 
summarise_each(funs(mean)) 

#Importar
write.table(tidy_data, "C:/Users/MXI02003837A/Desktop/Material Data Science/Quizz 4 R Cleaning Data/tidy_data.txt", row.name = FALSE, sep="\t")
