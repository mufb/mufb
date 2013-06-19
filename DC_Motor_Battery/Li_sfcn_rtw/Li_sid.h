/*
 * Li_sid.h
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
 *
 * SOURCES: Li_sf.c
 */

/* statically allocated instance data for model: Li */
{
  extern Parameters_Li Li_DefaultParameters;

  {
    /* Local SimStruct for the generated S-Function */
    static LocalS slS;
    LocalS *lS = &slS;
    ssSetUserData(rts, lS);

    /* block I/O */
    {
      static BlockIO_Li sfcnB;
      void *b = (real_T *) &sfcnB;
      ssSetLocalBlockIO(rts, b);
      (void) memset(b, 0,
                    sizeof(BlockIO_Li));
    }

    /* model parameters */
    ssSetLocalDefaultParam(rts, (real_T *) &Li_DefaultParameters);

    /* model checksums */
    ssSetChecksumVal(rts, 0, 966729547U);
    ssSetChecksumVal(rts, 1, 907136175U);
    ssSetChecksumVal(rts, 2, 800593029U);
    ssSetChecksumVal(rts, 3, 25621726U);
  }
}
