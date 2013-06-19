/*
 * Li_sf_data.c
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

#include "Li_sf.h"
#include "Li_sf_private.h"

/* Block parameters (auto storage) */
Parameters_Li Li_DefaultParameters = {
  0.1,                                 /* Variable: A
                                        * Referenced by:
                                        *   '<S3>/Gain1'
                                        *   '<S4>/Gain1'
                                        */
  100.0,                               /* Variable: C
                                        * Referenced by:
                                        *   '<S3>/Gain2'
                                        *   '<S4>/Gain2'
                                        */
  10.0,                                /* Variable: E0
                                        * Referenced by:
                                        *   '<S3>/Constant3'
                                        *   '<S4>/Constant3'
                                        */
  5.0E-5,                              /* Variable: K
                                        * Referenced by:
                                        *   '<S3>/Gain'
                                        *   '<S4>/Gain'
                                        */
  1000.0                               /* Variable: Q
                                        * Referenced by:
                                        *   '<S1>/chrg//dischrg1'
                                        *   '<S3>/Constant1'
                                        *   '<S3>/Constant4'
                                        *   '<S3>/Gain'
                                        *   '<S4>/Constant4'
                                        *   '<S4>/Gain'
                                        */
};
