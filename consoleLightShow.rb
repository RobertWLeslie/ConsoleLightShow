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


pastel = Pastel.new
st = "q,w,e,r,t,y,u,i,o,p,a,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m,Q,W,E,R,T,Y,U,I,O,P,A,S,D,F,G,H,J,K,L,Z,X,C,V,B,N,M,1,2,3,4,5,6,7,8,9,0,!,@,#,$,%,^,&,*,(,),_,+,[,],|,{,}"
x = st.split(",")


prng = Random.new
prng1 = Random.new
while true do
    v = ""
    case prng1.rand(1..6)
    when 1
        v = pastel.red(x[prng.rand(0...x.length())])
    when 2
        v = pastel.green(x[prng.rand(0...x.length())])
    when 3
        v = pastel.yellow(x[prng.rand(0...x.length())])
    when 4
        v = pastel.blue(x[prng.rand(0...x.length())])
    when 5
        v = pastel.magenta(x[prng.rand(0...x.length())])
    when 6
        v = pastel.cyan(x[prng.rand(0...x.length())])
    end
    case prng1.rand(1..6)
    when 1
        v = pastel.on_red(v)
    when 2
        v =  pastel.on_green(v)
    when 3
        v =  pastel.on_yellow(v)
    when 4
        v =  pastel.on_blue(v)
    when 5
        v =  pastel.on_magenta(v)
    when 6
        v = pastel.on_cyan(v)
    end
        print "#{v}"
end

=begin

=end