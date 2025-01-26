# from sys.ffi import DLHandle, UnsafePointer, external_call
# from mjui.utils import rgb_to_i32, str_to_int8
# from mjui.const import StringBytes

# fn log():
#     print("Hello")

# fn main(): 
#     var dll = DLHandle('mjui/libc/bin/libgtk.dylib')
#     var app = dll.call["gtk_application_new", Int32, StringBytes, Int32]("org.gtk.example".as_bytes(), 0)
#     var pointer = UnsafePointer.address_of(log)
#     dll.call["g_signal_connect", NoneType, Int32, StringBytes, UnsafePointer[fn()], Int32](app, "activate".as_bytes(), pointer, 0)

#     # status = g_application_run (G_APPLICATION (app), argc, argv);
#     var status = dll.call['g_application_run', Int32, Int32, List[Int32], List[Int32]](app, List[Int32](), List[Int32]())
#     dll.call['g_object_unref', NoneType, Int32](app)
#     ...