
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
    * 3.- Clean and create variables
    * 4.- 
    * 5.- 
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
    }

}




{ // 3.- Clean and create variables
    
    cd "${root}/3.raw_data"
    unicode analyze *               // Note.- There must be no data in memory
    unicode encoding set ISO-8859-1 // Latin code
    unicode translate *
    
    { // 3.1.- Module 1.- Characteristics of housing and home
        use "${raw}/enaho01-2023-100.dta", clear 
        browse 
    }

    { // 3.2.- Module 2.- 

    }
	
	{ // 3.3.- Module 3.- 
	
	}

}





