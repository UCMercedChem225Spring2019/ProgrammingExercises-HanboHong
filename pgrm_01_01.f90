      Program pgrm_01_01  
      implicit none
      integer,parameter::inFileUnitA=10
      integer::errorFlag,i
      real,dimension(3,3)::matrixInA
      character(len=128)::fileNameA
!      
!     Ask the name of the file
      write(*,*)' What is the name of the input data file?'
      read(*,*) fileNameA
!      
!     Open the data file and read matrixInA from that file.
      open(unit=inFileUnitA,file=TRIM(fileNameA),status='old',iostat=errorFlag)
      if(errorFlag.ne.0) then
        write(*,*)' There was a problem opening the input file.'
        goto 999
      endIf

!     I CHANGED THE READ PROCESS TO A MORE COMPACT ONE

      do i = 1,3
        read(inFileUnitA,*) matrixInA(:,i)
      endDo
      close(inFileUnitA)
!     Call the subroutine PrintMatrix to print matrixInA.
      call PrintMatrix3x3(matrixInA)
!
  999 continue
      End Program pgrm_01_01


      Subroutine PrintMatrix3x3(matrix)
!
!     This subroutine prints a 3x3 real matrix. The output is written to StdOut.
      implicit none
      real,dimension(3,3),intent(in)::matrix
      integer::i
!     Format statements.
 1000 format(3(2x,f5.1))
!
!     Do the printing job.
      write(*,*)' Printing Matrix'
!     My code to print the matrix
      Do i=1,3
        write(*,1000) matrix(i,:)
      endDo

      return
      End Subroutine PrintMatrix3x3
