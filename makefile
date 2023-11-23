
all     : DLLSIST
rebuild : clean all
clean   :
        $SYSTEM.SYS00.FUP PURGE CONVERTO, LOGUTILO, FILELIBO,LCONFO,PROCESSO, \
                                MSGO, TOKENO!

CONVERTO : CONVERTC CONVERTH
        $SYSTEM.SYSTEM.CCOMP/IN CONVERTC / CONVERTO; \
        SYMBOLS,OPTIMIZE 0,extensions,xmem,nolist, allow_cplusplus_comments, \
        refaligned 8,fieldalign shared2, \
        SSV1 "$SYSTEM.SYSTEM", SSV2 "$DATA17.XNLIB"

LOGUTILO : LOGUTILC LOGUTILH
        $SYSTEM.SYSTEM.CCOMP/IN LOGUTILC/ LOGUTILO; \
        SYMBOLS,OPTIMIZE 0,extensions,xmem,nolist, allow_cplusplus_comments, \
        refaligned 8,fieldalign shared2, \
        SSV1 "$SYSTEM.SYSTEM", SSV2 "$DATA17.XNLIB", \
        SSV3 "$SYSTEM.ZSPIDEF"

FILELIBO : FILELIBC FILELIBH
        $SYSTEM.SYSTEM.CCOMP/IN FILELIBC / FILELIBO; \
        SYMBOLS,OPTIMIZE 0,extensions,xmem,nolist, allow_cplusplus_comments. \
        refaligned 8,fieldalign shared2, \
        SSV1 "$SYSTEM.SYSTEM", SSV2 "$DATA17.XNLIB"

LCONFO : LCONFC LCONFH
        $SYSTEM.SYSTEM.CCOMP/IN LCONFC/ LCONFO; \
        SYMBOLS,OPTIMIZE 0,extensions,xmem,nolist, allow_cplusplus_comments, \
        refaligned 8,fieldalign shared2, \
        SSV1 "$SYSTEM.SYSTEM", SSV2 "$DATA17.XNLIB"

PROCESSO : PROCESSC PROCESSH
        $SYSTEM.SYSTEM.CCOMP/IN PROCESSC/ PROCESSO; \
        SYMBOLS,OPTIMIZE 0,extensions,xmem,nolist, allow_cplusplus_comments, \
        refaligned 8,fieldalign shared2, \
        SSV1 "$SYSTEM.SYSTEM", SSV2 "$DATA17.XNLIB", \
        SSV3 "$SYSTEM.ZSPIDEF", SSV4 "$SYSTEM.ZSYSDEFS"

TOKENO : TOKENC TOKENH
        $SYSTEM.SYSTEM.CCOMP/IN TOKENC/ TOKENO; \
        SYMBOLS,OPTIMIZE 0,extensions,xmem,nolist, allow_cplusplus_comments, \
        refaligned 8,fieldalign shared2, \
        SSV1 "$SYSTEM.SYSTEM", SSV2 "$DATA17.XNLIB"

MSGO : MSGC MSGH
        $SYSTEM.SYSTEM.CCOMP/IN MSGC/ MSGO; \
        SYMBOLS,OPTIMIZE 0,extensions,xmem,nolist, allow_cplusplus_comments, \
        refaligned 8,fieldalign shared2, \
        SSV1 "$SYSTEM.SYSTEM", SSV2 "$DATA17.XNLIB", \
        SSV3 "$DATA26.CSMBSRC"

DLLSIST : CONVERTO LOGUTILO FILELIBO LCONFO PROCESSO TOKENO MSGO
        $SYSTEM.SYSTEM.XLD \
        -lib XCREDLL -lib XCRTLDLL -shared -export_all \
        -noverbose -set saveabend on -set inspect on -unres_symbols ignore \
        CONVERTO \
        LOGUTILO \
        FILELIBO \
        LCONFO \
        PROCESSO \
        TOKENO \
        MSGO \
        -o DLLSIST

