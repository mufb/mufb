/*
 * Li_sf.c
 *
 * Code generation for model "Li_sf.mdl".
 *
 * Model version              : 1.43
 * Simulink Coder version : 8.0 (R2011a) 09-Mar-2011
 * C source code generated on : Wed Jun 19 07:37:35 2013
 *
 * Target selection: rtwsfcn.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: 32-bit Generic
 * Emulation hardware selection:
 *    Differs from embedded hardware (MATLAB Host)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include <math.h>
#include "Li_sf.h"
#include "Li_sf_private.h"
#include "simstruc.h"
#include "fixedpoint.h"
#if defined(RT_MALLOC) || defined(MATLAB_MEX_FILE)

extern void *Li_malloc(SimStruct *S);

#endif

#ifndef __RTW_UTFREE__
#if defined (MATLAB_MEX_FILE)

extern void * utMalloc(size_t);
extern void utFree(void *);

#endif
#endif                                 /* #ifndef __RTW_UTFREE__ */

#if defined(MATLAB_MEX_FILE)
#include "rt_nonfinite.c"
#endif

static const char_T *RT_MEMORY_ALLOCATION_ERROR =
  "memory allocation error in generated S-Function";

/* Initial conditions for root system: '<Root>' */
#define MDL_INITIALIZE_CONDITIONS

static void mdlInitializeConditions(SimStruct *S)
{
  /* InitializeConditions for Integrator: '<S1>/Integrator' */
  ((ContinuousStates_Li *) ssGetContStates(S))->Integrator_CSTATE = 0.0;

  /* InitializeConditions for TransferFcn: '<S1>/Low-pass filter' */
  ((ContinuousStates_Li *) ssGetContStates(S))->Lowpassfilter_CSTATE = 0.0;
}

/* Start for root system: '<Root>' */
#define MDL_START

static void mdlStart(SimStruct *S)
{
  /* instance underlying S-Function data */
#if defined(RT_MALLOC) || defined(MATLAB_MEX_FILE)
#  if defined(MATLAB_MEX_FILE)

  /* non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* Check for invalid switching between solver types */
  if (!ssIsVariableStepSolver(S)) {
    ssSetErrorStatus(S, "This Simulink Coder generated "
                     "S-Function cannot be used in a simulation with "
                     "a solver type of fixed-step "
                     "because this S-Function was created from a model with "
                     "solver type of variable-step solver and it has continuous time blocks. "
                     "See the Solver page of the simulation parameters dialog.");
    return;
  }

#  endif

  Li_malloc(S);
  if (ssGetErrorStatus(S) != (NULL) ) {
    return;
  }

#endif

  {
  }
}

/* Outputs for root system: '<Root>' */
static void mdlOutputs(SimStruct *S, int_T tid)
{
  /* local block i/o variables */
  real_T rtb_Integrator;
  real_T rtb_Lowpassfilter;
  if (1) {
    /* Integrator: '<S1>/Integrator' */
    rtb_Integrator = ((ContinuousStates_Li *) ssGetContStates(S))
      ->Integrator_CSTATE;

    /* TransferFcn: '<S1>/Low-pass filter' */
    rtb_Lowpassfilter = 0.001*((ContinuousStates_Li *) ssGetContStates(S))
      ->Lowpassfilter_CSTATE;
  }

  if (ssIsSampleHit(S, 1, 0)) {
    /* Gain: '<S3>/Gain3' incorporates:
     *  Constant: '<S3>/Constant1'
     */
    ((BlockIO_Li *) ssGetLocalBlockIO(S))->Gain3 = 0.1 * (*(real_T *)(mxGetData
      (Q(S))));
  }

  if (1) {
    /* Switch: '<S2>/Switch1' incorporates:
     *  Inport: '<Root>/chrg//dch'
     */
    if ((*(((const real_T **)ssGetInputPortSignalPtrs(S, 1))[0])) >= 1.0) {
      /* Outport: '<Root>/voltage' incorporates:
       *  Constant: '<S3>/Constant3'
       *  Constant: '<S3>/Constant4'
       *  Gain: '<S3>/Gain'
       *  Gain: '<S3>/Gain1'
       *  Gain: '<S3>/Gain2'
       *  Math: '<S3>/Math Function'
       *  Product: '<S3>/Divide'
       *  Product: '<S3>/Divide1'
       *  Sum: '<S3>/Add'
       *  Sum: '<S3>/Add1'
       *  Sum: '<S3>/Add4'
       *  Sum: '<S3>/Subtract'
       *  Sum: '<S3>/Subtract1'
       *
       * About '<S3>/Math Function':
       *  Operator: exp
       */
      ((real_T *)ssGetOutputPortSignal(S, 0))[0] = (exp(-(*(real_T *)(mxGetData
        (C(S)))) * rtb_Integrator) * (*(real_T *)(mxGetData(A(S)))) + (*(real_T *)
        (mxGetData(E0(S))))) - (rtb_Lowpassfilter / (rtb_Integrator +
        ((BlockIO_Li *) ssGetLocalBlockIO(S))->Gain3) + rtb_Integrator /
        ((*(real_T *)(mxGetData(Q(S)))) - rtb_Integrator)) * ((*(real_T *)
        (mxGetData(K(S)))) * (*(real_T *)(mxGetData(Q(S)))));
    } else {
      /* Outport: '<Root>/voltage' incorporates:
       *  Constant: '<S4>/Constant3'
       *  Constant: '<S4>/Constant4'
       *  Gain: '<S4>/Gain'
       *  Gain: '<S4>/Gain1'
       *  Gain: '<S4>/Gain2'
       *  Math: '<S4>/Math Function'
       *  Product: '<S4>/Divide'
       *  Sum: '<S4>/Add'
       *  Sum: '<S4>/Add1'
       *  Sum: '<S4>/Subtract'
       *  Sum: '<S4>/Subtract1'
       *
       * About '<S4>/Math Function':
       *  Operator: exp
       */
      ((real_T *)ssGetOutputPortSignal(S, 0))[0] = (exp(-(*(real_T *)(mxGetData
        (C(S)))) * rtb_Integrator) * (*(real_T *)(mxGetData(A(S)))) + (*(real_T *)
        (mxGetData(E0(S))))) - (rtb_Integrator + rtb_Lowpassfilter) / ((*(real_T
        *)(mxGetData(Q(S)))) - rtb_Integrator) * ((*(real_T *)(mxGetData(K(S))))
        * (*(real_T *)(mxGetData(Q(S)))));
    }

    /* End of Switch: '<S2>/Switch1' */

    /* Outport: '<Root>/energy_left' incorporates:
     *  Constant: '<S1>/chrg//dischrg1'
     *  Sum: '<S1>/Add1'
     */
    ((real_T *)ssGetOutputPortSignal(S, 1))[0] = (*(real_T *)(mxGetData(Q(S))))
      - rtb_Integrator;
  }

  /* tid is required for a uniform function interface.
   * Argument tid is not used in the function. */
  UNUSED_PARAMETER(tid);
}

/* Update for root system: '<Root>' */
#define MDL_UPDATE

static void mdlUpdate(SimStruct *S, int_T tid)
{
  if (1) {
  }

  /* tid is required for a uniform function interface.
   * Argument tid is not used in the function. */
  UNUSED_PARAMETER(tid);
}

/* Derivatives for root system: '<Root>' */
#define MDL_DERIVATIVES

static void mdlDerivatives(SimStruct *S)
{
  /* Derivatives for Integrator: '<S1>/Integrator' */
  {
    ((StateDerivatives_Li *) ssGetdX(S))->Integrator_CSTATE = *((const real_T**)
      ssGetInputPortSignalPtrs(S, 0))[0];
  }

  /* Derivatives for TransferFcn: '<S1>/Low-pass filter' */
  {
    ((StateDerivatives_Li *) ssGetdX(S))->Lowpassfilter_CSTATE = *((const real_T**)
      ssGetInputPortSignalPtrs(S, 0))[0];
    ((StateDerivatives_Li *) ssGetdX(S))->Lowpassfilter_CSTATE += (-0.001)*
      ((ContinuousStates_Li *) ssGetContStates(S))->Lowpassfilter_CSTATE;
  }
}

/* Termination for root system: '<Root>' */
static void mdlTerminate(SimStruct *S)
{

#if defined(RT_MALLOC) || defined(MATLAB_MEX_FILE)

  if (ssGetUserData(S) != (NULL) ) {
    rt_FREE(ssGetLocalBlockIO(S));
  }

  rt_FREE(ssGetUserData(S));

#endif

}

/* This function checks the attributes of tunable parameters. */
#define MDL_CHECK_PARAMETERS
#if defined(MDL_CHECK_PARAMETERS) && defined(MATLAB_MEX_FILE)

static void mdlCheckParameters(SimStruct *S)
{
  /* Parameter check for 'A' */
  if (mxIsComplex(ssGetSFcnParam(S, 0))) {
    ssSetErrorStatus(S,"Parameter 'A' has to be a non complex array.");
    return;
  }

  if (!mxIsDouble(ssGetSFcnParam(S, 0))) {
    ssSetErrorStatus(S,"Parameter 'A' has to be a double array.");
    return;
  }

  if ((mxGetNumberOfDimensions(ssGetSFcnParam(S, 0)) != 2) ||
      (mxGetDimensions(ssGetSFcnParam(S, 0))[0] != 1) ||
      (mxGetDimensions(ssGetSFcnParam(S, 0))[1] != 1) ) {
    ssSetErrorStatus(S,"Parameter 'A' has to be a [1x1] array.");
    return;
  }

  /* Parameter check for 'C' */
  if (mxIsComplex(ssGetSFcnParam(S, 1))) {
    ssSetErrorStatus(S,"Parameter 'C' has to be a non complex array.");
    return;
  }

  if (!mxIsDouble(ssGetSFcnParam(S, 1))) {
    ssSetErrorStatus(S,"Parameter 'C' has to be a double array.");
    return;
  }

  if ((mxGetNumberOfDimensions(ssGetSFcnParam(S, 1)) != 2) ||
      (mxGetDimensions(ssGetSFcnParam(S, 1))[0] != 1) ||
      (mxGetDimensions(ssGetSFcnParam(S, 1))[1] != 1) ) {
    ssSetErrorStatus(S,"Parameter 'C' has to be a [1x1] array.");
    return;
  }

  /* Parameter check for 'E0' */
  if (mxIsComplex(ssGetSFcnParam(S, 2))) {
    ssSetErrorStatus(S,"Parameter 'E0' has to be a non complex array.");
    return;
  }

  if (!mxIsDouble(ssGetSFcnParam(S, 2))) {
    ssSetErrorStatus(S,"Parameter 'E0' has to be a double array.");
    return;
  }

  if ((mxGetNumberOfDimensions(ssGetSFcnParam(S, 2)) != 2) ||
      (mxGetDimensions(ssGetSFcnParam(S, 2))[0] != 1) ||
      (mxGetDimensions(ssGetSFcnParam(S, 2))[1] != 1) ) {
    ssSetErrorStatus(S,"Parameter 'E0' has to be a [1x1] array.");
    return;
  }

  /* Parameter check for 'K' */
  if (mxIsComplex(ssGetSFcnParam(S, 3))) {
    ssSetErrorStatus(S,"Parameter 'K' has to be a non complex array.");
    return;
  }

  if (!mxIsDouble(ssGetSFcnParam(S, 3))) {
    ssSetErrorStatus(S,"Parameter 'K' has to be a double array.");
    return;
  }

  if ((mxGetNumberOfDimensions(ssGetSFcnParam(S, 3)) != 2) ||
      (mxGetDimensions(ssGetSFcnParam(S, 3))[0] != 1) ||
      (mxGetDimensions(ssGetSFcnParam(S, 3))[1] != 1) ) {
    ssSetErrorStatus(S,"Parameter 'K' has to be a [1x1] array.");
    return;
  }

  /* Parameter check for 'Q' */
  if (mxIsComplex(ssGetSFcnParam(S, 4))) {
    ssSetErrorStatus(S,"Parameter 'Q' has to be a non complex array.");
    return;
  }

  if (!mxIsDouble(ssGetSFcnParam(S, 4))) {
    ssSetErrorStatus(S,"Parameter 'Q' has to be a double array.");
    return;
  }

  if ((mxGetNumberOfDimensions(ssGetSFcnParam(S, 4)) != 2) ||
      (mxGetDimensions(ssGetSFcnParam(S, 4))[0] != 1) ||
      (mxGetDimensions(ssGetSFcnParam(S, 4))[1] != 1) ) {
    ssSetErrorStatus(S,"Parameter 'Q' has to be a [1x1] array.");
    return;
  }
}

#endif                                 /* MDL_CHECK_PARAMETERS */

#if defined(RT_MALLOC) || defined(MATLAB_MEX_FILE)
#  include "Li_mid.h"
#endif

/* Function to initialize sizes. */
static void mdlInitializeSizes(SimStruct *S)
{
  ssSetNumSampleTimes(S, 2);           /* Number of sample times */
  ssSetNumContStates(S, 2);            /* Number of continuous states */
  ssSetNumNonsampledZCs(S, 0);         /* Number of nonsampled ZCs */
  ssSetZCCacheNeedsReset(S, 0);
  ssSetDerivCacheNeedsReset(S, 0);

  /* Number of output ports */
  if (!ssSetNumOutputPorts(S, 2))
    return;

  /* outport number: 0 */
  if (!ssSetOutputPortVectorDimension(S, 0, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 0, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 0, 0.0);
  ssSetOutputPortOffsetTime(S, 0, 0.0);
  ssSetOutputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);

  /* outport number: 1 */
  if (!ssSetOutputPortVectorDimension(S, 1, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 1, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 1, 0.0);
  ssSetOutputPortOffsetTime(S, 1, 0.0);
  ssSetOutputPortOptimOpts(S, 1, SS_REUSABLE_AND_LOCAL);

  /* Number of input ports */
  if (!ssSetNumInputPorts(S, 2))
    return;

  /* inport number: 0 */
  {
    if (!ssSetInputPortVectorDimension(S, 0, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 0, SS_DOUBLE);
    }

    ssSetInputPortSampleTime(S, 0, 0.0);
    ssSetInputPortOffsetTime(S, 0, 0.0);
    ssSetInputPortOverWritable(S, 0, 0);
    ssSetInputPortOptimOpts(S, 0, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 1 */
  {
    if (!ssSetInputPortVectorDimension(S, 1, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 1, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 1, 1);
    ssSetInputPortSampleTime(S, 1, 0.0);
    ssSetInputPortOffsetTime(S, 1, 1.0);
    ssSetInputPortOverWritable(S, 1, 0);
    ssSetInputPortOptimOpts(S, 1, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  ssSetRTWGeneratedSFcn(S, 1);         /* Generated S-function */

  /* Tunable Parameters */
  ssSetNumSFcnParams(S, 5);

  /* Number of expected parameters */
#if defined(MATLAB_MEX_FILE)

  if (ssGetNumSFcnParams(S) == ssGetSFcnParamsCount(S)) {

#if defined(MDL_CHECK_PARAMETERS)

    mdlCheckParameters(S);

#endif                                 /* MDL_CHECK_PARAMETERS */

    if (ssGetErrorStatus(S) != (NULL) ) {
      return;
    }
  } else {
    return;                            /* Parameter mismatch will be reported by Simulink */
  }

#endif                                 /* MATLAB_MEX_FILE */

  /* Options */
  ssSetOptions(S, (SS_OPTION_RUNTIME_EXCEPTION_FREE_CODE |
                   SS_OPTION_PORT_SAMPLE_TIMES_ASSIGNED ));

#if SS_SFCN_FOR_SIM

  {
    ssSupportsMultipleExecInstances(S, false);
    ssHasStateInsideForEachSS(S, false);
  }

#endif

}

/* Function to initialize sample times. */
static void mdlInitializeSampleTimes(SimStruct *S)
{
  /* task periods */
  ssSetSampleTime(S, 0, 0.0);
  ssSetSampleTime(S, 1, 0.0);

  /* task offsets */
  ssSetOffsetTime(S, 0, 0.0);
  ssSetOffsetTime(S, 1, 1.0);
}

#if defined(MATLAB_MEX_FILE)
# include "fixedpoint.c"
# include "simulink.c"
#else
# undef S_FUNCTION_NAME
# define S_FUNCTION_NAME               Li_sf
# include "cg_sfun.h"
#endif                                 /* defined(MATLAB_MEX_FILE) */
