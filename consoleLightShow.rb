=begin
        CONSOLE LIGHT SHOW
    An Application for Joshua D. Bruce
        By Robert Leslie 
                2019


                TODO: 
    -learn how to use time, so user can input length of time to run
    -Create method whether user wants to just spam one (or more?) strings OR
        print random letters in random colors
    -Check to see whether program runs faster in the command prompt.
=end
require 'pastel'
$pastel = Pastel.new
$prng = Random.new
$prng1 = Random.new

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

def printString(printMe)
    while true do
        v = printMe 
        case $prng1.rand(1..6)
        when 1
            v = $pastel.red(printMe)
        when 2
            v = $pastel.green(printMe)
        when 3
            v = $pastel.yellow(printMe)
        when 4
            v = $pastel.blue(printMe)
        when 5
            v = $pastel.magenta(printMe)
        when 6
            v = $pastel.cyan(printMe)
        end
        v = onMe(v)

        print "#{v}"
    end
end

def printRandom()

    
    st = "q,w,e,r,t,y,u,i,o,p,a,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m,Q,W,E,R,T,Y,U,I,O,P,A,S,D,F,G,H,J,K,L,Z,X,C,V,B,N,M,1,2,3,4,5,6,7,8,9,0,!,@,#,$,%,^,&,*,(,),_,+,[,],|,{,}"
    x = st.split(",")

    while true do
        v = ""
        case $prng1.rand(1..6)
        when 1
            v = $pastel.red(x[$prng.rand(0...x.length())])
        when 2
            v = $pastel.green(x[$prng.rand(0...x.length())])
        when 3
            v = $pastel.yellow(x[$prng.rand(0...x.length())])
        when 4
            v = $pastel.blue(x[$prng.rand(0...x.length())])
        when 5
            v = $pastel.magenta(x[$prng.rand(0...x.length())])
        when 6
            v = $pastel.cyan(x[$prng.rand(0...x.length())])
        end
        v = onMe(v)
        print "#{v}"
    end

end


print "-------------------------------------------------------------------------"
print "\nCONSOLELIGHTSHOW.rb\n"
print "A program for Joshua Bruce, By Robert Leslie\n"
print "-------------------------------------------------------------------------"
puts "\n1) Print Random Letters, Numbers, and Symbols (in an infinite loop)"
puts "2) Enter a string to be printed in random colors (in an infinite loop)"
coin = gets.to_i

case(coin)
when 1
    printRandom()
when 2
    puts "Enter string: "
    str = gets.chomp
    printString(str)
else
    puts "Undefined input, ending program"
end
