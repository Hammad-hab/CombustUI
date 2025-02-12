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
    var i = 0
    while bytes._data[i] != 0:
        var data = bytes._data[i]
        list.append(data)
        i += 1
    list.append(0)
    return list


fn createIdFrom(id: String) raises -> Int:
    var strn: String = ""
    for char in id:
       intrepr = ord(char)
       strn += str(intrepr)
    
    return int(strn)