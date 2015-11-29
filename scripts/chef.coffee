# Description:
#   An encheferizer port for Hubot.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   chef - Encheferizes the given message.
#
# Author:
#   apps@digitaldictator.net


module.exports = (robot) ->
    robot.hear /chef (.*)/i, (message) ->
        words = message.match[1].split(" ")
        
        result = ""
        result += encheferize word for word in words
        
        message.send(result)
        
        
encheferize = (word) ->   
    result = ""
    index = 0
    iSeen = false
    
    if word.match /^@/
        result += word
    else while index < word.length
        transliterateResult = transliterate(word, index, iSeen)
        result += transliterateResult[0]
        index += transliterateResult[1]
        if transliterateResult[2] is true
            iSeen = true
    
    result += " "
    
    return result
    
    
transliterate = (word, index, iSeen) ->

    # start of word rules
    
    if index is 0 
        if word.match /^E/
            return ["I", 1]    
        if word.match /^e/
            return ["i", 1]
        if word.match /^O/
            return ["Oo", 1]            
        if word.match /^o/
            return ["oo", 1]        
        
        
    # anywhere rules
    
    partialWord = word.substring(index, word.length)
    
    if partialWord.match /^bork/i
        return ["bork", 4]    
    if partialWord.match /^An/
        return ["Un", 2]    
    if partialWord.match /^an/
        return ["un", 2]
    if partialWord.match /^Au/
        return ["Oo", 2]    
    if partialWord.match /^au/
        return ["oo", 2]
    if partialWord.match /^The/
        return ["Zee", 3]        
    if partialWord.match /^the/
        return ["zee", 3]
    if partialWord.match /^v/i
        return ["f", 1]
    if partialWord.match /^w/i
        return ["v", 1]
            
        
    # middle-of-word rules
    
    if index > 0
        if partialWord.match /^ew/i
            return ["oo", 2]
        if partialWord.match /^f/i
            return ["ff", 1]
            
        if partialWord.match /^ir/i
            return ["ur", 2]
        else if partialWord.match /^i/i
            if not iSeen
                return ["ee", 1, true]
                
        if partialWord.match /^ow/i
            return ["oo", 2]            
        if partialWord.match /^o/i
            return ["u", 1]
            
        if partialWord.match /^tion/i
            return ["shun", 4]
            
        if partialWord.match /^u/i
            return ["oo", 2]               
                      
               
    # anywhere-but-end-of-word rules
   
    wordWithoutPunctuation = partialWord.replace(/[\.!]+$/, "")
   
    if index isnt wordWithoutPunctuation.length - 1
        if wordWithoutPunctuation.match /^A/
            return ["E", 1]
        if wordWithoutPunctuation.match /^a/
            return ["e", 1]
            
            
    # end-of-word rules
    
    if wordWithoutPunctuation.match /^e$/i
        return ["e-a", 1]
    if wordWithoutPunctuation.match /^en$/i
        return ["ee", 2]
    if wordWithoutPunctuation.match /^th$/i
        return ["t", 2]            
    
    
    # borkification
    
    if partialWord.match /^[.!]$/
        if (Math.random() * 4.0) < 1.0
            return [partialWord[0] + " Bork bork bork!", 1]
    
    
    # no match
    
    return [word[index], 1]
    
    

#/* chef.x - convert English on stdin to Mock Swedish on stdout
# *
# * The WC definition matches any word character, and the NW definition matches
# * any non-word character.  Two start conditions are maintained: INW (in word)
# * and NIW (not in word).  The first rule passes TeX commands without change.
# *
# * HISTORY
# *
# * Apr 15, 1992; John Hagerman: Created.
# */
# 
# static int i_seen = 0;
# %}
# 
# WC             [A-Za-z']
# NW             [^A-Za-z']
# 
# %start         INW NIW
# 
# %%
# 
# \\[^ \n]+      ECHO;
# 
# {NW}           { BEGIN NIW; i_seen = 0; ECHO; }
# "."$           { BEGIN NIW; i_seen = 0; printf(".\nBork Bork Bork!"); }
# 
# <NIW>"bork"/{NW} ECHO;
# <NIW>"Bork"/{NW} ECHO;
# 
# "an"           { BEGIN INW; printf("un"); }
# "An"           { BEGIN INW; printf("Un"); }
# "au"           { BEGIN INW; printf("oo"); }
# "Au"           { BEGIN INW; printf("Oo"); }
# "a"/{WC}       { BEGIN INW; printf("e"); }
# "A"/{WC}       { BEGIN INW; printf("E"); }
# "en"/{NW}      { BEGIN INW; printf("ee"); }
# <INW>"ew"      { BEGIN INW; printf("oo"); }
# <INW>"e"/{NW}  { BEGIN INW; printf("e-a"); }
# <NIW>"e"       { BEGIN INW; printf("i"); }
# <NIW>"E"       { BEGIN INW; printf("I"); }
# <INW>"f"       { BEGIN INW; printf("ff"); }
# <INW>"ir"      { BEGIN INW; printf("ur"); }
# <INW>"i"       { BEGIN INW; printf(i_seen++ ? "i" : "ee"); }
# <INW>"ow"      { BEGIN INW; printf("oo"); }
# <NIW>"o"       { BEGIN INW; printf("oo"); }
# <NIW>"O"       { BEGIN INW; printf("Oo"); }
# <INW>"o"       { BEGIN INW; printf("u"); }
# "the"          { BEGIN INW; printf("zee"); }
# "The"          { BEGIN INW; printf("Zee"); }
# "th"/{NW}      { BEGIN INW; printf("t"); }
# <INW>"tion"    { BEGIN INW; printf("shun"); }
# <INW>"u"       { BEGIN INW; printf("oo"); }
# <INW>"U"       { BEGIN INW; printf("Oo"); }
# "v"            { BEGIN INW; printf("f"); }
# "V"            { BEGIN INW; printf("F"); }
# "w"            { BEGIN INW; printf("v"); }
# "W"            { BEGIN INW; printf("V"); }
# .              { BEGIN INW; ECHO; }
# 
# %%