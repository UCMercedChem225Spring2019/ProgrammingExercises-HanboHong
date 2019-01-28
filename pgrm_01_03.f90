      Program pgrm_01_03  
      implicit none
      integer,parameter::inFileUnitA=10,inFileUnitB=11
      integer::errorFlag,i
      real,dimension(3,3)::matrixInA,matrixInB,matrixProduct
      character(len=128)::fileNameA,filenameB
!      
!     Ask the name of the file
      write(*,*)' What are the names of the input data file?'
      read(*,*) fileNameA,fileNameB
!      
!     Open the data file and read matrixInA from that file.
      open(unit=inFileUnitA,file=TRIM(fileNameA),status='old',iostat=errorFlag)
      if(errorFlag.ne.0) then
        write(*,*)' There was a problem opening the first input file.'
        goto 999
      endIf
      do i = 1,3
!     I CHANGED THE READ PROCESS TO A MORE SIMPLIFIED ONE
        read(inFileUnitA,*) matrixInA(i,:)
      endDo
      close(inFileUnitA)
!
!     Open the data file and read matrixInB from that file      
      open(unit=inFileUnitB,file=TRIM(fileNameB),status='old',iostat=errorFlag)
      if(errorFlag.ne.0) then
        write(*,*)' There was a problem opening the second input file.'
        goto 999
      endIf
      do i = 1,3
        read(inFileUnitB,*) matrixInB(i,:)
      endDo
      close(inFileUnitB)
!
!     Do the product!
      matrixProduct=MatMul(matrixInA,matrixInB)
!      
!     Call the subroutine PrintMatrix to print matrixInA.
      call PrintMatrix3x3(matrixInA)
!
!     Call the subroutine PrintMatrix to print matrixInB.
      call PrintMatrix3x3(matrixInB)
!
!     Call the subroutine PrintMatrix to print matrixProduct
      call PrintMatrix3x3(matrixProduct)
!      
  999 continue
      End Program pgrm_01_03


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
      do i=1,3
        write(*,1000) matrix(i,:)
      endDo
      
      return
      End Subroutine PrintMatrix3x3
