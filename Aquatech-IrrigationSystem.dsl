/* 
    AQUATECH | Irrigation System
    Software Platform
*/

!constant organization_name "AQUATECH"
!constant BUSINESS_UNIT "Irrigation System"

workspace {
    model {
        group "${ORGANIZATION_NAME} - ${BUSINESS_UNIT}"{
            //Actor/Roles
            farmer = person "Farmer" 
            adviser = person "Adviser" 
            
            
            //Software Platform
            platform = softwareSystem "AQUATECH Irrigation System"{
                //Containers
                farmerApp = container "Farmer App" "Access to student" "Flutter"
                adviserApp = container "Advisor App"
                landingPage = container "Landing Page"
                webApp = container "Platform Website"
                mobileApp = container "Mobile App"
                webAPI = container "Platform API" 
            }
                

            
            benchmark = softwareSystem "User Benchmark" "Plataforma que proporciona información de los componentes informáticos" {
                registrationandauthentication = container "Registration and authentication" {
                    signinController = component "Sign In Controller" "Allows users to sign in to the AQUATECH Irrigation System." 
                    accountsSummaryController = component "Accounts Summary Controller" "Provides customers with a summary of their bank accounts." "Spring MVC Rest Controller"
                    resetPasswordController = component "Reset Password Controller" "Allows users to reset their passwords with a single use URL." "Spring MVC Rest Controller"
                    securityComponent = component "Security Component" "Provides functionality related to signing in, changing passwords, etc." "Spring Bean"
                    AuthenticationController = component "AuthentiationController" "allows you to authenticate the account with phone number or email" "JavaScript"
                    emailComponent = component "Email Component" "Sends e-mails to users."

                }
                userprofile = container "User Profile" {
                    createProfileController     = component "Create Profile Controller" "Allowa users to create a profile" "Spring MVC Rest Controller"
                    managementProfileController = component "Management Controller" "Allows users to management the profile " "Spring MVC Rest Controller"                    
                    deleteProfileController = component  "Delete Profile Controller" " Allows users to delete the profile" "Spring MVC Rest Controller"
                    viewProfileComponent = component "View Profile" "Users views to profile in the system" "Spring Bean"

                }
                searchandmatch = container "Search and Match" {
                    searchController = component "Search Controller" "Allows to users search an expert in the system" "Spring MVC Rest Controller"                    
                    matchController = component "Match Controller" "Allows to users match an expert" "Spring MVC Rest Controller"
                    BestMatchComponent = component "Best Match Component" "Utiliza algoritmos de emparejamiento para conectar" "Spring Bean"

                }
                ChatandMessaging = container "Chat and Messaging" {
                    chatController = component "chat Controller" "Allows users to chat" "Spring MVC Rest Controller"                    
                    saveChatComponent = component "Save Chat Component" "Chat saves all messages in the system" "Spring Bean"

                }
                AppointmentandScheduling = container "Appointment and Scheduling" {
                    scheduleController = component "Schedule Controller" "Allows users to scheduling appointments to the Internet Banking System" "Spring MVC Rest Controller"                    
                    notificationsComponent = component "Notifications Component" "Sends notifications to users about appointments." "Spring Bean"


                }
                Payment  = container "Payment" {
                    paymentControlller = component "Payment Controller"  "Allows users to make their payments correctly" "Spring MVC Rest Controller"
                    checkoutController = component "Checkout Controller" "Allow users to check if the payment has been successful" "Spring MVC Rest Controller"  
                    gatewayController = component "Gateway Controller"    "Allows users to external payment gateways to facilitate secure transactions" "Spring MVC Rest Controller" 
                    sendsPaymentsComponent = component "Sends Payment Component" "Sends the payment to advisers" "Spring Bean"

                }
                Subscription = container "Subscription" {
                    paymentSubscriptionControlller = component "Payment Subscription Controller"  "Allows users to make their payments subscriptions" "Spring MVC Rest Controller"
                    improveSubscriptionController = component "Imnprove Subscription Controller" "Allow users to improve the subscription" "Spring MVC Rest Controller"  
                    cancelSubscriptionController = component "Cancel Subscription Controller" "Allow users to cancel the subscription" "Spring MVC Rest Controller" 
                    subscriptioneBenefitsComponent = component "Subscription Benefit Component" "Users get subscription benefits" "Spring Bean"

                }
                Feedback = container "Feedback" {
                    evaluationControlller = component "Evaluation Controller"  "Allows users to make their payments correctly" "Spring MVC Rest Controller"
                    feedbackController = component "Feedback Controller" "Allow users to check if the payment has been successful" "Spring MVC Rest Controller"  
                    rateToExpertComponet = component "Rate to Expert Component" "" "Spring Bean" 


                }
                Solutions = container "Solutions" {
                    analysisController = component "Analysis Controller"  "Allows users to make their payments correctly" "Spring MVC Rest Controller"
                    solutionsController = component "Solutions Controller" "Allow users to check if the payment has been successful" "Spring MVC Rest Controller"  
                    sendsSolutionsComponent = component "Sends Solutions Component" "Send the approximate solutions according to the previous analysis" "Spring Bean" 


                }
                database = container "Database" "Stores user registration information, hashed authentication credentials, access logs, etc." "Microsoft Azure Database Schema" "Database"
            }
            
            

            farmer       -> platform   "Persona dedicada a la agricultura la cuál busca asesoría de un experto en el tema"
            adviser      -> platform   "Experto en el rubro de la agricultura"
            

            landingPage  -> webApp
            webApp       -> webAPI
            mobileApp    -> webAPI
            farmerApp    -> webAPI
            adviserApp   -> webAPI

            farmer       -> farmerApp  "Uses"
            farmer       -> webApp     "Uses"
            farmer       -> mobileApp  "Uses"
            adviser      -> adviserApp "Uses"
            adviser      -> webApp     "Uses"
            adviser      -> mobileApp  "Uses"

            
            //REGISTRATION AND AUTHENTICATION
            
        
            # relationships to/from components
            landingPage                  -> signinController "Makes API calls to" "JSON"
            landingPage                        -> accountsSummaryController "Makes API calls to" "JSON"
            landingPage                        -> resetPasswordController "Makes API calls to" "JSON"
            mobileApp           -> signinController "Makes API calls to" "JSON"
            mobileApp           -> accountsSummaryController "Makes API calls to" "JSON"
            mobileApp           -> resetPasswordController "Makes API calls to" "JSON"
            webApp              -> signinController "Makes API calls to" "JSON"
            webApp              -> accountsSummaryController "Makes API calls to" "JSON"
            webApp              -> resetPasswordController "Makes API calls to" "JSON"
            signinController            -> securityComponent "Uses"
            resetPasswordController     -> securityComponent "Uses"
            resetPasswordController     -> emailComponent "Uses"
            AuthenticationController     -> emailComponent "Makes API calls to" "JSON"
            AuthenticationController     -> securityComponent "Makes API calls to" "JSON"
            securityComponent           -> database "Reads from and writes to" "SQL"

             
            //profile
            landingPage                         -> createProfileController       "Makes API calls to" "JSON"
            landingPage                         -> managementProfileController    "Makes API calls to" "JSON"
            mobileApp                           -> createProfileController             "Makes API calls to" "JSON"
            mobileApp                           -> managementProfileController    "Makes API calls to" "JSON"
            webApp                              -> createProfileController       "Makes API calls to" "JSON"
            webApp                              -> managementProfileController   "Makes API calls to" "JSON"
            managementProfileController         -> viewProfileComponent  "Uses"         
            managementProfileController         -> deleteProfileController "Makes API calls to"
            viewProfileComponent                -> database "Reads from and writes to" "SQL"


            
            


           //search and match
            landingPage                 -> searchController   "Makes API calls to" "JSON"
            landingPage                 -> matchController   "Makes API calls to" "JSON"
            mobileApp                   -> searchController   "Makes API calls to" "JSON"
            mobileApp                   -> matchController   "Makes API calls to" "JSON"
            webApp                      -> searchController   "Makes API calls to" "JSON"
            webApp                      -> matchController   "Makes API calls to" "JSON"
            searchController            -> BestMatchComponent   "Uses"
            matchController             -> BestMatchComponent   "Uses"
            BestMatchComponent          -> database "Reads from and writes to" "SQL"
            
           // chat 
            landingPage                 -> chatController   "Makes API calls to" "JSON"
            mobileApp                   -> chatController   "Makes API calls to" "JSON"
            webApp                      -> chatController   "Makes API calls to" "JSON"
            chatController              -> saveChatComponent   "Uses"
            chatController              -> database "Reads from and writes to" "SQL"
            



           //AppointmentandScheduling
            landingPage                     -> scheduleController  "Makes API calls to" "JSON"
            mobileApp                       -> scheduleController "Makes API calls to" "JSON"
            webApp                          -> scheduleController "Makes API calls to" "JSON"
            scheduleController              -> notificationsComponent  "Uses"
            scheduleController              -> notificationsComponent  "Makes API calls to" "JSON"
            notificationsComponent          -> database "Reads from and writes to" "SQL"
            
           //payment
            landingPage                 -> paymentControlller  "Makes API calls to" "JSON"
            landingPage                 -> checkoutController  "Makes API calls to" "JSON"
            landingPage                 -> gatewayController  "Makes API calls to" "JSON"
            mobileApp                   -> paymentControlller  "Makes API calls to" "JSON"
            mobileApp                   -> checkoutController  "Makes API calls to" "JSON"
            mobileApp                   -> gatewayController  "Makes API calls to" "JSON"
            webApp                      -> paymentControlller  "Makes API calls to" "JSON"
            webApp                      -> checkoutController  "Makes API calls to" "JSON"
            webApp                      -> gatewayController  "Makes API calls to" "JSON"
            paymentControlller          -> sendsPaymentsComponent  "Uses"
            checkoutController          -> sendsPaymentsComponent  "Uses"
            gatewayController           -> sendsPaymentsComponent  "Uses"
            sendsPaymentsComponent      -> database "Reads from and writes to" "SQL"
            
           //subscription
            landingPage                         -> paymentSubscriptionControlller  "Makes API calls to" "JSON"
            landingPage                         -> improveSubscriptionController  "Makes API calls to" "JSON"
            landingPage                         -> cancelSubscriptionController  "Makes API calls to" "JSON"
            mobileApp                           -> paymentSubscriptionControlller  "Makes API calls to" "JSON"
            mobileApp                           -> improveSubscriptionController  "Makes API calls to" "JSON"
            mobileApp                           -> cancelSubscriptionController  "Makes API calls to" "JSON"
            webApp                              -> paymentSubscriptionControlller  "Makes API calls to" "JSON"
            webApp                              -> improveSubscriptionController  "Makes API calls to" "JSON"
            webApp                              -> cancelSubscriptionController  "Makes API calls to" "JSON"
            paymentSubscriptionControlller      -> subscriptioneBenefitsComponent  "Uses"
            improveSubscriptionController       -> subscriptioneBenefitsComponent  "Uses"    
            subscriptioneBenefitsComponent      -> database "Reads from and writes to" "SQL"
            
           //Feedback
            landingPage                         -> evaluationControlller  "Makes API calls to" "JSON"
            landingPage                         -> feedbackController  "Makes API calls to" "JSON"
            mobileApp                           -> evaluationControlller  "Makes API calls to" "JSON"
            mobileApp                           -> feedbackController  "Makes API calls to" "JSON"
            webApp                              -> evaluationControlller  "Makes API calls to" "JSON"
            webApp                              -> feedbackController  "Makes API calls to" "JSON"
            evaluationControlller                    -> rateToExpertComponet  "Uses"
            feedbackController             -> rateToExpertComponet  "Uses"
            rateToExpertComponet                -> database "Reads from and writes to" "SQL"
            
           //solutions
            landingPage                         -> analysisController  "Makes API calls to" "JSON"
            solutionsController                 -> analysisController   "Makes API calls to" "JSON"
            mobileApp                           -> analysisController  "Makes API calls to" "JSON"
            mobileApp                           -> solutionsController  "Makes API calls to" "JSON"
            webApp                              -> analysisController  "Makes API calls to" "JSON"
            webApp                              -> solutionsController  "Makes API calls to" "JSON"
            solutionsController                 -> sendsSolutionsComponent  "Uses"
            sendsSolutionsComponent                   -> database "Reads from and writes to" "SQL"
           
            
            
            
        }
           
           

    }

    views {
        systemContext Platform {
            include *
            autoLayout 
        }

        container Platform {
            //Roles included
            include farmer adviser
            //Containers included
            include farmerApp adviserApp landingPage webApp webAPI mobileApp
            autoLayout
        }


        component registrationandauthentication "ComponentsRegistration" {
            include *
            autoLayout
            description "The component diagra for the web API"
        }

        component userprofile "ComponentsUserProfile" {
            include *
            autoLayout
            description "The component diagra for the web API"
        }

        component searchandmatch "ComponentsSearchandmatch" {
            include *
            autoLayout
            description "The component diagra for the web API"
        }

        component ChatandMessaging  "ComponentsChatandMessaging" {
            include *
            autoLayout
            description "The component diagra for the web API"
        }

        component AppointmentandScheduling  "ComponentsAppointmentandScheduling" {
            include *
            autoLayout
            description "The component diagra for the web API"
        }

        component Payment   "ComponentsPayment" {
            include *
            autoLayout
            description "The component diagra for the web API"
        }

        component Subscription  "ComponentsSubscription" {
            include *
            autoLayout
            description "The component diagra for the web API"
        }

        component Feedback  "ComponentsFeedback" {
            include *
            autoLayout
            description "The component diagra for the web API"
        }

        component Solutions  "ComponentsSolutions" {
            include *
            autoLayout
            description "The component diagra for the web API"
        }

        

        

        theme default
    }
}