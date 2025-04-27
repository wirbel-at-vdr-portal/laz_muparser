unit muParserDLL;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,
    {$IfDef WINDOWS}
      windows,dynlibs  { NOTE: Lazarus needs unit dynlibs to allow DLL loading on Windows }
    {$ENDIF}
    ;


{*******************************************************************************
 * This file contains the DLL interface of muparser.                           *
 *******************************************************************************}

type

{ Basic types }
  handle_t = pointer;           { typedef void* muParserHandle_t;    // parser handle }
 {muChar_t = char;}             { assume _UNICODE is not defined during DLL build.    }
  iBool = integer;              { typedef int    muBool_t;           // boolean type  }
                                { typedef int    muInt_t;            // integer type  }
                                { typedef double muFloat_t;          // floating point type } 


  { function types for calculation }
  muFun0_t          = function:double;                                                                                                                                                                                                                                                                              { typedef muFloat_t(*muFun0_t)(void);                                                                                                                         }
  muFun1_t          = function(a1:double):double;                                                                                                                                                                                                                                                                   { typedef muFloat_t(*muFun1_t)(muFloat_t);                                                                                                                    }
  muFun2_t          = function(a1:double;a2:double):double;                                                                                                                                                                                                                                                         { typedef muFloat_t(*muFun2_t)(muFloat_t, muFloat_t);                                                                                                         }
  muFun3_t          = function(a1:double;a2:double;a3:double):double;                                                                                                                                                                                                                                               { typedef muFloat_t(*muFun3_t)(muFloat_t, muFloat_t, muFloat_t);                                                                                              }
  muFun4_t          = function(a1:double;a2:double;a3:double;a4:double):double;                                                                                                                                                                                                                                     { typedef muFloat_t(*muFun4_t)(muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                                                                   }
  muFun5_t          = function(a1:double;a2:double;a3:double;a4:double;a5:double):double;                                                                                                                                                                                                                           { typedef muFloat_t(*muFun5_t)(muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                                                        }
  muFun6_t          = function(a1:double;a2:double;a3:double;a4:double;a5:double;a6:double):double;                                                                                                                                                                                                                 { typedef muFloat_t(*muFun6_t)(muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                                             }
  muFun7_t          = function(a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double):double;                                                                                                                                                                                                       { typedef muFloat_t(*muFun7_t)(muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                                  }
  muFun8_t          = function(a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double;a8:double):double;                                                                                                                                                                                             { typedef muFloat_t(*muFun8_t)(muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                       }
  muFun9_t          = function(a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double;a8:double;a9:double):double;                                                                                                                                                                                   { typedef muFloat_t(*muFun9_t)(muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                            }
  muFun10_t         = function(a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double;a8:double;a9:double;a10:double):double;                                                                                                                                                                        { typedef muFloat_t(*muFun10_t)(muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                }
  muFunUserData0_t  = function(u:pointer):double;                                                                                                                                                                                                                                                                   { typedef muFloat_t(*muFunUserData0_t )(void*);                                                                                                               }
  muFunUserData1_t  = function(u:pointer;a1:double):double;                                                                                                                                                                                                                                                         { typedef muFloat_t(*muFunUserData1_t )(void*, muFloat_t);                                                                                                    }
  muFunUserData2_t  = function(u:pointer;a1:double;a2:double):double;                                                                                                                                                                                                                                               { typedef muFloat_t(*muFunUserData2_t )(void*, muFloat_t, muFloat_t);                                                                                         }
  muFunUserData3_t  = function(u:pointer;a1:double;a2:double;a3:double):double;                                                                                                                                                                                                                                     { typedef muFloat_t(*muFunUserData3_t )(void*, muFloat_t, muFloat_t, muFloat_t);                                                                              }
  muFunUserData4_t  = function(u:pointer;a1:double;a2:double;a3:double;a4:double):double;                                                                                                                                                                                                                           { typedef muFloat_t(*muFunUserData4_t )(void*, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                                                   }
  muFunUserData5_t  = function(u:pointer;a1:double;a2:double;a3:double;a4:double;a5:double):double;                                                                                                                                                                                                                 { typedef muFloat_t(*muFunUserData5_t )(void*, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                                        }
  muFunUserData6_t  = function(u:pointer;a1:double;a2:double;a3:double;a4:double;a5:double;a6:double):double;                                                                                                                                                                                                       { typedef muFloat_t(*muFunUserData6_t )(void*, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                             }
  muFunUserData7_t  = function(u:pointer;a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double):double;                                                                                                                                                                                             { typedef muFloat_t(*muFunUserData7_t )(void*, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                  }
  muFunUserData8_t  = function(u:pointer;a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double;a8:double):double;                                                                                                                                                                                   { typedef muFloat_t(*muFunUserData8_t )(void*, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                       }
  muFunUserData9_t  = function(u:pointer;a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double;a8:double;a9:double):double;                                                                                                                                                                         { typedef muFloat_t(*muFunUserData9_t )(void*, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);            }
  muFunUserData10_t = function(u:pointer;a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double;a8:double;a9:double;a10:double):double;                                                                                                                                                              { typedef muFloat_t(*muFunUserData10_t)(void*, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t); }



  { Function prototypes for bulkmode functions }
  muBulkFun0_t          = function(i1:integer;i2:integer):double;                                                                                                                                                                                                                                                   { typedef muFloat_t(*muBulkFun0_t)(int, int);                                                                                                                }
  muBulkFun1_t          = function(i1:integer;i2:integer;a1:double):double;                                                                                                                                                                                                                                         { typedef muFloat_t(*muBulkFun1_t)(int, int, muFloat_t);                                                                                                     }
  muBulkFun2_t          = function(i1:integer;i2:integer;a1:double;a2:double):double;                                                                                                                                                                                                                               { typedef muFloat_t(*muBulkFun2_t)(int, int, muFloat_t, muFloat_t);                                                                                          }
  muBulkFun3_t          = function(i1:integer;i2:integer;a1:double;a2:double;a3:double):double;                                                                                                                                                                                                                     { typedef muFloat_t(*muBulkFun3_t)(int, int, muFloat_t, muFloat_t, muFloat_t);                                                                               }
  muBulkFun4_t          = function(i1:integer;i2:integer;a1:double;a2:double;a3:double;a4:double):double;                                                                                                                                                                                                           { typedef muFloat_t(*muBulkFun4_t)(int, int, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                                                    }
  muBulkFun5_t          = function(i1:integer;i2:integer;a1:double;a2:double;a3:double;a4:double;a5:double):double;                                                                                                                                                                                                 { typedef muFloat_t(*muBulkFun5_t)(int, int, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                                         }
  muBulkFun6_t          = function(i1:integer;i2:integer;a1:double;a2:double;a3:double;a4:double;a5:double;a6:double):double;                                                                                                                                                                                       { typedef muFloat_t(*muBulkFun6_t)(int, int, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                              }
  muBulkFun7_t          = function(i1:integer;i2:integer;a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double):double;                                                                                                                                                                             { typedef muFloat_t(*muBulkFun7_t)(int, int, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                   }
  muBulkFun8_t          = function(i1:integer;i2:integer;a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double;a8:double):double;                                                                                                                                                                   { typedef muFloat_t(*muBulkFun8_t)(int, int, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                        }
  muBulkFun9_t          = function(i1:integer;i2:integer;a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double;a8:double;a9:double):double;                                                                                                                                                         { typedef muFloat_t(*muBulkFun9_t)(int, int, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);             }
  muBulkFun10_t         = function(i1:integer;i2:integer;a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double;a8:double;a9:double;a10:double):double;                                                                                                                                              { typedef muFloat_t(*muBulkFun10_t)(int, int, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t); }
  muBulkFunUserData0_t  = function(u:pointer;i1:integer;i2:integer):double;                                                                                                                                                                                                                                         { typedef muFloat_t(*muBulkFunUserData0_t)(void*, int, int);                                                                                                                }
  muBulkFunUserData1_t  = function(u:pointer;i1:integer;i2:integer;a1:double):double;                                                                                                                                                                                                                               { typedef muFloat_t(*muBulkFunUserData1_t)(void*, int, int, muFloat_t);                                                                                                     }
  muBulkFunUserData2_t  = function(u:pointer;i1:integer;i2:integer;a1:double;a2:double):double;                                                                                                                                                                                                                     { typedef muFloat_t(*muBulkFunUserData2_t)(void*, int, int, muFloat_t, muFloat_t);                                                                                          }
  muBulkFunUserData3_t  = function(u:pointer;i1:integer;i2:integer;a1:double;a2:double;a3:double):double;                                                                                                                                                                                                           { typedef muFloat_t(*muBulkFunUserData3_t)(void*, int, int, muFloat_t, muFloat_t, muFloat_t);                                                                               }
  muBulkFunUserData4_t  = function(u:pointer;i1:integer;i2:integer;a1:double;a2:double;a3:double;a4:double):double;                                                                                                                                                                                                 { typedef muFloat_t(*muBulkFunUserData4_t)(void*, int, int, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                                                    }
  muBulkFunUserData5_t  = function(u:pointer;i1:integer;i2:integer;a1:double;a2:double;a3:double;a4:double;a5:double):double;                                                                                                                                                                                       { typedef muFloat_t(*muBulkFunUserData5_t)(void*, int, int, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                                         }
  muBulkFunUserData6_t  = function(u:pointer;i1:integer;i2:integer;a1:double;a2:double;a3:double;a4:double;a5:double;a6:double):double;                                                                                                                                                                             { typedef muFloat_t(*muBulkFunUserData6_t)(void*, int, int, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                              }
  muBulkFunUserData7_t  = function(u:pointer;i1:integer;i2:integer;a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double):double;                                                                                                                                                                   { typedef muFloat_t(*muBulkFunUserData7_t)(void*, int, int, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                   }
  muBulkFunUserData8_t  = function(u:pointer;i1:integer;i2:integer;a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double;a8:double):double;                                                                                                                                                         { typedef muFloat_t(*muBulkFunUserData8_t)(void*, int, int, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                        }
  muBulkFunUserData9_t  = function(u:pointer;i1:integer;i2:integer;a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double;a8:double;a9:double):double;                                                                                                                                               { typedef muFloat_t(*muBulkFunUserData9_t)(void*, int, int, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t);             }
  muBulkFunUserData10_t = function(u:pointer;i1:integer;i2:integer;a1:double;a2:double;a3:double;a4:double;a5:double;a6:double;a7:double;a8:double;a9:double;a10:double):double;                                                                                                                                    { typedef muFloat_t(*muBulkFunUserData10_t)(void*, int, int, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t, muFloat_t); }

  muMultFun_t           = function(          a1:pdouble;i1:integer):double;                                                                                                                                                                                                                                         { typedef muFloat_t(*muMultFun_t)        (       const muFloat_t*, muInt_t);                                                                                            }
  muMultFunUserData_t   = function(u:pointer;a1:pdouble;i1:integer):double;                                                                                                                                                                                                                                         { typedef muFloat_t(*muMultFunUserData_t)(void*, const muFloat_t*, muInt_t); // with user data (not null)                                                               }

  muStrFun1_t           = function(s1:pChar):double;                                                                                                                                                                                                                                                                { typedef muFloat_t(*muStrFun1_t)(const muChar_t*);                                                                                                                     }
  muStrFun2_t           = function(s1:pChar;a1:double):double;                                                                                                                                                                                                                                                      { typedef muFloat_t(*muStrFun2_t)(const muChar_t*, muFloat_t);                                                                                                          }
  muStrFun3_t           = function(s1:pChar;a1:double;a2:double):double;                                                                                                                                                                                                                                            { typedef muFloat_t(*muStrFun3_t)(const muChar_t*, muFloat_t, muFloat_t);                                                                                               }
  muStrFun4_t           = function(s1:pChar;a1:double;a2:double;a3:double):double;                                                                                                                                                                                                                                  { typedef muFloat_t(*muStrFun4_t)(const muChar_t*, muFloat_t, muFloat_t, muFloat_t);                                                                                    }
  muStrFun5_t           = function(s1:pChar;a1:double;a2:double;a3:double;a4:double):double;                                                                                                                                                                                                                        { typedef muFloat_t(*muStrFun5_t)(const muChar_t*, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                                                         }
  muStrFunUserData1_t   = function(u:pointer;s1:pChar):double;                                                                                                                                                                                                                                                      { typedef muFloat_t(*muStrFunUserData1_t)(void*, const muChar_t*);                                                                                                      }
  muStrFunUserData2_t   = function(u:pointer;s1:pChar;a1:double):double;                                                                                                                                                                                                                                            { typedef muFloat_t(*muStrFunUserData2_t)(void*, const muChar_t*, muFloat_t);                                                                                           }
  muStrFunUserData3_t   = function(u:pointer;s1:pChar;a1:double;a2:double):double;                                                                                                                                                                                                                                  { typedef muFloat_t(*muStrFunUserData3_t)(void*, const muChar_t*, muFloat_t, muFloat_t);                                                                                }
  muStrFunUserData4_t   = function(u:pointer;s1:pChar;a1:double;a2:double;a3:double):double;                                                                                                                                                                                                                        { typedef muFloat_t(*muStrFunUserData4_t)(void*, const muChar_t*, muFloat_t, muFloat_t, muFloat_t);                                                                     }
  muStrFunUserData5_t   = function(u:pointer;s1:pChar;a1:double;a2:double;a3:double;a4:double):double;                                                                                                                                                                                                              { typedef muFloat_t(*muStrFunUserData5_t)(void*, const muChar_t*, muFloat_t, muFloat_t, muFloat_t, muFloat_t);                                                          }

  { Functions for parser management }
  muFacFun_t            = function(s1:pChar;p:pointer):pdouble;                                                                                                                                                                                                                                                     { typedef muFloat_t* (*muFacFun_t)(const muChar_t*, void*);     // [optional] callback for creating new variables                                                       }
  muIdentFun_t          = function(s1:pChar;i1:pinteger;f1:pdouble):integer;                                                                                                                                                                                                                                        { typedef muInt_t(*muIdentFun_t)(const muChar_t*, muInt_t*, muFloat_t*); // [optional] value identification callbacks                                                   }


  const
     muOPRT_ASCT_LEFT :integer = 0;
     muOPRT_ASCT_RIGHT:integer = 1;
     muBASETYPE_FLOAT :integer = 0;
     muBASETYPE_INT   :integer = 1;

  type

  { muParser C compatible bindings }

  { Basic operations / initialization }
  TmupCreate                  = function(BaseType:integer):handle_t;                                                                                                                                                                                                                                                          cdecl; { API_EXPORT(muParserHandle_t) mupCreate(int nBaseType);                                                                                                                }
  TmupRelease                 = procedure( h:handle_t);                                                                                                                                                                                                                                                                       cdecl; { API_EXPORT(void) mupRelease(muParserHandle_t a_hParser);                                                                                                              }
  TmupGetExpr                 = function ( h:handle_t):pChar;                                                                                                                                                                                                                                                                 cdecl; { API_EXPORT(const muChar_t*) mupGetExpr(muParserHandle_t a_hParser);                                                                                                   }
  TmupSetExpr                 = procedure( h:handle_t;expr:pChar);                                                                                                                                                                                                                                                            cdecl; { API_EXPORT(void) mupSetExpr(muParserHandle_t a_hParser, const muChar_t* a_szExpr);                                                                                    }
  TmupSetVarFactory           = procedure( h:handle_t;pFactory:muFacFun_t;UserData:pointer);                                                                                                                                                                                                                                  cdecl; { API_EXPORT(void) mupSetVarFactory(muParserHandle_t a_hParser, muFacFun_t a_pFactory, void* pUserData);                                                                }
  TmupGetVersion              = function ( h:handle_t):pChar;                                                                                                                                                                                                                                                                 cdecl; { API_EXPORT(const muChar_t*) mupGetVersion(muParserHandle_t a_hParser);                                                                                                }
  TmupEval                    = function ( h:handle_t):double;                                                                                                                                                                                                                                                                cdecl; { API_EXPORT(muFloat_t) mupEval(muParserHandle_t a_hParser);                                                                                                            }
  TmupEvalMulti               = function ( h:handle_t;num:pInteger):pdouble;                                                                                                                                                                                                                                                  cdecl; { API_EXPORT(muFloat_t*) mupEvalMulti(muParserHandle_t a_hParser, int* nNum);                                                                                           }
  TmupEvalBulk                = procedure( h:handle_t;result:pdouble;size:integer);                                                                                                                                                                                                                                           cdecl; { API_EXPORT(void) mupEvalBulk(muParserHandle_t a_hParser, muFloat_t* a_fResult, int nSize);                                                                            }


  { Defining callbacks / variables / constants }
  TmupDefineFun0              = procedure( h:handle_t;name:pChar;pFunction:muFun0_t ;optimize:iBool);                                   cdecl; { API_EXPORT(void) mupDefineFun0(muParserHandle_t a_hParser, const muChar_t* a_szName, muFun0_t a_pFun, muBool_t a_bOptimize);                                          }
  TmupDefineFun1              = procedure( h:handle_t;name:pChar;pFunction:muFun1_t ;optimize:iBool);                                   cdecl; { API_EXPORT(void) mupDefineFun1(muParserHandle_t a_hParser, const muChar_t* a_szName, muFun1_t a_pFun, muBool_t a_bOptimize);                                          }
  TmupDefineFun2              = procedure( h:handle_t;name:pChar;pFunction:muFun2_t ;optimize:iBool);                                   cdecl; { API_EXPORT(void) mupDefineFun2(muParserHandle_t a_hParser, const muChar_t* a_szName, muFun2_t a_pFun, muBool_t a_bOptimize);                                          }
  TmupDefineFun3              = procedure( h:handle_t;name:pChar;pFunction:muFun3_t ;optimize:iBool);                                   cdecl; { API_EXPORT(void) mupDefineFun3(muParserHandle_t a_hParser, const muChar_t* a_szName, muFun3_t a_pFun, muBool_t a_bOptimize);                                          }
  TmupDefineFun4              = procedure( h:handle_t;name:pChar;pFunction:muFun4_t ;optimize:iBool);                                   cdecl; { API_EXPORT(void) mupDefineFun4(muParserHandle_t a_hParser, const muChar_t* a_szName, muFun4_t a_pFun, muBool_t a_bOptimize);                                          }
  TmupDefineFun5              = procedure( h:handle_t;name:pChar;pFunction:muFun5_t ;optimize:iBool);                                   cdecl; { API_EXPORT(void) mupDefineFun5(muParserHandle_t a_hParser, const muChar_t* a_szName, muFun5_t a_pFun, muBool_t a_bOptimize);                                          }
  TmupDefineFun6              = procedure( h:handle_t;name:pChar;pFunction:muFun6_t ;optimize:iBool);                                   cdecl; { API_EXPORT(void) mupDefineFun6(muParserHandle_t a_hParser, const muChar_t* a_szName, muFun6_t a_pFun, muBool_t a_bOptimize);                                          }
  TmupDefineFun7              = procedure( h:handle_t;name:pChar;pFunction:muFun7_t ;optimize:iBool);                                   cdecl; { API_EXPORT(void) mupDefineFun7(muParserHandle_t a_hParser, const muChar_t* a_szName, muFun7_t a_pFun, muBool_t a_bOptimize);                                          }
  TmupDefineFun8              = procedure( h:handle_t;name:pChar;pFunction:muFun8_t ;optimize:iBool);                                   cdecl; { API_EXPORT(void) mupDefineFun8(muParserHandle_t a_hParser, const muChar_t* a_szName, muFun8_t a_pFun, muBool_t a_bOptimize);                                          }
  TmupDefineFun9              = procedure( h:handle_t;name:pChar;pFunction:muFun9_t ;optimize:iBool);                                   cdecl; { API_EXPORT(void) mupDefineFun9(muParserHandle_t a_hParser, const muChar_t* a_szName, muFun9_t a_pFun, muBool_t a_bOptimize);                                          }
  TmupDefineFun10             = procedure( h:handle_t;name:pChar;pFunction:muFun10_t;optimize:iBool);                                   cdecl; { API_EXPORT(void) mupDefineFun10(muParserHandle_t a_hParser, const muChar_t* a_szName, muFun10_t a_pFun, muBool_t a_bOptimize);                                        }
  TmupDefineFunUserData0      = procedure( h:handle_t;name:pChar;pFunction:muFunUserData0_t ;userdata:pointer;optimize:iBool);          cdecl; { API_EXPORT(void) mupDefineFunUserData0(muParserHandle_t a_hParser, const muChar_t* a_szName, muFunUserData0_t a_pFun, void* a_pUserData, muBool_t a_bOptimize);       }
  TmupDefineFunUserData1      = procedure( h:handle_t;name:pChar;pFunction:muFunUserData1_t ;userdata:pointer;optimize:iBool);          cdecl; { API_EXPORT(void) mupDefineFunUserData1(muParserHandle_t a_hParser, const muChar_t* a_szName, muFunUserData1_t a_pFun, void* a_pUserData, muBool_t a_bOptimize);       }
  TmupDefineFunUserData2      = procedure( h:handle_t;name:pChar;pFunction:muFunUserData2_t ;userdata:pointer;optimize:iBool);          cdecl; { API_EXPORT(void) mupDefineFunUserData2(muParserHandle_t a_hParser, const muChar_t* a_szName, muFunUserData2_t a_pFun, void* a_pUserData, muBool_t a_bOptimize);       }
  TmupDefineFunUserData3      = procedure( h:handle_t;name:pChar;pFunction:muFunUserData3_t ;userdata:pointer;optimize:iBool);          cdecl; { API_EXPORT(void) mupDefineFunUserData3(muParserHandle_t a_hParser, const muChar_t* a_szName, muFunUserData3_t a_pFun, void* a_pUserData, muBool_t a_bOptimize);       }
  TmupDefineFunUserData4      = procedure( h:handle_t;name:pChar;pFunction:muFunUserData4_t ;userdata:pointer;optimize:iBool);          cdecl; { API_EXPORT(void) mupDefineFunUserData4(muParserHandle_t a_hParser, const muChar_t* a_szName, muFunUserData4_t a_pFun, void* a_pUserData, muBool_t a_bOptimize);       }
  TmupDefineFunUserData5      = procedure( h:handle_t;name:pChar;pFunction:muFunUserData5_t ;userdata:pointer;optimize:iBool);          cdecl; { API_EXPORT(void) mupDefineFunUserData5(muParserHandle_t a_hParser, const muChar_t* a_szName, muFunUserData5_t a_pFun, void* a_pUserData, muBool_t a_bOptimize);       }
  TmupDefineFunUserData6      = procedure( h:handle_t;name:pChar;pFunction:muFunUserData6_t ;userdata:pointer;optimize:iBool);          cdecl; { API_EXPORT(void) mupDefineFunUserData6(muParserHandle_t a_hParser, const muChar_t* a_szName, muFunUserData6_t a_pFun, void* a_pUserData, muBool_t a_bOptimize);       }
  TmupDefineFunUserData7      = procedure( h:handle_t;name:pChar;pFunction:muFunUserData7_t ;userdata:pointer;optimize:iBool);          cdecl; { API_EXPORT(void) mupDefineFunUserData7(muParserHandle_t a_hParser, const muChar_t* a_szName, muFunUserData7_t a_pFun, void* a_pUserData, muBool_t a_bOptimize);       }
  TmupDefineFunUserData8      = procedure( h:handle_t;name:pChar;pFunction:muFunUserData8_t ;userdata:pointer;optimize:iBool);          cdecl; { API_EXPORT(void) mupDefineFunUserData8(muParserHandle_t a_hParser, const muChar_t* a_szName, muFunUserData8_t a_pFun, void* a_pUserData, muBool_t a_bOptimize);       }
  TmupDefineFunUserData9      = procedure( h:handle_t;name:pChar;pFunction:muFunUserData9_t ;userdata:pointer;optimize:iBool);          cdecl; { API_EXPORT(void) mupDefineFunUserData9(muParserHandle_t a_hParser, const muChar_t* a_szName, muFunUserData9_t a_pFun, void* a_pUserData, muBool_t a_bOptimize);       }
  TmupDefineFunUserData10     = procedure( h:handle_t;name:pChar;pFunction:muFunUserData10_t;userdata:pointer;optimize:iBool);          cdecl; { API_EXPORT(void) mupDefineFunUserData10(muParserHandle_t a_hParser, const muChar_t* a_szName, muFunUserData10_t a_pFun, void* a_pUserData, muBool_t a_bOptimize);     }

  { Defining bulkmode functions }
  TmupDefineBulkFun0          = procedure( h:handle_t;name:pChar;pFunction:muBulkFun0_t );                                              cdecl; { API_EXPORT(void) mupDefineBulkFun0(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFun0_t a_pFun);                                                        }
  TmupDefineBulkFun1          = procedure( h:handle_t;name:pChar;pFunction:muBulkFun1_t );                                              cdecl; { API_EXPORT(void) mupDefineBulkFun1(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFun1_t a_pFun);                                                        }
  TmupDefineBulkFun2          = procedure( h:handle_t;name:pChar;pFunction:muBulkFun2_t );                                              cdecl; { API_EXPORT(void) mupDefineBulkFun2(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFun2_t a_pFun);                                                        }
  TmupDefineBulkFun3          = procedure( h:handle_t;name:pChar;pFunction:muBulkFun3_t );                                              cdecl; { API_EXPORT(void) mupDefineBulkFun3(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFun3_t a_pFun);                                                        }
  TmupDefineBulkFun4          = procedure( h:handle_t;name:pChar;pFunction:muBulkFun4_t );                                              cdecl; { API_EXPORT(void) mupDefineBulkFun4(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFun4_t a_pFun);                                                        }
  TmupDefineBulkFun5          = procedure( h:handle_t;name:pChar;pFunction:muBulkFun5_t );                                              cdecl; { API_EXPORT(void) mupDefineBulkFun5(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFun5_t a_pFun);                                                        }
  TmupDefineBulkFun6          = procedure( h:handle_t;name:pChar;pFunction:muBulkFun6_t );                                              cdecl; { API_EXPORT(void) mupDefineBulkFun6(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFun6_t a_pFun);                                                        }
  TmupDefineBulkFun7          = procedure( h:handle_t;name:pChar;pFunction:muBulkFun7_t );                                              cdecl; { API_EXPORT(void) mupDefineBulkFun7(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFun7_t a_pFun);                                                        }
  TmupDefineBulkFun8          = procedure( h:handle_t;name:pChar;pFunction:muBulkFun8_t );                                              cdecl; { API_EXPORT(void) mupDefineBulkFun8(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFun8_t a_pFun);                                                        }
  TmupDefineBulkFun9          = procedure( h:handle_t;name:pChar;pFunction:muBulkFun9_t );                                              cdecl; { API_EXPORT(void) mupDefineBulkFun9(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFun9_t a_pFun);                                                        }
  TmupDefineBulkFun10         = procedure( h:handle_t;name:pChar;pFunction:muBulkFun10_t);                                              cdecl; { API_EXPORT(void) mupDefineBulkFun10(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFun10_t a_pFun);                                                      }
  TmupDefineBulkFunUserData0  = procedure( h:handle_t;name:pChar;pFunction:muBulkFunUserData0_t ;userdata:pointer);                     cdecl; { API_EXPORT(void) mupDefineBulkFunUserData0(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFunUserData0_t a_pFun, void* a_pUserData);                     }
  TmupDefineBulkFunUserData1  = procedure( h:handle_t;name:pChar;pFunction:muBulkFunUserData1_t ;userdata:pointer);                     cdecl; { API_EXPORT(void) mupDefineBulkFunUserData1(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFunUserData1_t a_pFun, void* a_pUserData);                     }
  TmupDefineBulkFunUserData2  = procedure( h:handle_t;name:pChar;pFunction:muBulkFunUserData2_t ;userdata:pointer);                     cdecl; { API_EXPORT(void) mupDefineBulkFunUserData2(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFunUserData2_t a_pFun, void* a_pUserData);                     }
  TmupDefineBulkFunUserData3  = procedure( h:handle_t;name:pChar;pFunction:muBulkFunUserData3_t ;userdata:pointer);                     cdecl; { API_EXPORT(void) mupDefineBulkFunUserData3(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFunUserData3_t a_pFun, void* a_pUserData);                     }
  TmupDefineBulkFunUserData4  = procedure( h:handle_t;name:pChar;pFunction:muBulkFunUserData4_t ;userdata:pointer);                     cdecl; { API_EXPORT(void) mupDefineBulkFunUserData4(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFunUserData4_t a_pFun, void* a_pUserData);                     }
  TmupDefineBulkFunUserData5  = procedure( h:handle_t;name:pChar;pFunction:muBulkFunUserData5_t ;userdata:pointer);                     cdecl; { API_EXPORT(void) mupDefineBulkFunUserData5(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFunUserData5_t a_pFun, void* a_pUserData);                     }
  TmupDefineBulkFunUserData6  = procedure( h:handle_t;name:pChar;pFunction:muBulkFunUserData6_t ;userdata:pointer);                     cdecl; { API_EXPORT(void) mupDefineBulkFunUserData6(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFunUserData6_t a_pFun, void* a_pUserData);                     }
  TmupDefineBulkFunUserData7  = procedure( h:handle_t;name:pChar;pFunction:muBulkFunUserData7_t ;userdata:pointer);                     cdecl; { API_EXPORT(void) mupDefineBulkFunUserData7(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFunUserData7_t a_pFun, void* a_pUserData);                     }
  TmupDefineBulkFunUserData8  = procedure( h:handle_t;name:pChar;pFunction:muBulkFunUserData8_t ;userdata:pointer);                     cdecl; { API_EXPORT(void) mupDefineBulkFunUserData8(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFunUserData8_t a_pFun, void* a_pUserData);                     }
  TmupDefineBulkFunUserData9  = procedure( h:handle_t;name:pChar;pFunction:muBulkFunUserData9_t ;userdata:pointer);                     cdecl; { API_EXPORT(void) mupDefineBulkFunUserData9(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFunUserData9_t a_pFun, void* a_pUserData);                     }
  TmupDefineBulkFunUserData10 = procedure( h:handle_t;name:pChar;pFunction:muBulkFunUserData10_t;userdata:pointer);                     cdecl; { API_EXPORT(void) mupDefineBulkFunUserData10(muParserHandle_t a_hParser, const muChar_t* a_szName, muBulkFunUserData10_t a_pFun, void* a_pUserData);                   }


  { string functions }
  TmupDefineStrFun1           = procedure( h:handle_t;name:pChar;pFunction:muStrFun1_t);                                                cdecl; { API_EXPORT(void) mupDefineStrFun1(muParserHandle_t a_hParser, const muChar_t* a_szName, muStrFun1_t a_pFun);                                                          }
  TmupDefineStrFun2           = procedure( h:handle_t;name:pChar;pFunction:muStrFun2_t);                                                cdecl; { API_EXPORT(void) mupDefineStrFun2(muParserHandle_t a_hParser, const muChar_t* a_szName, muStrFun2_t a_pFun);                                                          }
  TmupDefineStrFun3           = procedure( h:handle_t;name:pChar;pFunction:muStrFun3_t);                                                cdecl; { API_EXPORT(void) mupDefineStrFun3(muParserHandle_t a_hParser, const muChar_t* a_szName, muStrFun3_t a_pFun);                                                          }
  TmupDefineStrFun4           = procedure( h:handle_t;name:pChar;pFunction:muStrFun4_t);                                                cdecl; { API_EXPORT(void) mupDefineStrFun4(muParserHandle_t a_hParser, const muChar_t* a_szName, muStrFun4_t a_pFun);                                                          }
  TmupDefineStrFun5           = procedure( h:handle_t;name:pChar;pFunction:muStrFun5_t);                                                cdecl; { API_EXPORT(void) mupDefineStrFun5(muParserHandle_t a_hParser, const muChar_t* a_szName, muStrFun5_t a_pFun);                                                          }
  TmupDefineStrFunUserData1   = procedure( h:handle_t;name:pChar;pFunction:muStrFunUserData1_t;userdata:pointer);                       cdecl; { API_EXPORT(void) mupDefineStrFunUserData1(muParserHandle_t a_hParser, const muChar_t* a_szName, muStrFunUserData1_t a_pFun, void* a_pUserData);                       }
  TmupDefineStrFunUserData2   = procedure( h:handle_t;name:pChar;pFunction:muStrFunUserData2_t;userdata:pointer);                       cdecl; { API_EXPORT(void) mupDefineStrFunUserData2(muParserHandle_t a_hParser, const muChar_t* a_szName, muStrFunUserData2_t a_pFun, void* a_pUserData);                       }
  TmupDefineStrFunUserData3   = procedure( h:handle_t;name:pChar;pFunction:muStrFunUserData3_t;userdata:pointer);                       cdecl; { API_EXPORT(void) mupDefineStrFunUserData3(muParserHandle_t a_hParser, const muChar_t* a_szName, muStrFunUserData3_t a_pFun, void* a_pUserData);                       }
  TmupDefineStrFunUserData4   = procedure( h:handle_t;name:pChar;pFunction:muStrFunUserData4_t;userdata:pointer);                       cdecl; { API_EXPORT(void) mupDefineStrFunUserData4(muParserHandle_t a_hParser, const muChar_t* a_szName, muStrFunUserData4_t a_pFun, void* a_pUserData);                       }
  TmupDefineStrFunUserData5   = procedure( h:handle_t;name:pChar;pFunction:muStrFunUserData5_t;userdata:pointer);                       cdecl; { API_EXPORT(void) mupDefineStrFunUserData5(muParserHandle_t a_hParser, const muChar_t* a_szName, muStrFunUserData5_t a_pFun, void* a_pUserData);                       }


  TmupDefineMultFun           = procedure( h:handle_t;name:pChar;pFunction:muMultFun_t;optimize:iBool);                                 cdecl; { API_EXPORT(void) mupDefineMultFun(muParserHandle_t a_hParser, const muChar_t* a_szName, muMultFun_t a_pFun, muBool_t a_bOptimize);                                    }
  TmupDefineMultFunUserData   = procedure( h:handle_t;name:pChar;pFunction:muMultFunUserData_t;userdata:pointer;optimize:iBool);        cdecl; { API_EXPORT(void) mupDefineMultFunUserData(muParserHandle_t a_hParser, const muChar_t* a_szName, muMultFunUserData_t a_pFun, void* a_pUserData, muBool_t a_bOptimize); }


  TmupDefineOprt              = procedure( h:handle_t;name:pChar;pFunction:muFun2_t;prec:integer;asct:integer;optimize:iBool);          cdecl; { API_EXPORT(void) mupDefineOprt(muParserHandle_t a_hParser, const muChar_t* a_szName, muFun2_t a_pFun, muInt_t a_nPrec, muInt_t a_nOprtAsct, muBool_t a_bOptimize);    }
  TmupDefineConst             = procedure( h:handle_t;name:pChar;value:double);                                                         cdecl; { API_EXPORT(void) mupDefineConst  (muParserHandle_t a_hParser, const muChar_t* a_szName, muFloat_t a_fVal);                                                            }
  TmupDefineStrConst          = procedure( h:handle_t;name:pChar;value:pChar);                                                          cdecl; { API_EXPORT(void) mupDefineStrCons(muParserHandle_t a_hParser, const muChar_t* a_szName, const muChar_t* a_sVal);                                                      }
  TmupDefineVar               = procedure( h:handle_t;name:pChar;value:pdouble);                                                        cdecl; { API_EXPORT(void) mupDefineVar        (muParserHandle_t a_hParser, const muChar_t* a_szName, muFloat_t* a_fVar);                                                       }
  TmupDefineBulkVar           = procedure( h:handle_t;name:pChar;value:pdouble);                                                        cdecl; { API_EXPORT(void) mupDefineBulkVar    (muParserHandle_t a_hParser, const muChar_t* a_szName, muFloat_t* a_fVar);                                                       }
  TmupDefinePostfixOprt       = procedure( h:handle_t;name:pChar;oprt:muFun1_t;optimize:iBool);                                         cdecl; { API_EXPORT(void) mupDefinePostfixOprt(muParserHandle_t a_hParser, const muChar_t* a_szName, muFun1_t a_pOprt, muBool_t a_bOptimize);                                  }
  TmupDefineInfixOprt         = procedure( h:handle_t;name:pChar;oprt:muFun1_t;prec:integer;allowOpt:iBool);                            cdecl; { API_EXPORT(void) mupDefineInfixOprt  (muParserHandle_t a_hParser, const muChar_t* a_szName, muFun1_t a_pOprt, int a_iPrec, muBool_t a_bAllowOpt);                     }


  { Define character sets for identifiers }
  TmupDefineNameChars         = procedure( h:handle_t;charset:pChar);                                                                   cdecl; { API_EXPORT(void) mupDefineNameChars     (muParserHandle_t a_hParser, const muChar_t* a_szCharset);                                                                    }
  TmupDefineOprtChars         = procedure( h:handle_t;charset:pChar);                                                                   cdecl; { API_EXPORT(void) mupDefineOprtChars     (muParserHandle_t a_hParser, const muChar_t* a_szCharset);                                                                    }
  TmupDefineInfixOprtChars    = procedure( h:handle_t;charset:pChar);                                                                   cdecl; { API_EXPORT(void) mupDefineInfixOprtChars(muParserHandle_t a_hParser, const muChar_t* a_szCharset);                                                                    }


  { Remove all / single variables }
  TmupRemoveVar               = procedure( h:handle_t;name:pChar);                                                                      cdecl; { API_EXPORT(void) mupRemoveVar (muParserHandle_t a_hParser, const muChar_t* a_szName);                                                                                 }
  TmupClearVar                = procedure( h:handle_t);                                                                                 cdecl; { API_EXPORT(void) mupClearVar  (muParserHandle_t a_hParser);                                                                                                           }
  TmupClearConst              = procedure( h:handle_t);                                                                                 cdecl; { API_EXPORT(void) mupClearConst(muParserHandle_t a_hParser);                                                                                                           }
  TmupClearOprt               = procedure( h:handle_t);                                                                                 cdecl; { API_EXPORT(void) mupClearOprt (muParserHandle_t a_hParser);                                                                                                           }
  TmupClearFun                = procedure( h:handle_t);                                                                                 cdecl; { API_EXPORT(void) mupClearFun  (muParserHandle_t a_hParser);                                                                                                           }


  { Querying variables / expression variables / constants }
  TmupGetExprVarNum           = function ( h:handle_t):integer;                                                                         cdecl; { (API_EXPORT(int)  mupGetExprVarNum(muParserHandle_t a_hParser);                                                                                                       }
  TmupGetVarNum               = function ( h:handle_t):integer;                                                                         cdecl; { (API_EXPORT(int)  mupGetVarNum(muParserHandle_t a_hParser);                                                                                                           }
  TmupGetConstNum             = function ( h:handle_t):integer;                                                                         cdecl; { (API_EXPORT(int)  mupGetConstNum(muParserHandle_t a_hParser);                                                                                                         }
  TmupGetExprVar              = procedure( h:handle_t;ivar:DWord;ppName:ppChar;ppVar:ppdouble);                                         cdecl; { (API_EXPORT(void) mupGetExprVar(muParserHandle_t a_hParser, unsigned a_iVar, const muChar_t** a_pszName, muFloat_t** a_pVar);                                         }
  TmupGetVar                  = procedure( h:handle_t;ivar:DWord;ppName:ppChar;ppVar:ppdouble);                                         cdecl; { (API_EXPORT(void) mupGetVar    (muParserHandle_t a_hParser, unsigned a_iVar, const muChar_t** a_pszName, muFloat_t** a_pVar);                                         }
  TmupGetConst                = procedure( h:handle_t;ivar:DWord;ppName:ppChar;pVar:pdouble);                                           cdecl; { (API_EXPORT(void) mupGetConst  (muParserHandle_t a_hParser, unsigned a_iVar, const muChar_t** a_pszName, muFloat_t* a_pVar);                                          }


  TmupSetArgSep               = procedure( h:handle_t;ArgSep:char);                                                                     cdecl; { (API_EXPORT(void) mupSetArgSep      (muParserHandle_t a_hParser, const muChar_t cArgSep);                                                                             }
  TmupSetDecSep               = procedure( h:handle_t;DecSep:char);                                                                     cdecl; { (API_EXPORT(void) mupSetDecSep      (muParserHandle_t a_hParser, const muChar_t cArgSep);                                                                             }
  TmupSetThousandsSep         = procedure( h:handle_t;ThousandsSep:char);                                                               cdecl; { (API_EXPORT(void) mupSetThousandsSep(muParserHandle_t a_hParser, const muChar_t cArgSep);                                                                             }
  TmupResetLocale             = procedure( h:handle_t);                                                                                 cdecl; { (API_EXPORT(void) mupResetLocale    (muParserHandle_t a_hParser);                                                                                                     }


  { Add value recognition callbacks }
  TmupAddValIdent             = procedure( h:handle_t;ident:muIdentFun_t);                                                              cdecl; { API_EXPORT(void) mupAddValIdent(muParserHandle_t a_hParser, muIdentFun_t);                                                                                            }


  { Error handling }
  TmupError                   = function ( h:handle_t):iBool;                                                                           cdecl; { API_EXPORT(muBool_t) mupError(muParserHandle_t a_hParser);                                                                                                            }
  TmupErrorReset              = procedure( h:handle_t);                                                                                 cdecl; { API_EXPORT(void) mupErrorReset(muParserHandle_t a_hParser);                                                                                                           }
  muErrorHandler_t            = procedure( h:handle_t);                                                                                        { typedef void (*muErrorHandler_t)(muParserHandle_t a_hParser); // [optional] callback to an error handler                                                              }
  TmupSetErrorHandler         = procedure( h:handle_t;handler:muErrorHandler_t);                                                        cdecl; { API_EXPORT(void) mupSetErrorHandler(muParserHandle_t a_hParser, muErrorHandler_t a_pErrHandler);                                                                      }
  TmupGetErrorMsg             = function ( h:handle_t):pChar;                                                                           cdecl; { API_EXPORT(const muChar_t*) mupGetErrorMsg(muParserHandle_t a_hParser);                                                                                               }
  TmupGetErrorCode            = function ( h:handle_t):integer;                                                                         cdecl; { API_EXPORT(muInt_t) mupGetErrorCode(muParserHandle_t a_hParser);                                                                                                      }
  TmupGetErrorPos             = function ( h:handle_t):integer;                                                                         cdecl; { API_EXPORT(muInt_t) mupGetErrorPos(muParserHandle_t a_hParser);                                                                                                       }
  TmupGetErrorToken           = function ( h:handle_t):pChar;                                                                           cdecl; { API_EXPORT(const muChar_t*) mupGetErrorToken(muParserHandle_t a_hParser);                                                                                             }
 {TmupGetErrorExpr            = function ( h:handle_t):pChar;                                                                           cdecl;}{ API_EXPORT(const muChar_t*) mupGetErrorExpr(muParserHandle_t a_hParser);                                                                                              }

  const
     ecUNEXPECTED_OPERATOR                  : integer =  0; { Unexpected binary operator found                                       }
     ecUNASSIGNABLE_TOKEN                   : integer =  1; { Token cant be identified                                               }
     ecUNEXPECTED_EOF                       : integer =  2; { Unexpected end of formula. (Example: "2+sin(")                         }
     ecUNEXPECTED_ARG_SEP                   : integer =  3; { An unexpected argument separator has been found. (Example: "1,23")     }
     ecUNEXPECTED_ARG                       : integer =  4; { An unexpected argument has been found                                  }
     ecUNEXPECTED_VAL                       : integer =  5; { An unexpected value token has been found                               }
     ecUNEXPECTED_VAR                       : integer =  6; { An unexpected variable token has been found                            }
     ecUNEXPECTED_PARENS                    : integer =  7; { Unexpected parenthesis, opening or closing                             }
     ecUNEXPECTED_STR                       : integer =  8; { A string has been found at an inapropriate position                    }
     ecSTRING_EXPECTED                      : integer =  9; { A string function has been called with a different type of argument    }
     ecVAL_EXPECTED                         : integer = 10; { A numerical function has been called with a non value type of argument }
     ecMISSING_PARENS                       : integer = 11; { Missing parens. (Example: "3*sin(3")                                   }
     ecUNEXPECTED_FUN                       : integer = 12; { Unexpected function found. (Example: "sin(8)cos(9)")                   }
     ecUNTERMINATED_STRING                  : integer = 13; { unterminated string constant. (Example: "3*valueof("hello)")           }
     ecTOO_MANY_PARAMS                      : integer = 14; { Too many function parameters                                           }
     ecTOO_FEW_PARAMS                       : integer = 15; { Too few function parameters. (Example: "ite(1<2,2)")                   }
     ecOPRT_TYPE_CONFLICT                   : integer = 16; { binary operators may only be applied to value items of the same type   }
     ecSTR_RESULT                           : integer = 17; { result is a string                                                     }
     ecINVALID_NAME                         : integer = 18; { Invalid function, variable or constant name.                           }
     ecINVALID_BINOP_IDENT                  : integer = 19; { Invalid binary operator identifier.                                    }
     ecINVALID_INFIX_IDENT                  : integer = 20; { Invalid infix operator identifier.                                     }
     ecINVALID_POSTFIX_IDENT                : integer = 21; { Invalid postfix operator identifier.                                   }
     ecBUILTIN_OVERLOAD                     : integer = 22; { Trying to overload builtin operator                                    }
     ecINVALID_FUN_PTR                      : integer = 23; { Invalid callback function pointer                                      }
     ecINVALID_VAR_PTR                      : integer = 24; { Invalid variable pointer                                               }
     ecEMPTY_EXPRESSION                     : integer = 25; { The expression string is empty                                         }
     ecNAME_CONFLICT                        : integer = 26; { Name conflict                                                          }
     ecOPT_PRI                              : integer = 27; { Invalid operator priority                                              }
     ecDOMAIN_ERROR                         : integer = 28; { catch division by zero, sqrt(-1), log(0) (currently unused)            }
     ecDIV_BY_ZERO                          : integer = 29; { Division by zero (currently unused)                                    }
     ecGENERIC                              : integer = 30; { Error that does not fit any other code but is not an internal error    }
     ecLOCALE                               : integer = 31; { Conflict with current locale                                           }
     ecUNEXPECTED_CONDITIONAL               : integer = 32; { Unexpected if then else operator                                       }
     ecMISSING_ELSE_CLAUSE                  : integer = 33; { Missing else clause                                                    }
     ecMISPLACED_COLON                      : integer = 34; { Misplaced colon                                                        }
     ecUNREASONABLE_NUMBER_OF_COMPUTATIONS  : integer = 35; { The vectors submitted to bulk mode computations are too short.         }
     ecIDENTIFIER_TOO_LONG                  : integer = 36; { A submitted identifier longer than 100 characters.                     }
     ecEXPRESSION_TOO_LONG                  : integer = 37; { The submitted expression is longer than 5000 characters.               }
     ecINVALID_CHARACTERS_FOUND             : integer = 38; { Internal error of any kind.                                            }
     ecINTERNAL_ERROR                       : integer = 39; { Internal error of any kind.                                            }

  muparser_errors : array[0..39] of string = (
     'unexpected operator'                                          , { ecUNEXPECTED_OPERATOR                 }
     'unknown token'                                                , { ecUNASSIGNABLE_TOKEN                  }
     'unexpected end of formula'                                    , { ecUNEXPECTED_EOF                      }
     'unexpected argument separator'                                , { ecUNEXPECTED_ARG_SEP                  }
     'unexpected argument'                                          , { ecUNEXPECTED_ARG                      }
     'unexpected value token'                                       , { ecUNEXPECTED_VAL                      }
     'unexpected variable token'                                    , { ecUNEXPECTED_VAR                      }
     'unexpected opening or closing parenthesis'                    , { ecUNEXPECTED_PARENS                   }
     'inapropriate string'                                          , { ecUNEXPECTED_STR                      }
     'string expected'                                              , { ecSTRING_EXPECTED                     }
     'value expected'                                               , { ecVAL_EXPECTED                        }
     'missing parenthesis'                                          , { ecMISSING_PARENS                      }
     'unexpected function found'                                    , { ecUNEXPECTED_FUN                      }
     'unterminated string'                                          , { ecUNTERMINATED_STRING                 }
     'too many function params'                                     , { ecTOO_MANY_PARAMS                     }
     'too few function params'                                      , { ecTOO_FEW_PARAMS                      }
     'operator type conflict'                                       , { ecOPRT_TYPE_CONFLICT                  }
     'result is a string, not a number'                             , { ecSTR_RESULT                          }
     'invalid name'                                                 , { ecINVALID_NAME                        }
     'invalid binary operator identifier'                           , { ecINVALID_BINOP_IDENT                 }
     'invalid infix operator identifier'                            , { ecINVALID_INFIX_IDENT                 }
     'invalid postfix operator identifier'                          , { ecINVALID_POSTFIX_IDENT               }
     'trying to overload builtin operator'                          , { ecBUILTIN_OVERLOAD                    }
     'invalid callback function pointer'                            , { ecINVALID_FUN_PTR                     }
     'invalid variable pointer'                                     , { ecINVALID_VAR_PTR                     }
     'the expression string is empty'                               , { ecEMPTY_EXPRESSION                    }
     'name conflict'                                                , { ecNAME_CONFLICT                       }
     'invalid operator priority'                                    , { ecOPT_PRI                             }
     'catch division by zero, sqrt(-1), log(0)'                     , { ecDOMAIN_ERROR                        }
     'division by zero'                                             , { ecDIV_BY_ZERO                         }
     'generic error'                                                , { ecGENERIC                             }
     'conflict with current locale'                                 , { ecLOCALE                              }
     'unexpected if then else operator'                             , { ecUNEXPECTED_CONDITIONAL              }
     'missing else clause'                                          , { ecMISSING_ELSE_CLAUSE                 }
     'misplaced colon'                                              , { ecMISPLACED_COLON                     }
     'the vectors submitted to bulk mode computations are too short', { ecUNREASONABLE_NUMBER_OF_COMPUTATIONS }
     'a submitted identifier longer than 100 characters'            , { ecIDENTIFIER_TOO_LONG                 }
     'the submitted expression is longer than 5000 characters'      , { ecEXPRESSION_TOO_LONG                 }
     'invalid characters found'                                     , { ecINVALID_CHARACTERS_FOUND            }
     'internal error'                                                 { ecINTERNAL_ERROR                      }
     );



 { Those are used for .NET only. It creates a new variable allowing the dll to manage the variable rather than the .NET garbage collector. }
 {TmupCreateVar               = function:pdouble;                                                                                       cdecl;}{ API_EXPORT(muFloat_t*) mupCreateVar(void);                                                                                                                            }
 {TmupReleaseVar              = procedure(pdouble);                                                                                     cdecl;}{ API_EXPORT(void) mupReleaseVar(muFloat_t*);                                                                                                                           }

  var
     mupCreate                             : TmupCreate;
     mupRelease                            : TmupRelease;
     mupGetExpr                            : TmupGetExpr;
     mupSetExpr                            : TmupSetExpr;
     mupSetVarFactory                      : TmupSetVarFactory;
     mupGetVersion                         : TmupGetVersion;
     mupEval                               : TmupEval;
     mupEvalMulti                          : TmupEvalMulti;
     mupEvalBulk                           : TmupEvalBulk;
     mupDefineFun0                         : TmupDefineFun0;
     mupDefineFun1                         : TmupDefineFun1;
     mupDefineFun2                         : TmupDefineFun2;
     mupDefineFun3                         : TmupDefineFun3;
     mupDefineFun4                         : TmupDefineFun4;
     mupDefineFun5                         : TmupDefineFun5;
     mupDefineFun6                         : TmupDefineFun6;
     mupDefineFun7                         : TmupDefineFun7;
     mupDefineFun8                         : TmupDefineFun8;
     mupDefineFun9                         : TmupDefineFun9;
     mupDefineFun10                        : TmupDefineFun10;
     mupDefineFunUserData0                 : TmupDefineFunUserData0;
     mupDefineFunUserData1                 : TmupDefineFunUserData1;
     mupDefineFunUserData2                 : TmupDefineFunUserData2;
     mupDefineFunUserData3                 : TmupDefineFunUserData3;
     mupDefineFunUserData4                 : TmupDefineFunUserData4;
     mupDefineFunUserData5                 : TmupDefineFunUserData5;
     mupDefineFunUserData6                 : TmupDefineFunUserData6;
     mupDefineFunUserData7                 : TmupDefineFunUserData7;
     mupDefineFunUserData8                 : TmupDefineFunUserData8;
     mupDefineFunUserData9                 : TmupDefineFunUserData9;
     mupDefineFunUserData10                : TmupDefineFunUserData10;
     mupDefineBulkFun0                     : TmupDefineBulkFun0;
     mupDefineBulkFun1                     : TmupDefineBulkFun1;
     mupDefineBulkFun2                     : TmupDefineBulkFun2;
     mupDefineBulkFun3                     : TmupDefineBulkFun3;
     mupDefineBulkFun4                     : TmupDefineBulkFun4;
     mupDefineBulkFun5                     : TmupDefineBulkFun5;
     mupDefineBulkFun6                     : TmupDefineBulkFun6;
     mupDefineBulkFun7                     : TmupDefineBulkFun7;
     mupDefineBulkFun8                     : TmupDefineBulkFun8;
     mupDefineBulkFun9                     : TmupDefineBulkFun9;
     mupDefineBulkFun10                    : TmupDefineBulkFun10;
     mupDefineBulkFunUserData0             : TmupDefineBulkFunUserData0;
     mupDefineBulkFunUserData1             : TmupDefineBulkFunUserData1;
     mupDefineBulkFunUserData2             : TmupDefineBulkFunUserData2;
     mupDefineBulkFunUserData3             : TmupDefineBulkFunUserData3;
     mupDefineBulkFunUserData4             : TmupDefineBulkFunUserData4;
     mupDefineBulkFunUserData5             : TmupDefineBulkFunUserData5;
     mupDefineBulkFunUserData6             : TmupDefineBulkFunUserData6;
     mupDefineBulkFunUserData7             : TmupDefineBulkFunUserData7;
     mupDefineBulkFunUserData8             : TmupDefineBulkFunUserData8;
     mupDefineBulkFunUserData9             : TmupDefineBulkFunUserData9;
     mupDefineBulkFunUserData10            : TmupDefineBulkFunUserData10;
     mupDefineStrFun1                      : TmupDefineStrFun1;
     mupDefineStrFun2                      : TmupDefineStrFun2;
     mupDefineStrFun3                      : TmupDefineStrFun3;
     mupDefineStrFun4                      : TmupDefineStrFun4;
     mupDefineStrFun5                      : TmupDefineStrFun5;
     mupDefineStrFunUserData1              : TmupDefineStrFunUserData1;
     mupDefineStrFunUserData2              : TmupDefineStrFunUserData2;
     mupDefineStrFunUserData3              : TmupDefineStrFunUserData3;
     mupDefineStrFunUserData4              : TmupDefineStrFunUserData4;
     mupDefineStrFunUserData5              : TmupDefineStrFunUserData5;
     mupDefineMultFun                      : TmupDefineMultFun;
     mupDefineMultFunUserData              : TmupDefineMultFunUserData;
     mupDefineOprt                         : TmupDefineOprt;
     mupDefineConst                        : TmupDefineConst;
     mupDefineStrConst                     : TmupDefineStrConst;
     mupDefineVar                          : TmupDefineVar;
     mupDefineBulkVar                      : TmupDefineBulkVar;
     mupDefinePostfixOprt                  : TmupDefinePostfixOprt;
     mupDefineInfixOprt                    : TmupDefineInfixOprt;
     mupDefineNameChars                    : TmupDefineNameChars;
     mupDefineOprtChars                    : TmupDefineOprtChars;
     mupDefineInfixOprtChars               : TmupDefineInfixOprtChars;
     mupRemoveVar                          : TmupRemoveVar;
     mupClearVar                           : TmupClearVar;
     mupClearConst                         : TmupClearConst;
     mupClearOprt                          : TmupClearOprt;
     mupClearFun                           : TmupClearFun;
     mupGetExprVarNum                      : TmupGetExprVarNum;
     mupGetVarNum                          : TmupGetVarNum;
     mupGetConstNum                        : TmupGetConstNum;
     mupGetExprVar                         : TmupGetExprVar;
     mupGetVar                             : TmupGetVar;
     mupGetConst                           : TmupGetConst;
     mupSetArgSep                          : TmupSetArgSep;
     mupSetDecSep                          : TmupSetDecSep;
     mupSetThousandsSep                    : TmupSetThousandsSep;
     mupResetLocale                        : TmupResetLocale;
     mupAddValIdent                        : TmupAddValIdent;
     mupError                              : TmupError;
     mupErrorReset                         : TmupErrorReset;
     mupSetErrorHandler                    : TmupSetErrorHandler;
     mupGetErrorMsg                        : TmupGetErrorMsg;
     mupGetErrorCode                       : TmupGetErrorCode;
     mupGetErrorPos                        : TmupGetErrorPos;
     mupGetErrorToken                      : TmupGetErrorToken;
    {mupGetErrorExpr                       : TmupGetErrorExpr;}


  procedure InitmuParser(path:string);
  procedure UninitmuParser;

implementation

uses dialogs, forms;

var
  LibHandle: THandle;


procedure UninitmuParser;
begin
  FreeLibrary(LibHandle);
  LibHandle := 0;
end;

function Get(s:AnsiString):Pointer;
begin
  result := GetProcAddress(LibHandle, s);
  if result = NIL then
     begin
     ShowMessage(s + ' not found.');
     end;
end;

procedure InitmuParser(path:string);
  {$IfDef WINDOWS}
  var buf:array[0..255] of char;
begin
  path := path+'muparser.dll';
  if (not FileExists(path)) then
     begin
     Showmessage('ERROR: COULD NOT LOAD DLL: '+path);
     application.terminate;
     exit;
     end;
  StrPCopy(buf, path);
  LibHandle := LoadLibrary(buf);
  if (LibHandle = 0) then
     begin
     ShowMessage('Could not load muparser.dll - EXITING! ('+path+')');
     application.terminate;
     exit;
     end
  else
     begin
     mupCreate                             := TmupCreate                             (Get('mupCreate'                 ));
     mupRelease                            := TmupRelease                            (Get('mupRelease'                ));
     mupGetExpr                            := TmupGetExpr                            (Get('mupGetExpr'                ));
     mupSetExpr                            := TmupSetExpr                            (Get('mupSetExpr'                ));
     mupSetVarFactory                      := TmupSetVarFactory                      (Get('mupSetVarFactory'          ));
     mupGetVersion                         := TmupGetVersion                         (Get('mupGetVersion'             ));
     mupEval                               := TmupEval                               (Get('mupEval'                   ));
     mupEvalMulti                          := TmupEvalMulti                          (Get('mupEvalMulti'              ));
     mupEvalBulk                           := TmupEvalBulk                           (Get('mupEvalBulk'               ));
     mupDefineFun0                         := TmupDefineFun0                         (Get('mupDefineFun0'             ));         
     mupDefineFun1                         := TmupDefineFun1                         (Get('mupDefineFun1'             ));
     mupDefineFun2                         := TmupDefineFun2                         (Get('mupDefineFun2'             ));
     mupDefineFun3                         := TmupDefineFun3                         (Get('mupDefineFun3'             ));
     mupDefineFun4                         := TmupDefineFun4                         (Get('mupDefineFun4'             ));
     mupDefineFun5                         := TmupDefineFun5                         (Get('mupDefineFun5'             ));
     mupDefineFun6                         := TmupDefineFun6                         (Get('mupDefineFun6'             ));
     mupDefineFun7                         := TmupDefineFun7                         (Get('mupDefineFun7'             ));
     mupDefineFun8                         := TmupDefineFun8                         (Get('mupDefineFun8'             ));
     mupDefineFun9                         := TmupDefineFun9                         (Get('mupDefineFun9'             ));
     mupDefineFun10                        := TmupDefineFun10                        (Get('mupDefineFun10'            ));
     mupDefineFunUserData0                 := TmupDefineFunUserData0                 (Get('mupDefineFunUserData0'     ));
     mupDefineFunUserData1                 := TmupDefineFunUserData1                 (Get('mupDefineFunUserData1'     ));
     mupDefineFunUserData2                 := TmupDefineFunUserData2                 (Get('mupDefineFunUserData2'     ));
     mupDefineFunUserData3                 := TmupDefineFunUserData3                 (Get('mupDefineFunUserData3'     ));
     mupDefineFunUserData4                 := TmupDefineFunUserData4                 (Get('mupDefineFunUserData4'     ));
     mupDefineFunUserData5                 := TmupDefineFunUserData5                 (Get('mupDefineFunUserData5'     ));
     mupDefineFunUserData6                 := TmupDefineFunUserData6                 (Get('mupDefineFunUserData6'     ));
     mupDefineFunUserData7                 := TmupDefineFunUserData7                 (Get('mupDefineFunUserData7'     ));
     mupDefineFunUserData8                 := TmupDefineFunUserData8                 (Get('mupDefineFunUserData8'     ));
     mupDefineFunUserData9                 := TmupDefineFunUserData9                 (Get('mupDefineFunUserData9'     ));
     mupDefineFunUserData10                := TmupDefineFunUserData10                (Get('mupDefineFunUserData10'    ));
     mupDefineBulkFun0                     := TmupDefineBulkFun0                     (Get('mupDefineBulkFun0'         ));
     mupDefineBulkFun1                     := TmupDefineBulkFun1                     (Get('mupDefineBulkFun1'         ));
     mupDefineBulkFun2                     := TmupDefineBulkFun2                     (Get('mupDefineBulkFun2'         ));
     mupDefineBulkFun3                     := TmupDefineBulkFun3                     (Get('mupDefineBulkFun3'         ));
     mupDefineBulkFun4                     := TmupDefineBulkFun4                     (Get('mupDefineBulkFun4'         ));
     mupDefineBulkFun5                     := TmupDefineBulkFun5                     (Get('mupDefineBulkFun5'         ));
     mupDefineBulkFun6                     := TmupDefineBulkFun6                     (Get('mupDefineBulkFun6'         ));
     mupDefineBulkFun7                     := TmupDefineBulkFun7                     (Get('mupDefineBulkFun7'         ));
     mupDefineBulkFun8                     := TmupDefineBulkFun8                     (Get('mupDefineBulkFun8'         ));
     mupDefineBulkFun9                     := TmupDefineBulkFun9                     (Get('mupDefineBulkFun9'         ));
     mupDefineBulkFun10                    := TmupDefineBulkFun10                    (Get('mupDefineBulkFun10'        ));
     mupDefineBulkFunUserData0             := TmupDefineBulkFunUserData0             (Get('mupDefineBulkFunUserData0' ));
     mupDefineBulkFunUserData1             := TmupDefineBulkFunUserData1             (Get('mupDefineBulkFunUserData1' ));
     mupDefineBulkFunUserData2             := TmupDefineBulkFunUserData2             (Get('mupDefineBulkFunUserData2' ));
     mupDefineBulkFunUserData3             := TmupDefineBulkFunUserData3             (Get('mupDefineBulkFunUserData3' ));
     mupDefineBulkFunUserData4             := TmupDefineBulkFunUserData4             (Get('mupDefineBulkFunUserData4' ));
     mupDefineBulkFunUserData5             := TmupDefineBulkFunUserData5             (Get('mupDefineBulkFunUserData5' ));
     mupDefineBulkFunUserData6             := TmupDefineBulkFunUserData6             (Get('mupDefineBulkFunUserData6' ));
     mupDefineBulkFunUserData7             := TmupDefineBulkFunUserData7             (Get('mupDefineBulkFunUserData7' ));
     mupDefineBulkFunUserData8             := TmupDefineBulkFunUserData8             (Get('mupDefineBulkFunUserData8' ));
     mupDefineBulkFunUserData9             := TmupDefineBulkFunUserData9             (Get('mupDefineBulkFunUserData9' ));
     mupDefineBulkFunUserData10            := TmupDefineBulkFunUserData10            (Get('mupDefineBulkFunUserData10'));
     mupDefineStrFun1                      := TmupDefineStrFun1                      (Get('mupDefineStrFun1'          ));
     mupDefineStrFun2                      := TmupDefineStrFun2                      (Get('mupDefineStrFun2'          ));
     mupDefineStrFun3                      := TmupDefineStrFun3                      (Get('mupDefineStrFun3'          ));
     mupDefineStrFun4                      := TmupDefineStrFun4                      (Get('mupDefineStrFun4'          ));
     mupDefineStrFun5                      := TmupDefineStrFun5                      (Get('mupDefineStrFun5'          ));
     mupDefineStrFunUserData1              := TmupDefineStrFunUserData1              (Get('mupDefineStrFunUserData1'  ));
     mupDefineStrFunUserData2              := TmupDefineStrFunUserData2              (Get('mupDefineStrFunUserData2'  ));
     mupDefineStrFunUserData3              := TmupDefineStrFunUserData3              (Get('mupDefineStrFunUserData3'  ));
     mupDefineStrFunUserData4              := TmupDefineStrFunUserData4              (Get('mupDefineStrFunUserData4'  ));
     mupDefineStrFunUserData5              := TmupDefineStrFunUserData5              (Get('mupDefineStrFunUserData5'  ));
     mupDefineMultFun                      := TmupDefineMultFun                      (Get('mupDefineMultFun'          ));
     mupDefineMultFunUserData              := TmupDefineMultFunUserData              (Get('mupDefineMultFunUserData'  ));
     mupDefineOprt                         := TmupDefineOprt                         (Get('mupDefineOprt'             ));       
     mupDefineConst                        := TmupDefineConst                        (Get('mupDefineConst'            ));      
     mupDefineStrConst                     := TmupDefineStrConst                     (Get('mupDefineStrConst'         ));   
     mupDefineVar                          := TmupDefineVar                          (Get('mupDefineVar'              ));        
     mupDefineBulkVar                      := TmupDefineBulkVar                      (Get('mupDefineBulkVar'          ));    
     mupDefinePostfixOprt                  := TmupDefinePostfixOprt                  (Get('mupDefinePostfixOprt'      ));
     mupDefineInfixOprt                    := TmupDefineInfixOprt                    (Get('mupDefineInfixOprt'        ));  
     mupDefineNameChars                    := TmupDefineNameChars                    (Get('mupDefineNameChars'        ));
     mupDefineOprtChars                    := TmupDefineOprtChars                    (Get('mupDefineOprtChars'        ));
     mupDefineInfixOprtChars               := TmupDefineInfixOprtChars               (Get('mupDefineInfixOprtChars'   ));
     mupRemoveVar                          := TmupRemoveVar                          (Get('mupRemoveVar'              ));
     mupClearVar                           := TmupClearVar                           (Get('mupClearVar'               )); 
     mupClearConst                         := TmupClearConst                         (Get('mupClearConst'             ));
     mupClearOprt                          := TmupClearOprt                          (Get('mupClearOprt'              ));
     mupClearFun                           := TmupClearFun                           (Get('mupClearFun'               ));
     mupGetExprVarNum                      := TmupGetExprVarNum                      (Get('mupGetExprVarNum'          ));
     mupGetVarNum                          := TmupGetVarNum                          (Get('mupGetVarNum'              ));
     mupGetConstNum                        := TmupGetConstNum                        (Get('mupGetConstNum'            ));
     mupGetExprVar                         := TmupGetExprVar                         (Get('mupGetExprVar'             ));
     mupGetVar                             := TmupGetVar                             (Get('mupGetVar'                 ));
     mupGetConst                           := TmupGetConst                           (Get('mupGetConst'               ));
     mupSetArgSep                          := TmupSetArgSep                          (Get('mupSetArgSep'              ));
     mupSetDecSep                          := TmupSetDecSep                          (Get('mupSetDecSep'              ));
     mupSetThousandsSep                    := TmupSetThousandsSep                    (Get('mupSetThousandsSep'        ));
     mupResetLocale                        := TmupResetLocale                        (Get('mupResetLocale'            ));
     mupAddValIdent                        := TmupAddValIdent                        (Get('mupAddValIdent'            ));
     mupError                              := TmupError                              (Get('mupError'                  ));
     mupErrorReset                         := TmupErrorReset                         (Get('mupErrorReset'             ));
     mupSetErrorHandler                    := TmupSetErrorHandler                    (Get('mupSetErrorHandler'        ));
     mupGetErrorMsg                        := TmupGetErrorMsg                        (Get('mupGetErrorMsg'            ));
     mupGetErrorCode                       := TmupGetErrorCode                       (Get('mupGetErrorCode'           ));
     mupGetErrorPos                        := TmupGetErrorPos                        (Get('mupGetErrorPos'            ));
     mupGetErrorToken                      := TmupGetErrorToken                      (Get('mupGetErrorToken'          ));
    {mupGetErrorExpr                       := TmupGetErrorExpr                       (Get('mupGetErrorExpr'           ));}


     end;
end;
{$ELSE}
begin
end;
{$ENDIF}


end.

