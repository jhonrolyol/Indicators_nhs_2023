
/*==================================================================================================

    Construction of Socioeconomic Indicators for the Development of Theses and Research

           .--.     
          |o_o |      "This file is to automate the download of the database"
          |:_/ |                         
         //   \ \               NISI - MICRODATA - DATABASE - NHS 2023
        (|     | )                  
        /'\_   _/`\        
       \___)=(___/
                       
                                        Jhon R. Ordoñez
                                    (rolyordonezleon@gmail.com)
                                                                                         ><(((º>
==================================================================================================*/





{ // Outline
    * 1.- Clean the Work Environment
    * 2.- Set Working Directory
        ** 2.1.- root
        ** 2.2.- cap !mkdir
        ** 2.3.- global
    * 3.- Downloading the database ENAHO - 2023
        * 3.1.- At the level of individuals
        * 3.2.- At the household level
}





{ // 1.- Clean the Work Environment
    cls
    clear all
    set more off
    capture log close
}



    


{ // 2.- Set Working Directory
    
    {   // 2.1.- root
        global root "..."
        cd          "$root"
    }

    {   // 2.2.- cap !mkdir
        cap !mkdir "1.slides"
        cap !mkdir "2.dofiles"
        cap !mkdir "3.raw_data"
        cap !mkdir "4.documentation"
            cap !mkdir "4.documentation/4.1.notes"
            cap !mkdir "4.documentation/4.2.references"
            cap !mkdir "4.documentation/4.3.protocols"
            cap !mkdir "4.documentation/4.4.books"
            cap !mkdir "4.documentation/4.5.papers"
        cap !mkdir "5.processed_data"
        cap !mkdir "6.results"
            cap !mkdir "6.results/6.1.tables"
            cap !mkdir "6.results/6.2.figures"
            cap !mkdir "6.results/6.3.log_files"
            cap !mkdir "6.results/6.4.maps"
        cap !mkdir "7.reports"
            cap !mkdir "7.reports/7.1.drafts"
            cap !mkdir "7.reports/7.2.final"
    }

    { // 2.3.- global
        global dofiles  "${root}/2.dofiles"
        global raw      "${root}/3.raw_data"
        global clean    "${root}/5.processed_data"
        global results  "${root}/6.results"
        global tables   "${results}/6.1.tables"
        global figures  "${results}/6.2.figures"
        global logfiles "${results}/6.3.log_files"
    }

}





{ // 3.- Downloading the database ENAHO - 2023
    global root   "..."
    global path   "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/"
    local modules "01 02 03 05 11 34 37"
        local files_01 "enaho01-2023-100.dta"
        local files_02 "enaho01-2023-200.dta"
        local files_03 "enaho01a-2023-300.dta"
        local files_05 "enaho01a-2023-500.dta"
        local files_11 "enaho01-2023-605.dta"
        local files_34 "sumaria-2023.dta"
        local files_37 "enaho01-2023-700.dta"
    foreach module in `modules' {
        copy      "${path}/906-Modulo`module'.zip" "${root}/906-Module`module'.zip", replace
        unzipfile "${root}/906-Module`module'.zip"                                 , replace 
        erase     "${root}/906-Module`module'.zip"
        // 3.1.- At the level of individuals
            // Module 2.- Characteristics of household members
                if "`module'" == "02" {
                    foreach files in `files_02' {
                        copy "${root}/906-Modulo02/`files'" "${raw}/`files'", replace
                        shell rmdir "${root}/906-Modulo02" /s /q
                    }
                }
            // Module 3.- Education
                if "`module'" == "03" {
                    foreach files in `files_03' {
                        copy "${root}/906-Modulo03/`files'" "${raw}/`files'", replace
                        shell rmdir "${root}/906-Modulo03" /s /q
                    }
                }
            // Module 5.- Employment and income
                if "`module'" == "05" {
                    foreach files in `files_05' {
                        copy "${root}/906-Modulo05/`files'" "${raw}/`files'", replace
                        shell rmdir "${root}/906-Modulo05" /s /q
                    }
                }
        // 3.2.- At the household level
            // Module 1.- Characteristics of housing and home
                if "`module'" == "01" {
                    foreach files in `files_01' {
                        copy "${root}/906-Modulo01/`files'" "${raw}/`files'", replace
                        shell rmdir "${root}/906-Modulo01" /s /q
                    }
                }
            // Module 11.- Housing Services
                if "`module'" == "11" {
                    foreach files in `files_11' {
                        copy "${root}/906-Modulo11/`files'" "${raw}/`files'", replace
                        shell rmdir "${root}/906-Modulo11" /s /q
                    }
                }
            // Module 34.- Summary (Calculated Variables)
                if "`module'" == "34" {
                    foreach files in `files_34' {
                        copy "${root}/906-Modulo34/`files'" "${raw}/`files'", replace
                        shell rmdir "${root}/906-Modulo34" /s /q
                    }
                }
            // Module 37.- Social programs
                if "`module'" == "37" {
                    foreach files in `files_37' {
                        copy "${root}/906-Modulo37/`files'" "${raw}/`files'", replace
                        shell rmdir "${root}/906-Modulo37" /s /q
                    }
                }
    }
}



