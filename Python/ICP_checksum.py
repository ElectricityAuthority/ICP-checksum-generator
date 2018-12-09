D = int('0x180f', 0)
H100 = int('0x100', 0)
H1000 = int('0x1000', 0)
HFFFF = int('0xffff', 0)

def Asc(bytes_obj):
    '''Get the int value of a char'''
    if type(bytes_obj) == bytes:
        return bytes_obj[0]
    else:
        return ord(bytes_obj[0])

def Mid(string, integer, integer2):
    '''Select a substring from a string'''
    integer = integer - 1
    return string[integer : integer+integer2]

def gen_crc(icp_number):
    """ Generate a checksum for an ICP"""
    R = int('0', 0)    
    CheckICP = icp_number
    ICP_GEN_CRC = ""
    IChar = 0
    if len(CheckICP.strip()) < 12:
        ICP_GEN_CRC = "Insufficient Data"
    else:    
        CheckICP = CheckICP[:12] + "\0\0\0"    
        #print('CheckICP: ' + str(CheckICP))
        for I in range(0,108):
            #print(I)
            if I%8 == 0:
                IChar = Asc(Mid(CheckICP, int((I/8)+1), 1))
                #print('IChar: ' + str(IChar))
            IChar = IChar * 2
            #print('IChar: ' + str(IChar))
            R = R * 2
            #print('R: ' + str(R))
            if int((IChar & H100) / 256.0) == 1:            
                R = R + 1
            if (R & H1000) > 0:
                R = R ^ D
        R = R & HFFFF
        #print('R: ' + str(R))
        CheckICP = ("000" + format(R,'x'))[-3:]
        #print('CheckICP: ' + str(CheckICP))
        ICP_GEN_CRC = CheckICP.upper()
        #print('ICP_GEN_CRC: ' + str(ICP_GEN_CRC))
    return ICP_GEN_CRC