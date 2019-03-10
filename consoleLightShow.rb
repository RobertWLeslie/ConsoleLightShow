=begin
                            CONSOLE LIGHT SHOW
                    An Application for Joshua D. Bruce
                             By Robert Leslie 
                                   2019
=end
require 'pastel'
require 'tty'

$pastel = Pastel.new
$prng = Random.new
$prng1 = Random.new
$titleSlideFont = TTY::Font.new(:standard)
$fontFont = TTY::Font.new()

# titleSlide()
# This is the first method that runs, and then calls menu()
def titleSlide()
    print "\n-------------------------------------------------------------------------\n"
    print $titleSlideFont.write("Console Light Show")
    print "\nA program for Joshua Bruce\nWritten with love by Robert Leslie\n"
    print "---------------------------------------------------------------------------\n"
    menu()
end

# menu()
# instead of having to run a very long command line, every single method calls
# this function in some form to return the user to this place, which can then
# safely end the program (unless the user performs an interrupt using Ctrl + C 
# in the command\/terminal prompt, but that is not very nice, now is it?)
def menu()
    print "\n-------------------------------------------------------------------------\n"
    puts "1) Print Random Letters, Numbers, and Symbols (For a given set of time in seconds)"
    puts "2) Enter a string to be printed in random colors (For a given set of time in seconds)"
    puts "99) Beta Functions"
    puts "100) End Program"
    coin = gets.to_i
    
    case(coin)
    when 1
        printRandom(getDuration())
    when 2
        puts "Enter your strings to be printed, separated by a comma"
        str = gets.chomp
        printStringS(str, getDuration())
    when 99
        puts "Entering Beta Functions..."
        betaFuntions()
    when 100
        puts "Bye Bye"
    when -1
        infiniteLoopWarning(1)
    else
        puts "Undefined input"
        menu()
    end
end

# This method is a menu used to call and test functions which I quite haven't
# yet ironed out the kinks, I haven't thrown into the menu yet, or don't fit
# quite right for the menu
def betaFuntions()
    print "\n-------------------------------------------------------------------------\n"
    puts "These are the Beta Functions, these are functions that are not quite thought"
    puts "yet, I havne't put into the main menu yet, or isn't quite right for the menu"
    puts "Use these at your own discretion, I'm not your dad"
    puts "1) getIsMe()"
    puts "2) getOnMe() (heheheheh)"
    puts "3) printStringFont(string, duration)"
    puts "4) printRandomFont(duration)"
    puts "99) Infinite Loop warning Message"
    puts "100) Return to safety"
    coin = gets.to_i

    case(coin)
    when 1
        getIsMe()
    when 2
        getOnMe() #heheheheheh
    when 99
        infiniteLoopWarning(0)
    when 100
        menu()
    when 3
        puts "Enter your strings to be printed, separated by a comma"
        str = gets.chomp
        printStringRandomFont(str, getDuration())
    when 4
        printRandomFont(getDuration())
    else
        puts "Undefined Input\nReturning To Safety"
        menu()
    end
end

#isMe(str)
# Passed a string, and returns the string as a pastel with the background
# depending on a randomly generated number
def isMe(str)
    case $prng1.rand(1..6)
    when 1
        return $pastel.red(str)
    when 2
        return $pastel.green(str)
    when 3
        return $pastel.yellow(str)
    when 4
        return $pastel.blue(str)
    when 5
        return $pastel.magenta(str)
    when 6
        return $pastel.cyan(str)
    end
end

#onMe(str)
# Passed a string, and returns it as a pastel string with the background changed
# Depending on a random number
def onMe(str)
    case $prng1.rand(1..6)
    when 1
        return $pastel.on_red(str)
    when 2
        return $pastel.on_green(str)
    when 3
        return $pastel.on_yellow(str)
    when 4
        return $pastel.on_blue(str)
    when 5
        return $pastel.on_magenta(str)
    when 6
        return $pastel.on_cyan(str)
    end
end

def returnFont(str)
    case $prng1.rand(1..5)
    when 1
        #$fontFont = TTY::Font.new(:3d)
        #return $fontFont.write(str)
    when 2
        $fontFont = TTY::Font.new(:doom)
        return $fontFont.write(str)
    when 3
        $fontFont = TTY::Font.new(:standard)
        return $fontFont.write(str)
    when 4
        $fontFont = TTY::Font.new(:starwars)
        return $fontFont.write(str)
    when 5
        $fontFont = TTY::Font.new(:straight)
        return $fontFont.write(str)
    else
        $fontFont = TTY::Font.new(:standard)
        return $fontFont.write(str)
    end
end

# getIsMe()
# Returns an integer array (max 6) of user picked numbers, which corresponds to
# the colors that work well with the command prompt (this program has not yet
# been tested to work in any Linux Kernel, for reasons of lazyness)
# Note to self: GET THIS SHIT TO WORK, THEN MAKE EACH SELECTION REPRESENT THAT
# COLOR, DO THIS FOR getOnMe() TOO
def getIsMe()
    puts "Enter the colors you want the printed string to be"
    puts "1) Red\n2) Green\n3) Yellow\n4) Blue\n5) Magenta\n6) Cyan"
    $isMeString = gets.chomp.split(", ")
    (0...$isMeString.length()).each do |i|
        $isMeString[i] = $isMeString[i].to_i
    end
    puts "Chosen Numbers: #{$isMeString}"
end

# getOnMe()
# See: getIsMe(). Its exactly the same as that but it is for the background
# color of the stirng printed. I'm realising now that I can just call the 
# getisMe() method twice for a statement, but I like the name of this method too
# much, so I'm keeping it.
def getOnMe()
    puts "Enter the colors you want the background of the printed strings to be ON (the background)"
    puts "1) Red\n2) Green\n3) Yellow\n4) Blue\n5) Magenta\n6) Cyan"
    $onMeString = gets.chomp.split(", ")
    (0...$onMeString.length()).each do |i|
        $onMeString[i] = $onMeString[i].to_i
    end
    puts "Chosen Numbers: #{$onMeString}"
end

# Hahahha its not like I even need this method now, do I?
def getDuration()
    puts "Enter duration (in seconds)"
    return gets.to_i
end

#printRandom(int duration)
# Passed an integer, interpreted as a duration in seconds for a while loop to 
# run, prints out random symbols in a string array in randomly picked colors for
# a given duration, and then calls the menu function
def printRandom(duration)
    st = "q,w,e,r,t,y,u,i,o,p,a,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m,Q,W,E,R,T,Y,U,I,O,P,A,S,D,F,G,H,J,K,L,Z,X,C,V,B,N,M,1,2,3,4,5,6,7,8,9,0,!,@,#,$,%,^,&,*,(,),_,+,[,],|,{,}"
    x = st.split(",")
    currentTime = Time.now.to_i
    futureTime = currentTime + duration
    while (currentTime <= futureTime) do
        print "#{isMe(onMe( x[$prng.rand(0...x.length())] ))}"
        currentTime = Time.now.to_i
    end
    menu()
end

#printStringS(string printMe, int duration)
# Passed a string and a duration, the code creates a string array split at a 
# comma followed by a space. I know there can be some problems with this but
# this was the first thing that came to mind. I could use a regex but what ever.
# This does the same exact thing as the other printing functions so I expect the
# person reading this code to assume what this method does.
def printStringS(printMe, duration)
    x = printMe.split(", ")
    currentTime = Time.now.to_i
    futureTime = currentTime + duration
    while (currentTime <= futureTime) do
        print "#{isMe(onMe(x[$prng.rand(0...x.length())]))}"
        currentTime = Time.now.to_i
    end
    menu()
end

#printStringFont(printMe, duration)
# Passed a string and a duration, the code creates an array 
def printStringRandomFont(printMe, duration)
    x = printMe.split(", ")
    currentTime = Time.now.to_i
    futureTime = currentTime + duration
    while (currentTime <= futureTime) do
        print "#{isMe(onMe("\n#{returnFont(x[$prng.rand(0...x.length())])}\n\n"))}"
        currentTime = Time.now.to_i
    end
    menu()
end

#printRandomFont(duration)
# Prints random fonts in random colors. THere's a weird issue about a space at
# the end of the print statement and I don't like it :(
def printRandomFont(duration)
    st = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9"
    x = st.split(",")
    currentTime = Time.now.to_i
    futureTime = currentTime + duration
    while (currentTime <= futureTime)do
        print "#{isMe(onMe("\n#{returnFont(x[$prng.rand(0...x.length())])}\n\n"))}"
        currentTime = Time.now.to_i
    end
    menu()
end

#infiniteLoopWarning()
# This was written early in development incase I knew some logic at some point
# would cause an infinite loop. I'm keeping this method in here just in case 
# logic is written that could accidentally cause an infinite loop
#
# Note to self: make this into a box using TTY
def infiniteLoopWarning(whereAmIFrom)
    puts "______________________________________________________________________"
    puts "|********************************************************************|"
    puts "|********************************************************************|"
    puts "|***************************WARNING!*********************************|"
    puts "|*************This Method Causes an Infinite Loop!*******************|"
    puts "|*******To stop this infinite loop, press CTRL+C in the terminal*****|"
    puts "|**********If you wish to continue, enter 'Y' and hit return*********|"
    puts "|*********Otherwise, enter anything else and return to safety********|"
    puts "|********************************************************************|"
    puts "|********************************************************************|"
    puts "|____________________________________________________________________|"
    case(whereAmIFrom)
    when 0
        betaFuntions()
    when 1
        menu()
    else
        puts "I forgot where I came from, I'm going back to the main menu"
        menu()
    end
end

BEGIN{
    puts "Starting ConsoleLightShow.rb..... Enjoy the show!"
}

END{
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    puts "Twitter: @BeltedYapper"
    puts "Email: robert.leslie1997@gmail.com"
    puts "Console Light Show, a program for Joshua Bruce by Robert Leslie"
    puts "2019"
    puts "\"Stay Lucky\""
}

titleSlide()