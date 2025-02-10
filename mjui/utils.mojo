from .types import StringBytes

fn rgb_to_i32(r:UInt32, g:UInt32, b:UInt32) -> UInt32:
    """
        Converts rgb values to a singe 256-color pallet integer.
    """
    return UInt32(((((r << 8) | g) << 8) | b)<<8)

fn str_to_int8(str: String) -> List[Int8]:
    """
        Converts a string into a list of ASCII character codes.
    """
    var list = List[Int8]()
    for char in str:
        list.append(ord(char))
    
    return list

fn readFromStringBytes(bytes: StringBytes) -> String:
    var list = List[UInt8]()
    for i in range(bytes._len if bytes._len > 0 else 114):
        var data = bytes._data[i]
        list.append(data)
        if (data == 0): break
    return list