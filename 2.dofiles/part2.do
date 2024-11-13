
/*==================================================================================================

    Construction of Socioeconomic Indicators for the Development of Theses and Research

           .--.     
          |o_o |          "This file is used to perform database cleanup"
          |:_/ |                         
         //   \ \            NISI - MICRODATA - DATABASE - NHS 2023
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
        ** 2.2.- global
    * 3.- Set latin code
    * 4.- Module 1.- Clean and create variables
    * 5.- Module 
    * 6.- 
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

    { // 2.2.- global
        global dofiles  "${root}/2.dofiles"
        global raw      "${root}/3.raw_data"
        global clean    "${root}/5.processed_data"
        global results  "${root}/6.results"
        global tables   "${results}/6.1.tables"
        global figures  "${results}/6.2.figures"
        global logfiles "${results}/6.3.log_files"
        global maps     "${results}/6.4.maps"
    }

}





{ // 3.- Set latin code 
    cd "${root}/3.raw_data"
    unicode analyze *               // Note.- There must be no data in memory
    unicode encoding set ISO-8859-1 // Latin code
    unicode translate *
}





{ // 4.- Module 1.- Clean and create variables
    
    use "${raw}/enaho01-2023-100.dta", clear 
    browse 

    { // 3.1.- sort: sort the observations from smallest to largest or in ascending order.
        codebook conglome             // cluster number
        codebook vivienda             // housing selection number
        codebook hogar                // sequential home number
        sort conglome vivienda hogar  
    }

    { // 3.2.- result: final result of the survey
        codebook result
        fre      result
        keep if (result == 1 | result == 2)
    }

}





