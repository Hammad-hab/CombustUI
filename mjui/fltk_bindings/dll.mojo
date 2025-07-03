from sys.ffi import DLHandle, UnsafePointer, _OwnedDLHandle, _Global
from os import getenv
from sys.terminate import exit

var __dll = init()
fn init() -> DLHandle:
    var path = getenv('COMBUSTUI_DLL_PATH')
    if len(path) <= 0:
        print('Failed to locate mjui DLL. $COMBUSTUI_DLL_PATH not defined')
        exit()
    try: 
        print('Successfully loaded DLL')
        return DLHandle(path)
    except:
        print('Failed to load DLL')
        return _uninit[DLHandle]()

@always_inline
fn _uninit[T: AnyType](out value: T):
    """Returns uninitialized data."""
    __mlir_op.`lit.ownership.mark_initialized`(__get_mvalue_as_litref(value))
