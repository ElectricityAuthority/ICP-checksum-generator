/* checksum.h
 * Contains the interface for frame() and check()
 * Anand V Raman 18 Jan 1999 (A.Raman@massey.ac.nz)
 */
#ifndef FCS_H
#define FCS_H

#define ICPSIZE 12    /* Characters in the ID */
#define UNIQIDSIZE 15 /* Characters in the Uniq ID */
#define FCSSIZE 12    /* Bits in the Frame Check Sequence */

//char *frame_crc12(char *icp);

BSTR frame_crc12(char *icp);
char *frame_crc12_r(char *icp, char *buf, int buflen);
int check_crc12(char *uniqID);

#endif
