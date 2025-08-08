Subroutine Type3809
   !------------------------------------------------------------------------------------
   !    DESCRIPTION
   !------------------------------------------------------------------------------------
   ! Subroutine Type3809 implements an .NE. (Not equal) logic operation in a TRNSYS simulation.
   ! It compares two input signals and returns 1 if they are not equal, or 0 if they are equals.
   !
   ! Inputs:
   !   Input_x : First input signal
   !   Input_y : Second input signal
   !
   ! Outputs:
   !   1 if Input_x != Inputs_y, else 0
   !
   ! Version History:
   !   2025-08-01 – A. Lachance: Original implementation.
   !
   ! Export this subroutine for use in external DLLs.
   !DEC$ATTRIBUTES DLLEXPORT :: TYPE3809
   !------------------------------------------------------------------------------------
   !    VARIABLES
   !------------------------------------------------------------------------------------
   Use TrnsysConstants
   Use TrnsysFunctions
   Implicit None

   Double Precision :: timestep, time
   Integer :: currentUnit, currentType

   Double Precision :: input_x, input_y
   logical :: output_flag

   !------------------------------------------------------------------------------------
   !    INITIALIZATION
   !------------------------------------------------------------------------------------
   ! Get global TRNSYS simulation variables
   time = getSimulationTime()
   timestep = getSimulationTimeStep()
   currentUnit = getCurrentUnit()
   currentType = getCurrentType()

   !------------------------------------------------------------------------------------
   !    VERSION CHECK
   !------------------------------------------------------------------------------------
   If (getIsVersionSigningTime()) Then
      Call SetTypeVersion(17)
      Return
   End If

   !------------------------------------- ----------------------------------------------
   !    FINAL CALL HANDLING
   !------------------------------------------------------------------------------------
   If (getIsLastCallofSimulation() .or. getIsEndOfTimestep()) Then
      Return
   End If

   !------------------------------------------------------------------------------------
   !    TYPE INITIALIZATION
   !------------------------------------------------------------------------------------
   If (getIsFirstCallofSimulation()) Then

      ! TRNSYS Engine Type Calls
      Call SetNumberofParameters(0)
      Call SetNumberofInputs(2)
      Call SetNumberofDerivatives(0)
      Call SetNumberofOutputs(1)
      Call SetIterationMode(1)
      Call SetNumberStoredVariables(0, 0)
      Call SetNumberofDiscreteControls(0)

      ! TRNSYS Input and Output Units
      ! Nothing

      Return
   End If

   !------------------------------------------------------------------------------------
   !    INITIAL VALUE SETTING
   !------------------------------------------------------------------------------------
   If (getIsStartTime()) Then
      Call setOutputValue(1, 0)
      Return
   End If

   !------------------------------------------------------------------------------------
   !    RE-READ PARAMETERS
   !------------------------------------------------------------------------------------
   If (getIsReReadParameters()) Then
   End If

   !------------------------------------------------------------------------------------
   !    MAIN TYPE CODE
   !------------------------------------------------------------------------------------
   input_x = GetInputValue(1)
   input_y = GetInputValue(2)

   output_flag = input_x .NE. input_y

   Call setOutputValue(1, MERGE(1.d0, 0.d0, output_flag)) ! 1 if True

   Return
End
