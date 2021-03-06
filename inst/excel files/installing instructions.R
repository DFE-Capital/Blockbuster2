# This script is intended to be passed to those who wish to run the blockbuster model on their own computer using the excel front end.

# It will set the DfE proxy and install the blockbuster2 package. The library containing blockbuster2 will have a folder "excel files" that will contain
# "Excel input.xlsm".  Copy this file into a folder and run it from there, after checking it is pointing to all the correct folders.

# packages required: httr and devtools
# NOTE: 64 bit Java will need to be installed - this may or may not appear in
# the software center so a service request may be necessary
# NOTE: RTools may or may not be necessary - if needed it may or may not be in
# the software center so a service request may be necessary

# define function that creates a pop-up window for log-in credentials
library(tcltk)
getLoginDetails <- function(){
  ## Based on code by Barry Rowlingson
  ## http://r.789695.n4.nabble.com/tkentry-that-exits-after-RETURN-tt854721.html#none
  tt <- tktoplevel()
  tkwm.title(tt, "Get login details")
  Name <- tclVar("Login ID")
  Password <- tclVar("Password")
  entry.Name <- tkentry(tt,width="20", textvariable=Name)
  entry.Password <- tkentry(tt, width="20", show="*",
                            textvariable=Password)
  tkgrid(tklabel(tt, text="Please enter your usual login details."))
  tkgrid(entry.Name)
  tkgrid(entry.Password)

  OnOK <- function()
  {
    tkdestroy(tt)
  }
  OK.but <-tkbutton(tt,text=" OK ", command=OnOK)
  tkbind(entry.Password, "<Return>", OnOK)
  tkgrid(OK.but)
  tkfocus(tt)
  tkwait.window(tt)

  invisible(c(loginID=tclvalue(Name), password=tclvalue(Password)))
}

# ask for proxy credentials
credentials <- getLoginDetails()

# set proxy
library(httr)
set_config(
  use_proxy(
    url = paste0("http://ad\\", credentials[1], ":", credentials[2],
                 "@192.168.2.40:8080"), port = 8080))

# remove credentials object
rm(credentials)

# install blockbuster2
devtools::install_github("DFE-Capital/blockbuster-2")

# install dfeR for the DfE word document template
devtools::install_github("dfe-analytical-services/dfeR")

# note that by loading the package, the excel sheet is automatically set to the
# correct folder locations

