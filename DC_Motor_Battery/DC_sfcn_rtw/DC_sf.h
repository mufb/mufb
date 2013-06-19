/*
 * DC_sf.h
 *
 * Code generation for model "DC_sf.mdl".
 *
 * Model version              : 1.43
 * Simulink Coder version : 8.0 (R2011a) 09-Mar-2011
 * C source code generated on : Wed Jun 19 07:39:21 2013
 *
 * Target selection: rtwsfcn.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: 32-bit Generic
 * Emulation hardware selection:
 *    Differs from embedded hardware (MATLAB Host)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */
#ifndef RTW_HEADER_DC_sf_h_
#define RTW_HEADER_DC_sf_h_
#ifndef DC_sf_COMMON_INCLUDES_
# define DC_sf_COMMON_INCLUDES_
#include <stdlib.h>
#include <stddef.h>
#include <string.h>
#define S_FUNCTION_NAME                DC_sf
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
#endif                                 /* DC_sf_COMMON_INCLUDES_ */

#include "DC_sf_types.h"

/* Block signals (auto storage) */
typedef struct {
  real_T Add;                          /* '<S1>/Add' */
  real_T Add1;                         /* '<S1>/Add1' */
} BlockIO_DC;

/* Continuous states (auto storage) */
typedef struct {
  real_T Integrator_CSTATE;            /* '<S1>/Integrator' */
  real_T Integrator1_CSTATE;           /* '<S1>/Integrator1' */
} ContinuousStates_DC;

/* State derivatives (auto storage) */
typedef struct {
  real_T Integrator_CSTATE;            /* '<S1>/Integrator' */
  real_T Integrator1_CSTATE;           /* '<S1>/Integrator1' */
} StateDerivatives_DC;

/* State disabled  */
typedef struct {
  boolean_T Integrator_CSTATE;         /* '<S1>/Integrator' */
  boolean_T Integrator1_CSTATE;        /* '<S1>/Integrator1' */
} StateDisabled_DC;

/* External inputs (root inport signals with auto storage) */
typedef struct {
  real_T *Uz;                          /* '<Root>/Uz' */
} ExternalUPtrs_DC;

/* External outputs (root outports fed by signals with auto storage) */
typedef struct {
  real_T *Iw;                          /* '<Root>/Iw' */
  real_T *Ws;                          /* '<Root>/Ws' */
} ExternalOutputs_DC;

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
 * hilite_system('Model/DC Motor(ver 2)')    - opens subsystem Model/DC Motor(ver 2)
 * hilite_system('Model/DC Motor(ver 2)/Kp') - opens and selects block Kp
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : Model
 * '<S1>'   : Model/DC Motor(ver 2)
 */
#endif                                 /* RTW_HEADER_DC_sf_h_ */
