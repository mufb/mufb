/*
 * Li_sf.h
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
#ifndef RTW_HEADER_Li_sf_h_
#define RTW_HEADER_Li_sf_h_
#ifndef Li_sf_COMMON_INCLUDES_
# define Li_sf_COMMON_INCLUDES_
#include <stdlib.h>
#include <stddef.h>
#include <math.h>
#include <string.h>
#define S_FUNCTION_NAME                Li_sf
#define S_FUNCTION_LEVEL               2
#define RTW_GENERATED_S_FUNCTION
#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "rt_nonfinite.h"
#if !defined(RTW_SFUNCTION_DEFINES)
#define RTW_SFUNCTION_DEFINES

typedef struct {
  void *blockIO;
  void *defaultParam;
  void *nonContDerivSig;
} LocalS;

#define ssSetLocalBlockIO(S, io)       ((LocalS *)ssGetUserData(S))->blockIO = ((void *)(io))
#define ssGetLocalBlockIO(S)           ((LocalS *)ssGetUserData(S))->blockIO
#define ssSetLocalDefaultParam(S, paramVector) ((LocalS *)ssGetUserData(S))->defaultParam = (paramVector)
#define ssGetLocalDefaultParam(S)      ((LocalS *)ssGetUserData(S))->defaultParam
#define ssSetLocalNonContDerivSig(S, pSig) ((LocalS *)ssGetUserData(S))->nonContDerivSig = (pSig)
#define ssGetLocalNonContDerivSig(S)   ((LocalS *)ssGetUserData(S))->nonContDerivSig
#endif
#endif                                 /* Li_sf_COMMON_INCLUDES_ */

#include "Li_sf_types.h"

/* Block signals (auto storage) */
typedef struct {
  real_T Gain3;                        /* '<S3>/Gain3' */
} BlockIO_Li;

/* Continuous states (auto storage) */
typedef struct {
  real_T Integrator_CSTATE;            /* '<S1>/Integrator' */
  real_T Lowpassfilter_CSTATE;         /* '<S1>/Low-pass filter' */
} ContinuousStates_Li;

/* State derivatives (auto storage) */
typedef struct {
  real_T Integrator_CSTATE;            /* '<S1>/Integrator' */
  real_T Lowpassfilter_CSTATE;         /* '<S1>/Low-pass filter' */
} StateDerivatives_Li;

/* State disabled  */
typedef struct {
  boolean_T Integrator_CSTATE;         /* '<S1>/Integrator' */
  boolean_T Lowpassfilter_CSTATE;      /* '<S1>/Low-pass filter' */
} StateDisabled_Li;

/* External inputs (root inport signals with auto storage) */
typedef struct {
  real_T *i;                           /* '<Root>/curr_cons' */
  real_T *chrgdch;                     /* '<Root>/chrg//dch' */
} ExternalUPtrs_Li;

/* External outputs (root outports fed by signals with auto storage) */
typedef struct {
  real_T *voltage;                     /* '<Root>/voltage' */
  real_T *energy_left;                 /* '<Root>/energy_left' */
} ExternalOutputs_Li;

/* Parameters (auto storage) */
struct Parameters_Li_ {
  real_T A;                            /* Variable: A
                                        * Referenced by:
                                        *   '<S3>/Gain1'
                                        *   '<S4>/Gain1'
                                        */
  real_T C;                            /* Variable: C
                                        * Referenced by:
                                        *   '<S3>/Gain2'
                                        *   '<S4>/Gain2'
                                        */
  real_T E0;                           /* Variable: E0
                                        * Referenced by:
                                        *   '<S3>/Constant3'
                                        *   '<S4>/Constant3'
                                        */
  real_T K;                            /* Variable: K
                                        * Referenced by:
                                        *   '<S3>/Gain'
                                        *   '<S4>/Gain'
                                        */
  real_T Q;                            /* Variable: Q
                                        * Referenced by:
                                        *   '<S1>/chrg//dischrg1'
                                        *   '<S3>/Constant1'
                                        *   '<S3>/Constant4'
                                        *   '<S3>/Gain'
                                        *   '<S4>/Constant4'
                                        *   '<S4>/Gain'
                                        */
};

extern Parameters_Li Li_DefaultParameters;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Note that this particular code originates from a subsystem build,
 * and has its own system numbers different from the parent model.
 * Refer to the system hierarchy for this subsystem below, and use the
 * MATLAB hilite_system command to trace the generated code back
 * to the parent model.  For example,
 *
 * hilite_system('Model/Li-Ion Battery')    - opens subsystem Model/Li-Ion Battery
 * hilite_system('Model/Li-Ion Battery/Kp') - opens and selects block Kp
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : Model
 * '<S1>'   : Model/Li-Ion Battery
 * '<S2>'   : Model/Li-Ion Battery/Chrg//Dis
 * '<S3>'   : Model/Li-Ion Battery/Chrg//Dis/Charge
 * '<S4>'   : Model/Li-Ion Battery/Chrg//Dis/Discharge
 */
#endif                                 /* RTW_HEADER_Li_sf_h_ */
