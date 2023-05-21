/* 
       AQUATECH | Irrigation Systems
       Sofware Platform
*/

!constant organization_name "AQUATECH"
!constant BUSINESS_UNIT "Irrigation Systems"

workspace {

     model {
        
         group "${organization_name} - ${BUSINESS_UNIT}" {
             //Actors/Roles
             farmer    = person "Farmer"
             advisor    = person "Advisor"
             

             //Software Platform

             platform = softwareSystem "AQUATECH Irrigation Systems" {
              //Containers

              farmerApp = container "Farmer App" "Access to Farmer" "Flutter"
              advisorApp = container "Advisor  App"
              landingPage = container "Landing Page"
              webApp = container "Platform  Website"
              webApi = container "Platform Api"
              
             
               
             }

            farmer -> platform "Uses"
            advisor -> platform "Uses"
           

            landingPage -> webApp  
            webApp -> webApi
            farmerApp -> webApi
            advisorApp -> webApi

            farmer -> farmerApp "Uses" 
            farmer -> webApp "Uses"
            advisor -> AdvisorApp "Uses"
            advisor -> WebApp "Uses"
            //

         }
     }
     
     views {
         
         systemContext platform {
            include *
            autoLayout
         }
        
        container platform {
            include  farmer advisor
            include farmerApp advisorApp landingPage webApp webApi
            autoLayout

        }

        component platform {

            //aca va el diagrama de componente
        }
        
        // el diagrama de codigo no se programa creo xd se hace en lucidchart
       
       theme https://static.structurizr.com/themes/microsoft-azure-2021.01.26/theme.json

     }

}
