=begin
        CONSOLE LIGHT SHOW
    An Application for Joshua D. Bruce
        By Robert Leslie 
                2019


                TODO: 
    -learn how to use time, so user can input length of time to run

    -Check to see whether program runs faster in the command prompt.
=end
require 'pastel'
$pastel = Pastel.new
$prng = Random.new
$prng1 = Random.new

def menu()
    print "\n-------------------------------------------------------------------------"
    print "\nCONSOLELIGHTSHOW.rb\n"
    print "A program for Joshua Bruce, By Robert Leslie\n"
    print "-------------------------------------------------------------------------"
    puts "\n1) Print Random Letters, Numbers, and Symbols (For a given set of time in seconds)"
    puts "2) Enter a string to be printed in random colors (For a given set of time in seconds)"
    puts "3) Enter multiple strings to be printed in random colors (For a given set of time in seconds)"
    coin = gets.to_i
    
    case(coin)
    when 1
        printRandom(getDuration())
    when 2
        puts "Enter string: "
        str = gets.chomp
        printString(str, getDuration())
    when 3
        puts "Enter your strings to be printed, separated by a comma"
        str = gets.chomp
        printStringS(str, getDuration())
    else
        puts "Undefined input, ending program"
    end
end


def isMe(str)
    case $prng1.rand(1..6)
    when 1
        v = $pastel.red(str)
    when 2
        v = $pastel.green(str)
    when 3
        v = $pastel.yellow(str)
    when 4
        v = $pastel.blue(str)
    when 5
        v = $pastel.magenta(str)
    when 6
        v = $pastel.cyan(str)
    end
end

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

def getDuration()
    puts "Enter duration (in seconds)"
    return gets.to_i
end

def printString(printMe, duration)
    currentTime = Time.now.to_i
    futureTime = currentTime + duration
    while (currentTime <= futureTime) do
        print "#{isMe(onMe(printMe))}"
        currentTime = Time.now.to_i
    end
    menu()
end

def printRandom(duration)
    st = "q,w,e,r,t,y,u,i,o,p,a,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m,Q,W,E,R,T,Y,U,I,O,P,A,S,D,F,G,H,J,K,L,Z,X,C,V,B,N,M,1,2,3,4,5,6,7,8,9,0,!,@,#,$,%,^,&,*,(,),_,+,[,],|,{,}"
    x = st.split(",")
    currentTime = Time.now.to_i
    futureTime = currentTime + duration
    while (currentTime <= futureTime) do
        print "#{isMe(onMe(x[$prng.rand(0...x.length())]))}"
        currentTime = Time.now.to_i
    end
    menu()
end

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

def infiniteLoopWarning()
    puts "**********************************************************************"
    puts "**********************************************************************"
    puts "**********************************************************************"
    puts "****************************WARNING!**********************************"
    puts "**************This Method Causes an Infinite Loop!********************"
    puts "********To stop this infinite loop, press CTRL+C in the terminal******"
    puts "***********If you wish to continue, enter 'Y' and hit return**********"
    puts "**********Otherwise, enter anything else and return to safety*********"
    puts "**********************************************************************"
    puts "**********************************************************************"
    puts "**********************************************************************"
    puts "**********************************************************************"
    return gets.chomp.upcase
end

menu()