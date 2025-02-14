from .types import StringBytes
from collections import Optional

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


fn filter[listType: CollectionElement](list:List[listType], modifier: fn(element:listType)->Bool) -> List[listType]:
    var new_list = List[listType]()
    for element in list:
        var shouldIncludeValue = modifier(element[])
        if shouldIncludeValue:
            new_list.append(element[])

    return new_list

@value
struct DataStore[dtype: CollectionElement]:
    var _store: List[dtype]
    var name: Optional[String]
    fn __init__(mut self):
        self._store = List[dtype]()
        self.name = Optional[String]()
        
    fn store(mut self, data: dtype) -> Int:
        self._store.append(data)
        var index = len(self._store) - 1
        return index

    fn getAt(mut self, index: Int) -> dtype:
        return self._store[index]

    fn storeAt(mut self, index:Int, data: dtype) -> Int:
        self._store[index] = data
        return index