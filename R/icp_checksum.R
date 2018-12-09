# Create Mid and Right functions (akin to 'Mid' and 'Right' in VBA)
Mid <- function(string, start, n) {
  
  substr(string, start, start + n - 1)
  
}

Right <- function(string, n) {
  
  substr(string, nchar(string) - (n - 1), nchar(string))
  
}

# Create function for generating ICP checksum
generate_ICP_checksum <- function(icp_number){
  
  # Initialise objects
  D <- strtoi("0x180f", base = 0)
  H100 <- strtoi('0x100', base = 0)
  H1000 <- strtoi('0x1000', base = 0)
  HFFFF <- strtoi('0xffff', base = 0)
  
  R <- strtoi("0", base = 0)
  CheckICP <- icp_number
  IChar <- 0
  
  if(nchar(trimws(CheckICP)) < 12){
    
    stop("String too short")
    
  } else if (nchar(trimws(CheckICP)) > 15){
    
    stop("String too long.")
    
  } else if (!grepl("^[[:digit:]]{10}[[:upper:]]{2}", CheckICP)){
    
    stop("Not a valid ICP input.")
    
  } else {
    
    if (nchar(trimws(CheckICP)) > 12) {
      
      CheckICP <- substr(CheckICP, 1, 12)
      
    }
    
    CheckICP <- paste(CheckICP, " ", " ", " ")
    
    for (I in 0:107){
      
      if (I%%8 == 0) {
        
        if(Mid(CheckICP, (I/8) + 1, 1) == " "){
          
          IChar <- 0
          
        } else {
          
          IChar <- utf8ToInt(Mid(CheckICP, (I/8) + 1, 1))
          
        }
      }
      
      IChar <- IChar * 2
      
      R <- R * 2
      
      if ((bitwAnd(IChar, H100) / 256) == 1) {            
        R <- R + 1
      }
      
      if (bitwAnd(R, H1000) > 0) {
        R <- bitwXor(R, D)
      }
    }
    
    R <- bitwAnd(R, HFFFF)
    CheckICP <- toupper(Right(paste0("000", as.hexmode(R)), 3))
    
    
  }
  
  return (CheckICP)
  
}
