/*
 * DC_sid.h
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
 *
 * SOURCES: DC_sf.c
 */

/* statically allocated instance data for model: DC */
{
  {
    /* Local SimStruct for the generated S-Function */
    static LocalS slS;
    LocalS *lS = &slS;
    ssSetUserData(rts, lS);

    /* block I/O */
    {
      static BlockIO_DC sfcnB;
      void *b = (real_T *) &sfcnB;
      ssSetLocalBlockIO(rts, b);
      (void) memset(b, 0,
                    sizeof(BlockIO_DC));
    }

    /* model checksums */
    ssSetChecksumVal(rts, 0, 2262159780U);
    ssSetChecksumVal(rts, 1, 356853538U);
    ssSetChecksumVal(rts, 2, 2732028286U);
    ssSetChecksumVal(rts, 3, 1954890828U);
  }
}
