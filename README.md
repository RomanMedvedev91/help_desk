# help_desk

This app is for managing the tickets and their status assigned to the team.

To run the application, follow the following steps

1. Create a database 



        CREATE DATABASE helpdesk_development


2. run bundle install


        bundle install
        
        
3. add the data to database





       rake db:migrate
       
       
4. seed the database       
       
      
      
      
       rake then db:seed
      
      
    
    
    
5. run the app



        bin/rails s -b 0.0.0.0
        
      
      
      

