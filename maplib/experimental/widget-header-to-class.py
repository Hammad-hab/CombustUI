headers = ['/opt/homebrew/Cellar/fltk/1.4.4/include/FL/FL_Input_.H']



def parse_class_header(header: str):
    with open(header, "r") as headerRead:
        contentLines = headerRead.readlines()
        className = 'NO_POSSIBLE_CONSTRUCTOR_NAME'
        constructor = 'NO_POSSIBLE_CONSTRUCTOR()'

        hasFoundPublicSegment = False
        methods = []
        for line in contentLines:
            line = line.strip()
            if line.startswith('//') or line.startswith("#"):
                continue
            
            if line.startswith('class'):
                name = line.strip().split(":")[0].strip().split(" ")[-1]
                className = name
                continue
                
            if line.strip().startswith(className):
                constructor = line
                continue
            
            if 'public:' in line.strip() and not hasFoundPublicSegment:
                hasFoundPublicSegment = True
                continue

            if hasFoundPublicSegment and line.strip().endswith(");") or line.strip().endswith(' }') and line.split("{"):
                methods.append(line)
                print(line)
                continue

for header in headers:
    parse_class_header(header)
