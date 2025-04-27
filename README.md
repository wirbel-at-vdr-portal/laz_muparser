# laz_muparser
Pascal/Lazarus interface to the muparser library

The [muparser library](https://beltoforion.de/en/muparser/) allows the parsing of mathematical expressions. The main objective muparser is to provide a fast, easy and secure way of doing this. muparser is an extensible high performance math expression parser library written in C++. It works by transforming a mathematical expression into bytecode and precalculating constant parts of the expression. For best performance muparser allows parallelized evaluation of expressions with OpenMP. parallelized evaluation of expressions with OpenMP.

The files here allow the use of the muparser library in [fpc and Lazarus](https://www.lazarus-ide.org/). Only the C dll interface is translated.

For details how to use, pls refer to the muparser examples in C/C++ and do the same in pascal.

    procedure onError(h:pointer);
    var
       e:integer;
    begin
       dll_error:=true;
       e := mupGetErrorCode(h);
       dll_err_string := muparser_errors[e];
    end;


    InitmuParser(ExtractFilePath(ParamStr(0)));
    h := mupCreate(muBASETYPE_FLOAT);
    mupDefineNameChars(h, pChar('0123456789_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'));
    mupDefineOprtChars(h, pChar('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+-*^/?<>=#!$%&|~'#27'_'));
    mupDefineInfixOprtChars(h, pChar('/+-*^?<>=#!$%&|~'#27'_'));
    mupSetErrorHandler(h,@onError);
    mupDefineFun1(h, pChar('fac'), @fac, 1);

    try
       result:='';
       mupSetExpr(h, pChar(s));
       if (dll_error) then
          begin
          mupRelease(h);
          exit;
          end;

       tf.DecimalSeparator:='.';
       result:=FloatToStrF(mupEval(h),
                           ffGeneral, // kürzestes format.
                           18, // double bis 15, extended bis 18
                           18,
                           tf);

    except
       result:='Error in muparser.dll';
    end;

    mupRelease(h);
    UninitmuParser;

Before using any of the functions, InitmuParser(path:string) needs to be called with the full path to the dll. After muparser is not used anymore, call UninitmuParser to free the dll.

## Translation rules used ##

The header assumes, that the dll was compiled with _UNICODE undefined.
Further assumptions:
* muChar_t is one byte char (see above)
* int is 32bit signed
* unsigned is 32bit unsigned

| muparser C interface  | Lazarus interface |
| --------------------- | ----------------- |
| muParserDLL.h         | muParserDLL.pas   |
| muParserHandle_t      | handle_t          |
| void *                | pointer           |
| API_EXPORT(void) (..) | (..) cdecl;       |
| const muChar_t        | char              |
| const muChar_t*       | pChar             |
| const muChar_t**      | ppChar            |
| muFloat_t             | double            |
| muFloat_t*            | pDouble           |
| muFloat_t**           | ppDouble          |
| muBool_t              | iBool             |
| muInt_t               | integer           |
| function wo return    | procedure         |
| function w return     | function          |
| int                   | integer           |
| unsigned              | DWord             |






