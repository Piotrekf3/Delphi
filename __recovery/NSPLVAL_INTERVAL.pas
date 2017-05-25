unit NSPLVAL_INTERVAL;

interface

uses
IntervalArithmetic32and64;

type vectorInterval  = array [0..20] of interval;
     vector1Interval = array [1..18] of interval;
     vector2Interval = array [2..19] of interval;
function naturalsplinevalue_interval(n      : Integer;
                             x,f    : vectorInterval;
                             xx     : interval;
                             var st : Integer) : interval;

implementation

function naturalsplinevalue_interval(n      : Integer;
                             x,f    : vectorInterval;
                             xx     : interval;
                             var st : Integer) : interval;
var i,k   : Integer;
    u,y,z : interval;
    found : Boolean;
    a     : array [0..3] of interval;
    d     : vectorInterval;
    b     : vector1Interval;
    c     : vector2Interval;
begin
  if n<1
    then st:=1
    else if (xx<x[0]) or (xx>x[n])
           then st:=3
           else begin
                  st:=0;
                  i:=-1;
                  repeat
                    i:=i+1;
                    for k:=i+1 to n do
                      if x[i]=x[k]
                        then st:=2
                  until (i=n-1) or (st=2)
                end;
  if st=0
    then begin
           d[0]:=0;
           d[n]:=0;
           if n>1
             then begin
                    z:=x[2];
                    y:=z-x[1];
                    z:=z-x[0];
                    u:=f[1];
                    b[1]:=y/z;
                    d[1]:=6*((f[2]-u)/y-(u-f[0])/(x[1]-x[0]))/z;
                    z:=x[n-2];
                    y:=x[n-1]-z;
                    z:=x[n]-z;
                    u:=f[n-1];
                    c[n-1]:=y/z;
                    d[n-1]:=6*((f[n]-u)/(x[n]-x[n-1])-(u-f[n-2])/y)/z;
                    for i:=2 to n-2 do
                      begin
                        z:=x[i];
                        y:=x[i+1]-z;
                        z:=z-x[i-1];
                        u:=f[i];
                        b[i]:=y/(y+z);
                        c[i]:=1-b[i];
                        d[i]:=6*((f[i+1]-u)/y-(u-f[i-1])/z)/(y+z)
                      end;
                    u:=2;
                    i:=0;
                    y:=d[1]/u;
                    d[1]:=y;
                    if n>2
                      then repeat
                             i:=i+1;
                             z:=b[i]/u;
                             b[i]:=z;
                             u:=2-z*c[i+1];
                             y:=(d[i+1]-y*c[i+1])/u;
                             d[i+1]:=y
                           until i=n-2
                  end;
           u:=d[n-1];
           for i:=n-2 downto 1 do
             begin
               u:=d[i]-u*b[i];
               d[i]:=u
             end;
           found:=False;
           i:=-1;
           repeat
             i:=i+1;
             if (xx>=x[i]) and (xx<=x[i+1])
               then found:=True
           until found;
           y:=x[i+1]-x[i];
           z:=d[i+1];
           u:=d[i];
           a[0]:=f[i];
           a[1]:=(f[i+1]-f[i])/y-(2*u+z)*y/6;
           a[2]:=u/2;
           a[3]:=(z-u)/(6*y);
           y:=a[3];
           z:=xx-x[i];
           for i:=2 downto 0 do
             y:=y*z+a[i];
           naturalsplinevalue_interval:=y
         end
end;
end.
