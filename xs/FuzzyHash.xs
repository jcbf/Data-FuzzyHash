#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "fuzzy.h"

MODULE = Data::FuzzyHash PACKAGE = Data::FuzzyHash

PROTOTYPES: DISABLE

SV*
fuzzy_hash(SV* sv)
CODE:
{
    char result[FUZZY_MAX_RESULT];
    size_t size;
    const char *str = SvPVbyte(sv, size);

    int status = fuzzy_hash_buf((const unsigned char *)str, size, result);
    if( status != 0 ){
        croak("Failed to calculate hash value.");
    }
    RETVAL= newSVpvn(result, strlen(result));
}
OUTPUT:
    RETVAL


SV*
fuzzy_hash_file(const char* filename)
CODE:
{
    char result[FUZZY_MAX_RESULT];
    int status = fuzzy_hash_filename((const char*)filename, result);
    if( status != 0 ){
        croak("Failed to calculate hash value.");
    }
    RETVAL= newSVpvn(result, strlen(result));
}
OUTPUT:
    RETVAL

SV*
fuzzy_compare(const char* sig1, const char* sig2)
CODE:
{
    int result = fuzzy_compare(sig1, sig2);
    RETVAL = newSViv(result);
}
OUTPUT:
    RETVAL
