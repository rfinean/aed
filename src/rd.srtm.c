// rd-srtm.c, 13 Sep 14
// Convert SRTM .hgt files to list of numbers (in text form)

#include <stdio.h>
#include <stdlib.h>

#define POINTS_PER_SIDE 1201
#define POINTS_PER_BLK (POINTS_PER_SIDE*POINTS_PER_SIDE)

// Reduce the work we have to do by detecting 1-degree squares that don't
// have many low lying areas (where low is less than the following)
#define MIN_HEIGHT 3


int main(int argc, char *argv[])
{
short *h_data = malloc(POINTS_PER_BLK*sizeof(short));
int min_height_cnt=0;

FILE * file_ptr=fopen(argv[1], "rb");

if (file_ptr == NULL)
   printf("Failed to open %s\n", argv[1]);

int num_locs=fread(h_data, 2, POINTS_PER_BLK, file_ptr);

if (num_locs != POINTS_PER_BLK)
   printf("Only read %d points read\n", num_locs);

for (int i=0; i<num_locs; i++)
   {
   h_data[i]=((h_data[i] >> 8) & 0xFF) | (h_data[i] << 8);
   if ((h_data[i] != -32768) &&
       (h_data[i] <= MIN_HEIGHT))
      min_height_cnt++;
   }

// fprintf(stderr, "min_height_cnt=%d\n", min_height_cnt);

for (int i=0; i< num_locs; i++)
   printf("%d,%d,%d\n", i/POINTS_PER_SIDE, i % POINTS_PER_SIDE, h_data[i]);

if (min_height_cnt < 15)
   return EXIT_FAILURE;
else
   return EXIT_SUCCESS;
}

