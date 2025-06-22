from sys.ffi import DLHandle, UnsafePointer, _OwnedDLHandle, _Global

var __dll = init()
fn init() -> DLHandle:
    try: 
        print('Successfully loaded DLL')
        return DLHandle('/Users/hammad/Documents/Hammad/Mojo/CombustUI-Mojo/mjui/fltk_bindings/libc/out/mjui.dylib')
    except:
        return _uninit[DLHandle]()

@always_inline
fn _uninit[T: AnyType](out value: T):
    """Returns uninitialized data."""
    __mlir_op.`lit.ownership.mark_initialized`(__get_mvalue_as_litref(value))
