/// DerpXmlRead_Read()
//
//  Reads the next XML node. (tag, text, etc.)
//
//  Returns true if the next node was read successfully, 
//  and false if there are no more nodes to read.

with objDerpXmlRead {
    var readString = ''
    var numCharsRead = 0
    var lastType = currentType
    
    var isTag = false
    var isClosingTag = false
    var isEmptyElement = false
    var tagState = ''
    var tagName = ''
    var attrKey = ''
    var attrVal = ''
    ds_map_clear(attributeMap)
    
    // if was already at end of file, just return false
    if currentType == DerpXmlType_EndOfFile {
        return false
    }
    
    // if last read was empty element, just return a closing tag this round
    if lastReadEmptyElement {
        lastReadEmptyElement = false
        currentType = DerpXmlType_CloseTag
        // don't change currentValue to keep it same as last read
        currentRawValue = ''
        return true
    }
    
    while true {
        // advance in the document
        stringPos += 1
        
        // file detect end of line (and possibly end of document)
        if readMode == readMode_File and stringPos > string_length(xmlString) {
            file_text_readln(xmlFile)
            if file_text_eof(xmlFile) {
                currentType = DerpXmlType_EndOfFile
                currentValue = ''
                currentRawValue = ''
                return false
            }
            xmlString = file_text_read_string(xmlFile)
            stringPos = 1
        }
        
        // string detect end of document
        if readMode == readMode_String and stringPos > string_length(xmlString) {
            stringPos = string_length(xmlString)
            currentType = DerpXmlType_EndOfFile
            currentValue = ''
            currentRawValue = ''
            return false
        }
        
        // grab the new character
        var currentChar = string_char_at(xmlString, stringPos);
        readString += currentChar
        numCharsRead += 1
        
        // main state 1: in the middle of parsing a tag
        if isTag {
            // reach > and not in attribute value, so end of tag
            if currentChar == '>' and tagState != 'attr_value' {
                if isClosingTag {
                    currentType = DerpXmlType_CloseTag
                    currentValue = string_copy(readString, 3, string_length(readString)-3)
                    currentRawValue = readString
                    return true
                }
                else {
                    // if empty element, set the flag for the next read
                    if isEmptyElement {
                        lastReadEmptyElement = true
                    }
                    
                    currentType = DerpXmlType_OpenTag
                    currentValue = tagName
                    currentRawValue = readString
                    return true
                }
            }
            
            // not end of tag, so either tag name or some attribute state
            if tagState == 'tag_name' {
                // check if encountering space, so done with tag name
                if currentChar == ' ' {
                    tagState = 'whitespace'
                    tagName = string_copy(readString, 2, string_length(readString)-2)
                }
                
                // check for beginning slash
                else if currentChar == '/' and numCharsRead == 2 {
                    isClosingTag = true
                }
                
                // check for ending slash
                else if currentChar == '/' and numCharsRead > 2 {
                    isEmptyElement = true
                }
                
                // in the normal case, just add to tag name
                else {
                    tagName += currentChar
                }
            }
            else if tagState == 'whitespace' {
                // check for ending slash
                if currentChar == '/' {
                    isEmptyElement = true
                }
                // if encounter non-space and non-slash character, it's the start of a key
                else if currentChar != ' ' {
                    attrKey += currentChar
                    tagState = 'key'
                }
            }
            else if tagState == 'key' {
                // if encounter = or space, start the value whitespace
                if currentChar == '=' or currentChar == ' ' {
                    tagState = 'value_whitespace'
                }
                
                // in the normal case, just add to the key
                else {
                    attrKey += currentChar
                }
            }
            else if tagState == 'value_whitespace' {
                // if encounter quote, start the key
                if currentChar == '"' or currentChar == "'" {
                    tagState = 'value'
                }
            }
            else if tagState == 'value' {
                // if encounter quote, we're done with the value, store the attribute and return to whitespace
                if currentChar == '"' or currentChar == "'" {
                    attributeMap[? attrKey] = attrVal
                    attrKey = ''
                    attrVal = ''
                    tagState = 'whitespace'
                }
                else {
                    attrVal += currentChar
                }
            }
        }
        
        // main state 2: not parsing a tag
        else {
            // first character is <, so we're starting a tag
            if currentChar == '<' and numCharsRead == 1 {
                isTag = true
                tagState = 'tag_name'
            }
            
            // reach a < that's not the first character, which is the end of text and whitespace
            if currentChar == '<' and numCharsRead > 1 {
                if string_char_at(xmlString, stringPos+1) == '/' and lastType == DerpXmlType_OpenTag {
                    currentType = DerpXmlType_Text
                }
                else {
                    currentType = DerpXmlType_Whitespace
                }
                stringPos -= 1
                currentValue = string_copy(readString, 1, string_length(readString)-1)
                currentRawValue = currentValue
                return true
            }
        }
    }
}
