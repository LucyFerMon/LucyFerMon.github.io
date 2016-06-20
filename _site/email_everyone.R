# # In order to run this you'll need to
# a) create a credentials yaml file in the following format
# email: youremail@gmail.com
# password: yourpassword
# b) go here and enable access for less secure apps:
# https://www.google.com/settings/security/lesssecureapps

library(mailR)
library(dplyr)
library(yaml)
library(gsheet)

# Read in password from private file
credentials <- yaml.load_file('credentials.yaml')

# Read in all the addresses from goole drive
url <- paste0('https://docs.google.com/spreadsheets/d/',
              '1m1FJynnXdqTjq1qi3MoCq0gygWSbhuupEg58Jd',
              'CI7fo/edit?usp=sharing')
people <- suppressMessages(gsheet2tbl(url))

# Loop through each person, emailing once every 10 seconds
for (i in 1:nrow(people)){
  person <- people$Nome[i]
  email <- people$Email[i]
  if(nchar(email) > 3){
    message(paste0(
      'Sending an email to ',
      person, ' at ',
      email))
    subject <- 'Próximas aulas de introdução a R no CISM'
    content <- 
      paste0('\n\n',
             person, ',\n\n',
             'Estamos a enviar este email para você porque ',
             'assinou ao primeiro módulo (de 5) da ',
             'introdução a R para principiantes no Cism.\n\n',
             
             'Aqui fica a agenda das próximas aulas de ',
             'introdução ao R no CISM: http://cismr.com/calendario/. ',
             'Por favor, estejem cientes de que os dias e as horas ',
             'podem mudar; si há alterações, vamos atualizar na web.\n\n',
             'No final dos cinco módulos (29 de junho), haverá um segundo ',
             'inquérito que sera para medir o nivel dos ', 
             'conhecimentos adquiridos.\n\n',
             
             'O curso de nível intermediário (para os graduados ',
             'destes 5 módulos) terá lugar em setembro a volta a ',
             'Manhiça de Joe Brew e Lucía Fernández.\n\n',
             'Cordiais saudaçoes,\n\n',
             'Joe Brew e Lucía Fernández')
    
    send.mail(from = "joebrew@gmail.com",
              to = email,
              cc = c("joe.brew@isglobal.org", 
                     'lucia.fernandez@isglobal.org'),
              subject = subject,
              body = content,
              smtp = list(host.name = "smtp.gmail.com", 
                          port = 465, 
                          user.name=credentials$email, 
                          passwd=credentials$password, 
                          ssl=TRUE,
                          tls = FALSE),
              authenticate = TRUE,
              send = TRUE)
  }
  # Sleep 10 seconds
  Sys.sleep(10)
}

