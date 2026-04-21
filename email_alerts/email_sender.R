## Script to produce and send the email alerts to those signed up
## Schoodic Institute at Acadia National Park


#------------------------------------------------#
####           Packages Required              ####
#------------------------------------------------#
library(blastula)


#------------------------------------------------#
####         Create and send email            ####
#------------------------------------------------#

## Can run to see example of what the email will look like
# my_email_object <- render_email('outputs/emailtest.Rmd')
# print(my_email_object)

## Produce and send the email
smtp_send(render_email('email_alerts/email_material.Rmd'), 
          from = "klima@schoodicinstitute.org", 
          to = c("klima@schoodicinstitute.org",
                 "adeci@mcht.org",
                 "therrick@mcht.org",
                 "kgentalen@mcht.org",
                 "emarshall@mcht.org",
                 "tbauer@mcht.org",
                 "adevine@mcht.org",
                 "mjenness@mcht.org",
                 "jsattler@mcht.org",
                 "kwinslow@mcht.org"),
          subject = "Weekly early detection report", 
          credentials = creds_file("email_alerts/kmail")
)




