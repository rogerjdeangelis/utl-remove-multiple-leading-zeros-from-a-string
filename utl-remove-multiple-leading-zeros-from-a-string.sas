Remove multiple leading zeros from a string                                                                  
                                                                                                             
github                                                                                                       
https://tinyurl.com/yd8vfawj                                                                                 
https://github.com/rogerjdeangelis/utl-remove-multiple-leading-zeros-from-a-string                           
                                                                                                             
SAS Forum                                                                                                    
https://tinyurl.com/ya5wu2wh                                                                                 
https://communities.sas.com/t5/SAS-Procedures/Remove-leading-zeroes-from-character-string/m-p/653433         
                                                                                                             
Tom's profile                                                                                                
https://communities.sas.com/t5/user/viewprofilepage/user-id/159                                              
                                                                                                             
The SAS underused verify function comes to the rescue;                                                       
Requires reverse thinking. (First non zero)                                                                  
                                                                                                             
*_                   _                                                                                       
(_)_ __  _ __  _   _| |_                                                                                     
| | '_ \| '_ \| | | | __|                                                                                    
| | | | | |_) | |_| | |_                                                                                     
|_|_| |_| .__/ \__,_|\__|                                                                                    
        |_|                                                                                                  
;                                                                                                            
                                                                                                             
cards4                                                                                                       
00000000000000009000                                                                                         
00000001234000000000                                                                                         
12340000000000000000                                                                                         
*            _               _                                                                               
  ___  _   _| |_ _ __  _   _| |_                                                                             
 / _ \| | | | __| '_ \| | | | __|                                                                            
| (_) | |_| | |_| |_) | |_| | |_                                                                             
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                            
                |_|                                                                                          
;                                                                                                            
                                                                                                             
STR="00000000000000009000" NEW_STR="9000"                                                                    
STR="00000001234000000000" NEW_STR="1234000000000"                                                           
STR="12340000000000000000" NEW_STR="12340000000000000000"                                                    
                                                                                                             
*                                                                                                            
 _ __  _ __ ___   ___ ___  ___ ___                                                                           
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                          
| |_) | | | (_) | (_|  __/\__ \__ \                                                                          
| .__/|_|  \___/ \___\___||___/___/                                                                          
|_|                                                                                                          
;                                                                                                            
                                                                                                             
You can use the VERIFY() function to find the location of the first non-zero character.                      
You can then use that information in the SUBSTR() function.                                                  
                                                                                                             
data want;                                                                                                   
  input str $20.;                                                                                            
  new_str = substr(str,verify(str,'0'));                                                                     
  put (_all_) (= $quote.);                                                                                   
cards4;                                                                                                      
00000000000000009000                                                                                         
00000001234000000000                                                                                         
12340000000000000000                                                                                         
;;;;                                                                                                         
run;quit;                                                                                                    
                                                                                                             
                                                                                                             
