
/*==================================================================================================

    Construction of Socioeconomic Indicators for the Development of Theses and Research

           .--.     
          |o_o |          "This file is used to perform database analysis"
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
    * 3.- 
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
    
    { // 2.1.- root
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




{ // 

    

}
